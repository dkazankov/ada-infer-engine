pragma Ada_95;
pragma Profile (Ravenscar);

with System; use System;
with Ada.Unchecked_Conversion;
with Ada.Numerics.Generic_Elementary_Functions;

package body NNEF_TFF_IO is

   procedure Test (Header: TFF_Header_Type) is
   begin
      if Header.Rank > 8 then
         raise TFF_Rank_Error;
      end if;
      if Header.Number_Of_Bits > 64 OR else Header.Number_Of_Bits = 0 then
         raise TFF_Bits_Per_Item_Error;
      end if;
      if Header.Item_Type_Code.Vendor_Code /= 2#0000# then
         raise TFF_Unknown_Vendor_Error;
      end if;
   end Test;

   procedure Read_TFF_Header (Stream: not null access Root_Stream_Type'Class; Header: out TFF_Header_Type) is
      Magic: NNEF_TFF_Magic_Type := (0, 0);
   begin
      NNEF_TFF_Magic_Type'Read(Stream, Magic);
      if Magic /= NNEF_TFF_Magic then
         raise TFF_Signature_Error;
      end if;
      --  Stream_Element'Read(Stream, Magic);
      --  if Magic /= 16#EF# then
      --     raise TFF_Signature_Error;
      --  end if;
      TFF_Header_Type'Read(Stream, Header);
      if Header.Rank > 8 then
         raise TFF_Rank_Error;
      end if;
      if Header.Number_Of_Bits > 64 OR else Header.Number_Of_Bits = 0 then
         raise TFF_Bits_Per_Item_Error;
      end if;
      if Header.Item_Type_Code.Vendor_Code /= 2#0000# then
         raise TFF_Unknown_Vendor_Error;
      end if;
   end Read_TFF_Header;

   procedure Write_TFF_Header (Header: TFF_Header_Type; Stream: not null access Root_Stream_Type'Class) is
   begin
      Stream_Element'Write(Stream, 16#4E#);
      Stream_Element'Write(Stream, 16#EF#);
      TFF_Header_Type'Write (Stream, Header);
   end Write_TFF_Header;

   procedure Increment_Index (Index: in out Unsigned_32_Array; Extents: Unsigned_32_Array) is
   begin
      for I in reverse Index'Range loop
         Index (I) := Index (I) + 1;
         exit when Index (I) < Extents (I);
         Index (I) := 0;
      end loop;
   end Increment_Index;

   procedure Swap (Left, Right: in out Stream_Element) is
      T: Stream_Element := Right;
   begin
      Right := Left;
      Left := T;
   end Swap;

   procedure Generic_Read_TFF_Data (Stream: not null access Root_Stream_Type'Class; Header: TFF_Header_Type) is
      Element_Size: constant Stream_Element_Offset := Stream_Element_Offset (Unsigned_32'Max (Header.Number_Of_Bits / 8, 1));
      Number_Of_Elements: constant Stream_Element_Offset := Stream_Element_Offset (Header.Length_In_Bytes) / Element_Size;
      Element: Stream_Element_Array (1..Element_Size);
      Last: Stream_Element_Offset;
      Bytes_Read: Stream_Element_Offset := 0;
      Index: Unsigned_32_Array(0..Header.Rank-1) := (others => 0);
   begin
      if Header.Number_Of_Bits >= 8 then
         for I in 1..Number_Of_Elements loop
            Read(Stream.all, Element, Last);
            Bytes_Read := Bytes_Read + Last;
            if Last < Element'Last then
               raise TFF_Format_Error;
            end if;
            if Default_Bit_Order = High_Order_First then
               if Element_Size > 1 then
                  for B in 1..Element_Size/2 loop
                     Swap (Element (B), Element (Element_Size - B + 1));
                  end loop;
               end if;
            end if;
            Callback (Index, Element);
            Increment_Index (Index, Header.Extents);
         end loop;
      else
         for I in 1..Number_Of_Elements loop
            Read(Stream.all, Element, Last);
            Bytes_Read := Bytes_Read + Last;
            if Last < Element'Last then
               raise TFF_Format_Error;
            end if;
            declare
               Mask: Unsigned_8 := 2 ** Natural(Header.Number_Of_Bits) - 1;
            begin
               for J in 0..8/Header.Number_Of_Bits-1 loop
                  Callback (Index, (1 => Stream_Element (Shift_Right (Unsigned_8(Element (1)), Natural (J*Header.Number_Of_Bits)) AND Mask)));
                  Increment_Index (Index, Header.Extents);
               end loop;
            end;
         end loop;
      end if;
      if Unsigned_32(Bytes_Read) /= Header.Length_In_Bytes then
         raise TFF_Format_Error;
      end if;
   end Generic_Read_TFF_Data;

   procedure Generic_Write_TFF_Data (Header: TFF_Header_Type; Stream: not null access Root_Stream_Type'Class) is
      Element_Size: constant Stream_Element_Offset := Stream_Element_Offset (Unsigned_32'Max(Header.Number_Of_Bits / 8, 1));
      Element: Stream_Element_Array(1..Element_Size);
      Byte: Unsigned_8 := 0;
      Bits: Unsigned_32 := 0;
      Bytes_Written: Stream_Element_Offset := 0;
      Index: Unsigned_32_Array(0..Header.Rank-1) := (others => 0);
      Volume: Unsigned_32 := 1;
   begin
      for I in Header.Extents'Range loop
         if Header.Extents(I) /= 0 then
            Volume := Volume * Header.Extents(I);
         end if;
      end loop;
      for I in 0..Volume-1 loop
         if Header.Number_Of_Bits < 8 then
            Callback (Index, Element);
            Byte := Byte OR Shift_Left (Unsigned_8 (Element (1)), Natural (Bits));
            Bits := Bits + Header.Number_Of_Bits;
            if Bits >= 8 then
               Element (1) := Stream_Element (Byte);
               Byte := 0;
            end if;
         else
            Callback (Index, Element);
            if Default_Bit_Order = High_Order_First then
               if Element_Size > 1 then
                  for B in 1..Element_Size/2 loop
                     Swap (Element (B), Element (Element_Size - B + 1));
                  end loop;
               end if;
            end if;
         end if;
         Increment_Index (Index, Header.Extents);
         if Header.Number_Of_Bits >= 8 OR else Bits >= 8 then
            Write(Stream.all, Element);
            Bytes_Written := Bytes_Written + Element_Size;
            Bits := 0;
         end if;
      end loop;
      if Header.Number_Of_Bits < 8 AND then Bits > 0 then
         Write(Stream.all, Element);
         Bytes_Written := Bytes_Written + Element_Size;
      end if;
      if Unsigned_32(Bytes_Written) /= Header.Length_In_Bytes then
         raise TFF_Format_Error;
      end if;
   end Generic_Write_TFF_Data;

   function Generic_To_Integer (Element: Stream_Element_Array; Header: TFF_Header_Type) return Result_Type is
   begin
      case Header.Item_Type_Code.Item_Type is
         when 2#0000# => -- float
            if Header.Number_Of_Bits > 32 then
               declare
                  Value64: IEEE_Float_64 := To_IEEE_Float_64(Element);
               begin
                  return Result_Type (IEEE_Float_64'Floor (Value64));
               end;
            elsif Header.Number_Of_Bits > 16 then
               declare
                  Value32: IEEE_Float_32 := To_IEEE_Float_32(Element);
               begin
                  return Result_Type (IEEE_Float_32'Floor (Value32));
               end;
            else
               declare
                  Value16: IEEE_Float_16 := To_IEEE_Float_16 (Element);
                  Value32: IEEE_Float_32 := IEEE_Float_16_To_32 (Value16);
               begin
                  return Result_Type (IEEE_Float_32'Floor (Value32));
               end;
            end if;
         when 2#0001# => -- integer
            declare
               Signed: Boolean := To_Unsigned_32 (Header.Parameters(0..3)) /= 0;
            begin
               if Header.Number_Of_Bits > 32 then
                  if Signed then
                     declare
                        Value64: Integer_64 := To_Integer_64 (Element);
                     begin
                        return Result_Type (Value64);
                     end;
                  else
                     declare
                        Value64: Unsigned_64 := To_Unsigned_64 (Element);
                     begin
                        return Result_Type (Value64);
                     end;
                  end if;
               elsif Header.Number_Of_Bits > 16 then
                  if Signed then
                     declare
                        Value32: Integer_32 := To_Integer_32 (Element);
                     begin
                        return Result_Type (Value32);
                     end;
                  else
                     declare
                        Value32: Unsigned_32 := To_Unsigned_32 (Element);
                     begin
                        return Result_Type (Value32);
                     end;
                  end if;
               else
                  if Signed then
                     declare
                        Value16: Integer_16 := To_Integer_16 (Element);
                     begin
                        return Result_Type (Value16);
                     end;
                  else
                     declare
                        Value16: Unsigned_16 := To_Unsigned_16 (Element);
                     begin
                        return Result_Type (Value16);
                     end;
                  end if;
               end if;
            end;
         when 2#0010# => -- quantized unsigned
            if Header.Number_Of_Bits > 32 then
               declare
                  Value: Unsigned_64 := To_Unsigned_64 (Element);
               begin
                  return Result_Type(Value);
               end;
            elsif Header.Number_Of_Bits > 16 then
               declare
                  Value: Unsigned_32 := To_Unsigned_32 (Element);
               begin
                  return Result_Type(Value);
               end;
            else
               declare
                  Value: Unsigned_16 := To_Unsigned_16 (Element);
               begin
                  return Result_Type(Value);
               end;
            end if;
         when 2#0011# => -- quantized signed
            if Header.Number_Of_Bits > 32 then
               declare
                  Value: Integer_64 := To_Integer_64 (Element);
               begin
                  return Result_Type(Value);
               end;
            elsif Header.Number_Of_Bits > 16 then
               declare
                  Value: Integer_32 := To_Integer_32 (Element);
               begin
                  return Result_Type(Value);
               end;
            else
               declare
                  Value: Integer_16 := To_Integer_16 (Element);
               begin
                  return Result_Type(Value);
               end;
            end if;
         when others =>
            raise TFF_Item_Type_Error;
      end case;
   end Generic_To_Integer;

   function Generic_To_Float (Element: Stream_Element_Array; Header: TFF_Header_Type) return Result_Type is
   begin
      case Header.Item_Type_Code.Item_Type is
         when 2#0000# => -- float
            if Header.Number_Of_Bits > 32 then
               declare
                  Value64: IEEE_Float_64 := To_IEEE_Float_64 (Element);
               begin
                  return Result_Type (Value64);
               end;
            elsif Header.Number_Of_Bits > 16 then
               declare
                  Value32: IEEE_Float_32 := To_IEEE_Float_32 (Element);
               begin
                  return Result_Type (Value32);
               end;
            else
               declare
                  Value16: IEEE_Float_16 := To_IEEE_Float_16 (Element);
                  Value32: IEEE_Float_32 := IEEE_Float_16_To_32 (Value16);
               begin
                  return Result_Type (Value32);
               end;
            end if;
         when 2#0001# => -- integer
            declare
               Signed: Boolean := To_Unsigned_32(Header.Parameters(0..3)) /= 0;
            begin
               if Header.Number_Of_Bits > 32 then
                  if Signed then
                     declare
                        Value64: Integer_64 := To_Integer_64 (Element);
                     begin
                        return Result_Type (Value64);
                     end;
                  else
                     declare
                        Value64: Unsigned_64 := To_Unsigned_64 (Element);
                     begin
                        return Result_Type (Value64);
                     end;
                  end if;
               elsif Header.Number_Of_Bits > 16 then
                  if Signed then
                     declare
                        Value32: Integer_32 := To_Integer_32 (Element);
                     begin
                        return Result_Type (Value32);
                     end;
                  else
                     declare
                        Value32: Unsigned_32 := To_Unsigned_32 (Element);
                     begin
                        return Result_Type (Value32);
                     end;
                  end if;
               else
                  if Signed then
                     declare
                        Value16: Integer_16 := To_Integer_16 (Element);
                     begin
                        return Result_Type (Value16);
                     end;
                  else
                     declare
                        Value16: Unsigned_16 := To_Unsigned_16 (Element);
                     begin
                        return Result_Type (Value16);
                     end;
                  end if;
               end if;
            end;
         when 2#0010# => -- quantized unsigned
            declare
               Min: IEEE_Float_32 := To_IEEE_Float_32(Header.Parameters(0..3));
               Max: IEEE_Float_32 := To_IEEE_Float_32(Header.Parameters(4..7));
            begin
               declare
                  Value32: Unsigned_32 := To_Unsigned_32 (Element);
                  Value: IEEE_Float_32 := Decode_Linear_Quantization (Value32, Min, Max);
               begin
                  return Result_Type(Value);
               end;
            end;
         when 2#0011# => -- quantized signed
            declare
               Min: IEEE_Float_32 := To_IEEE_Float_32(Header.Parameters(0..3));
               Max: IEEE_Float_32 := To_IEEE_Float_32(Header.Parameters(4..7));
            begin
               declare
                  Value32: Integer_32 := To_Integer_32 (Element);
                  Value: IEEE_Float_32 := Decode_Linear_Quantization (Value32, Min, Max);
               begin
                  return Result_Type(Value);
               end;
            end;
         when others =>
            raise TFF_Item_Type_Error;
      end case;
   end Generic_To_Float;

   function Generic_From_Integer (Value: Element_Type; Header: TFF_Header_Type) return Stream_Element_Array is
   begin
      case Header.Item_Type_Code.Item_Type is
         when 2#0000# => -- float
            if Header.Number_Of_Bits > 32 then
               declare
                  Value64: IEEE_Float_64 := IEEE_Float_64 (Value);
               begin
                  return To_Stream_Element_Array (Value64);
               end;
            elsif Header.Number_Of_Bits > 16 then
               declare
                  Value32: IEEE_Float_32 := IEEE_Float_32 (Value);
               begin
                  return To_Stream_Element_Array (Value32);
               end;
            else
               declare
                  Value32: IEEE_Float_32 := IEEE_Float_32 (Value);
                  Value16: IEEE_Float_16 := IEEE_Float_32_To_16 (Value32);
               begin
                  return To_Stream_Element_Array (Value16);
               end;
            end if;
         when 2#0001# => -- integer
            declare
               Signed: Boolean := To_Unsigned_32(Header.Parameters(0..3)) /= 0;
            begin
               if Header.Number_Of_Bits > 32 then
                  if Signed then
                     declare
                        Value64: Integer_64 := Integer_64 (Value);
                     begin
                        return To_Stream_Element_Array (Value64);
                     end;
                  else
                     declare
                        Value64: Unsigned_64 := Unsigned_64 (Value);
                     begin
                        return To_Stream_Element_Array (Value64);
                     end;
                  end if;
               elsif Header.Number_Of_Bits > 16 then
                  if Signed then
                     declare
                        Value32: Integer_32 := Integer_32 (Value);
                     begin
                        return To_Stream_Element_Array (Value32);
                     end;
                  else
                     declare
                        Value32: Unsigned_32 := Unsigned_32 (Value);
                     begin
                        return To_Stream_Element_Array (Value32);
                     end;
                  end if;
               else
                  if Signed then
                     declare
                        Value16: Integer_16 := Integer_16 (Value);
                     begin
                        return To_Stream_Element_Array (Value16);
                     end;
                  else
                     declare
                        Value16: Unsigned_16 := Unsigned_16 (Value);
                     begin
                        return To_Stream_Element_Array (Value16);
                     end;
                  end if;
               end if;
            end;
         when 2#0010# => -- quantized unsigned
            if Header.Number_Of_Bits > 32 then
               declare
                  Value64: Unsigned_64 := Unsigned_64 (Value);
               begin
                  return To_Stream_Element_Array (Value64);
               end;
            elsif Header.Number_Of_Bits > 16 then
               declare
                  Value32: Unsigned_32 := Unsigned_32 (Value);
               begin
                  return To_Stream_Element_Array (Value32);
               end;
            else
               declare
                  Value16: Unsigned_16 := Unsigned_16 (Value);
               begin
                  return To_Stream_Element_Array (Value16);
               end;
            end if;
         when 2#0011# => -- quantized signed
            if Header.Number_Of_Bits > 32 then
               declare
                  Value64: Integer_64 := Integer_64 (Value);
               begin
                  return To_Stream_Element_Array (Value64);
               end;
            elsif Header.Number_Of_Bits > 16 then
               declare
                  Value32: Integer_32 := Integer_32 (Value);
               begin
                  return To_Stream_Element_Array (Value32);
               end;
            else
               declare
                  Value16: Integer_16 := Integer_16 (Value);
               begin
                  return To_Stream_Element_Array (Value16);
               end;
            end if;
         when others =>
            raise TFF_Item_Type_Error;
      end case;
   end Generic_From_Integer;

   function Generic_From_Float (Value: Element_Type; Header: TFF_Header_Type) return Stream_Element_Array is
   begin
      case Header.Item_Type_Code.Item_Type is
         when 2#0000# => -- float
            if Header.Number_Of_Bits > 32 then
               declare
                  Value64: IEEE_Float_64 := IEEE_Float_64 (Value);
               begin
                  return To_Stream_Element_Array (Value64);
               end;
            elsif Header.Number_Of_Bits > 16 then
               declare
                  Value32: IEEE_Float_32 := IEEE_Float_32 (Value);
               begin
                  return To_Stream_Element_Array (Value32);
               end;
            else
               declare
                  Value32: IEEE_Float_32 := IEEE_Float_32 (Value);
                  Value16: IEEE_Float_16 := IEEE_Float_32_To_16 (Value32);
               begin
                  return To_Stream_Element_Array (Value16);
               end;
            end if;
         when 2#0001# => -- integer
            declare
               Signed: Boolean := To_Unsigned_32(Header.Parameters(0..3)) /= 0;
            begin
               if Header.Number_Of_Bits > 32 then
                  if Signed then
                     declare
                        Value64: Integer_64 := Integer_64 (Value);
                     begin
                        return To_Stream_Element_Array (Value64);
                     end;
                  else
                     declare
                        Value64: Unsigned_64 := Unsigned_64 (Value);
                     begin
                        return To_Stream_Element_Array (Value64);
                     end;
                  end if;
               elsif Header.Number_Of_Bits > 16 then
                  if Signed then
                     declare
                        Value32: Integer_32 := Integer_32 (Value);
                     begin
                        return To_Stream_Element_Array (Value32);
                     end;
                  else
                     declare
                        Value32: Unsigned_32 := Unsigned_32 (Value);
                     begin
                        return To_Stream_Element_Array (Value32);
                     end;
                  end if;
               else
                  if Signed then
                     declare
                        Value16: Integer_16 := Integer_16 (Value);
                     begin
                        return To_Stream_Element_Array (Value16);
                     end;
                  else
                     declare
                        Value16: Unsigned_16 := Unsigned_16 (Value);
                     begin
                        return To_Stream_Element_Array (Value16);
                     end;
                  end if;
               end if;
            end;
         when 2#0010# => -- quantized unsigned
            declare
               Min: IEEE_Float_32 := To_IEEE_Float_32(Header.Parameters(0..3));
               Max: IEEE_Float_32 := To_IEEE_Float_32(Header.Parameters(4..7));
            begin
               declare
                  Value32: IEEE_Float_32 := IEEE_Float_32 (Value);
                  ValueQ: Unsigned_32 := Encode_Linear_Quantization (Value32, Min, Max);
               begin
                  return To_Stream_Element_Array (ValueQ);
               end;
            end;
         when 2#0011# => -- quantized signed
            declare
               Min: IEEE_Float_32 := To_IEEE_Float_32(Header.Parameters(0..3));
               Max: IEEE_Float_32 := To_IEEE_Float_32(Header.Parameters(4..7));
            begin
               declare
                  Value32: IEEE_Float_32 := IEEE_Float_32 (Value);
                  ValueQ: Integer_32 := Encode_Linear_Quantization (Value32, Min, Max);
               begin
                  return To_Stream_Element_Array (ValueQ);
               end;
            end;
         when others =>
            raise TFF_Item_Type_Error;
      end case;
   end Generic_From_Float;

   function IEEE_Float_16_To_32 (Value: IEEE_Float_16) return IEEE_Float_32 is
      function Convert16 is new Ada.Unchecked_Conversion(Source => IEEE_Float_16, Target => Unsigned_16);
      Value16: Unsigned_16 := Convert16 (Value);
      Sign: Unsigned_16 := Value16 AND 2#1000_0000_0000_0000#; -- sign 15
      Exponent: Unsigned_16 := Value16 AND 2#0111_1100_0000_0000#; -- exponent 10-14
      Fraction: Unsigned_16 := Value16 AND 2#0000_0011_1111_1111#; -- fraction 0-9
      function Convert32 is new Ada.Unchecked_Conversion(Source => Unsigned_32, Target => IEEE_Float_32);
      Value32: Unsigned_32 := Shift_Left (Unsigned_32 (Sign), 16) OR  -- sign bits 31 (<< 16)
            Shift_Left (Unsigned_32 (Exponent), 13) OR   -- exponent bits 23-30 (<< 13)
            Shift_Left (Unsigned_32 (Fraction), 13);     -- fraction bits 0-22 (<< 13);
   begin
      return Convert32 (Value32);
   end IEEE_Float_16_To_32;

   function IEEE_Float_32_To_16 (Value: IEEE_Float_32) return IEEE_Float_16 is
      function Convert32 is new Ada.Unchecked_Conversion(Source => IEEE_Float_32, Target => Unsigned_32);
      Value32: Unsigned_32 := Convert32 (Value);
      Sign: Unsigned_32 := Value32 AND 2#1000_0000_0000_0000_0000_0000_0000_0000#; -- sign 31
      Exponent: Unsigned_32 := Value32 AND 2#0111_1111_1000_0000_0000_0000_0000_0000#; -- exponent 23-30
      Fraction: Unsigned_32 := Value32 AND 2#0000_0000_0111_1111_1111_1111_1111_1111#; -- fraction 0-22
      Value16: Unsigned_16 := Unsigned_16 (Shift_Right (Sign, 16)) OR                              -- sign 15 (>> 16)
            (Unsigned_16 (Shift_Right (Exponent, 13)) AND 2#0111_1100_0000_0000#) OR  -- exponent 10-14 (>> 13)
            (Unsigned_16 (Shift_Right (Fraction, 13)) AND 2#0000_0011_1111_1111#);    -- fraction 0-9 (>> 13)
      function Convert16 is new Ada.Unchecked_Conversion(Source => Unsigned_16, Target => IEEE_Float_16);
   begin
      return Convert16 (Value16);
   end IEEE_Float_32_To_16;

   function To_Boolean(Byte: Stream_Element_Array) return Boolean is
   begin
      return Byte (Byte'First) /= 0;
   end To_Boolean;

   function To_Boolean(Byte: Stream_Element_Array; Bit: Natural) return Boolean is
      Mask: Stream_Element := Stream_Element (Shift_Left (Unsigned_8'(1), Bit-1));
   begin
      return (Byte (Byte'First) AND Mask) /= 0;
   end To_Boolean;

   function To_Unsigned_8(Byte: Stream_Element_Array) return Unsigned_8 is
      function Convert is new Ada.Unchecked_Conversion(Source => Stream_Element_Array, Target => Unsigned_8);
   begin
      return Convert (Byte);
   end To_Unsigned_8;

   function To_Unsigned_16(Bytes: Stream_Element_Array) return Unsigned_16 is
      function Convert is new Ada.Unchecked_Conversion(Source => Stream_Element_Array, Target => Unsigned_16);
   begin
      return Convert (Bytes);
   end To_Unsigned_16;

   function To_Unsigned_32(Bytes: Stream_Element_Array) return Unsigned_32 is
      function Convert is new Ada.Unchecked_Conversion(Source => Stream_Element_Array, Target => Unsigned_32);
   begin
      return Convert (Bytes);
   end To_Unsigned_32;

   function To_Unsigned_64(Bytes: Stream_Element_Array) return Unsigned_64 is
      function Convert is new Ada.Unchecked_Conversion(Source => Stream_Element_Array, Target => Unsigned_64);
   begin
      return Convert (Bytes);
   end To_Unsigned_64;

   function To_Integer_8(Byte: Stream_Element_Array) return Integer_8 is
      function Convert is new Ada.Unchecked_Conversion(Source => Stream_Element_Array, Target => Integer_8);
   begin
      return Convert (Byte);
   end To_Integer_8;

   function To_Integer_16(Bytes: Stream_Element_Array) return Integer_16 is
      function Convert is new Ada.Unchecked_Conversion(Source => Stream_Element_Array, Target => Integer_16);
   begin
      return Convert (Bytes);
   end To_Integer_16;

   function To_Integer_32(Bytes: Stream_Element_Array) return Integer_32 is
      function Convert is new Ada.Unchecked_Conversion(Source => Stream_Element_Array, Target => Integer_32);
   begin
      return Convert (Bytes);
   end To_Integer_32;

   function To_Integer_64(Bytes: Stream_Element_Array) return Integer_64 is
      function Convert is new Ada.Unchecked_Conversion(Source => Stream_Element_Array, Target => Integer_64);
   begin
      return Convert (Bytes);
   end To_Integer_64;

   function To_IEEE_Float_16(Bytes: Stream_Element_Array) return IEEE_Float_16 is
      function Convert is new Ada.Unchecked_Conversion(Source => Stream_Element_Array, Target => IEEE_Float_16);
   begin
      return Convert (Bytes);
   end To_IEEE_Float_16;

   function To_IEEE_Float_32(Bytes: Stream_Element_Array) return IEEE_Float_32 is
      function Convert is new Ada.Unchecked_Conversion(Source => Stream_Element_Array, Target => IEEE_Float_32);
   begin
      return Convert (Bytes);
   end To_IEEE_Float_32;

   function To_IEEE_Float_64(Bytes: Stream_Element_Array) return IEEE_Float_64 is
      function Convert is new Ada.Unchecked_Conversion(Source => Stream_Element_Array, Target => IEEE_Float_64);
   begin
      return Convert (Bytes);
   end To_IEEE_Float_64;

   function To_Stream_Element_Array(Value: IEEE_Float_64) return Stream_Element_Array is
      subtype Stream_Element_Array_8 is Stream_Element_Array(1..8);
      function Convert is new Ada.Unchecked_Conversion(Source => IEEE_Float_64, Target => Stream_Element_Array_8);
   begin
      return Convert (Value);
   end To_Stream_Element_Array;

   function To_Stream_Element_Array(Value: IEEE_Float_32) return Stream_Element_Array is
      subtype Stream_Element_Array_4 is Stream_Element_Array(1..4);
      function Convert is new Ada.Unchecked_Conversion(Source => IEEE_Float_32, Target => Stream_Element_Array_4);
   begin
      return Convert (Value);
   end To_Stream_Element_Array;

   function To_Stream_Element_Array(Value: IEEE_Float_16) return Stream_Element_Array is
      subtype Stream_Element_Array_2 is Stream_Element_Array(1..2);
      function Convert is new Ada.Unchecked_Conversion(Source => IEEE_Float_16, Target => Stream_Element_Array_2);
   begin
      return Convert (Value);
   end To_Stream_Element_Array;

   function To_Stream_Element_Array(Value: Integer_64) return Stream_Element_Array is
      subtype Stream_Element_Array_8 is Stream_Element_Array(1..8);
      function Convert is new Ada.Unchecked_Conversion(Source => Integer_64, Target => Stream_Element_Array_8);
   begin
      return Convert (Value);
   end To_Stream_Element_Array;

   function To_Stream_Element_Array(Value: Integer_32) return Stream_Element_Array is
      subtype Stream_Element_Array_4 is Stream_Element_Array(1..4);
      function Convert is new Ada.Unchecked_Conversion(Source => Integer_32, Target => Stream_Element_Array_4);
   begin
      return Convert (Value);
   end To_Stream_Element_Array;

   function To_Stream_Element_Array(Value: Integer_16) return Stream_Element_Array is
      subtype Stream_Element_Array_2 is Stream_Element_Array(1..2);
      function Convert is new Ada.Unchecked_Conversion(Source => Integer_16, Target => Stream_Element_Array_2);
   begin
      return Convert (Value);
   end To_Stream_Element_Array;

   function To_Stream_Element_Array(Value: Integer_8) return Stream_Element_Array is
      subtype Stream_Element_Array_1 is Stream_Element_Array(1..1);
      function Convert is new Ada.Unchecked_Conversion(Source => Integer_8, Target => Stream_Element_Array_1);
   begin
      return Convert (Value);
   end To_Stream_Element_Array;

   function To_Stream_Element_Array(Value: Unsigned_64) return Stream_Element_Array is
      subtype Stream_Element_Array_8 is Stream_Element_Array(1..8);
      function Convert is new Ada.Unchecked_Conversion(Source => Unsigned_64, Target => Stream_Element_Array_8);
   begin
      return Convert (Value);
   end To_Stream_Element_Array;

   function To_Stream_Element_Array(Value: Unsigned_32) return Stream_Element_Array is
      subtype Stream_Element_Array_4 is Stream_Element_Array(1..4);
      function Convert is new Ada.Unchecked_Conversion(Source => Unsigned_32, Target => Stream_Element_Array_4);
   begin
      return Convert (Value);
   end To_Stream_Element_Array;

   function To_Stream_Element_Array(Value: Unsigned_16) return Stream_Element_Array is
      subtype Stream_Element_Array_2 is Stream_Element_Array(1..2);
      function Convert is new Ada.Unchecked_Conversion(Source => Unsigned_16, Target => Stream_Element_Array_2);
   begin
      return Convert (Value);
   end To_Stream_Element_Array;

   function To_Stream_Element_Array(Value: Unsigned_8) return Stream_Element_Array is
      subtype Stream_Element_Array_1 is Stream_Element_Array(1..1);
      function Convert is new Ada.Unchecked_Conversion(Source => Unsigned_8, Target => Stream_Element_Array_1);
   begin
      return Convert (Value);
   end To_Stream_Element_Array;

   function To_Stream_Element_Array(Value: Boolean) return Stream_Element_Array is
   begin
      if Value then
         return (1 => 1);
      else
         return (1 => 0);
      end if;
   end To_Stream_Element_Array;

   function Encode_Linear_Quantization(X, Min, Max: IEEE_Float_32) return Integer_32 is
      R: constant Integer_32 := 2 ** (Unsigned_32'Size-1) - 1;
      Q: Integer_32 := Integer_32 (IEEE_Float_32'Rounding ((Abs (X) - Min) / (Max - Min) * IEEE_Float_32 (R)));
   begin
      if X < 0.0 then
         return -Q;
      else
         return Q;
      end if;
   end Encode_Linear_Quantization;

   function Encode_Linear_Quantization(X, Min, Max: IEEE_Float_32) return Unsigned_32 is
      R: constant Unsigned_32 := 2 ** Unsigned_32'Size - 1;
      Q: Unsigned_32 := Unsigned_32 (IEEE_Float_32'Rounding ((X - Min) / (Max - Min) * IEEE_Float_32 (R)));
   begin
      return Q;
   end Encode_Linear_Quantization;

   function Decode_Linear_Quantization(Q: Integer_32; Min, Max: IEEE_Float_32) return IEEE_Float_32 is
      R: constant Integer_32 := 2 ** (Unsigned_32'Size-1) - 1;
      X: IEEE_Float_32 := IEEE_Float_32 (Q) / IEEE_Float_32 (R) * (Max - Min) + Min;
   begin
      if Q < 0 then
         return -X;
      else
         return X;
      end if;
   end Decode_Linear_Quantization;

   function Decode_Linear_Quantization(Q: Unsigned_32; Min, Max: IEEE_Float_32) return IEEE_Float_32 is
      R: constant Unsigned_32 := 2 ** Unsigned_32'Size - 1;
      X: IEEE_Float_32 := IEEE_Float_32 (Q) / IEEE_Float_32 (R) * (Max - Min) + Min;
   begin
      return X;
   end Decode_Linear_Quantization;

   package EF is new Ada.Numerics.Generic_Elementary_Functions(Float_Type => IEEE_Float_32);

   function Encode_Logarithmic_Quantization(X, Min, Max: IEEE_Float_32) return Integer_32 is
      R: constant Integer_32 := 2 ** (Unsigned_32'Size-1) - 1;
      M: Integer_32 := Integer_32 (IEEE_Float_32'Ceiling (EF.Log (Max) / EF.Log(2.0)));
      Q: Integer_32 := Integer_32 (IEEE_Float_32'Rounding (EF.Log (Abs (X)) / EF.Log(2.0))) - (M - R);
   begin
      if X < 0.0 then
         return -Q;
      else
         return Q;
      end if;
   end Encode_Logarithmic_Quantization;

   function Encode_Logarithmic_Quantization(X, Min, Max: IEEE_Float_32) return Unsigned_32 is
      R: constant Unsigned_32 := 2 ** Unsigned_32'Size - 1;
      M: Unsigned_32 := Unsigned_32 (IEEE_Float_32'Ceiling (EF.Log (Max) / EF.Log(2.0)));
      Q: Unsigned_32 := Unsigned_32 (IEEE_Float_32'Rounding (EF.Log (Abs (X)) / EF.Log(2.0))) - (M - R);
   begin
      return Q;
   end Encode_Logarithmic_Quantization;

   function Decode_Logarithmic_Quantization(Q: Integer_32; Min, Max: IEEE_Float_32) return IEEE_Float_32 is
      R: constant Integer_32 := 2 ** (Unsigned_32'Size-1) - 1;
      M: Integer_32 := Integer_32 (IEEE_Float_32'Ceiling (EF.Log (Max) / EF.Log(2.0)));
      X: IEEE_Float_32 := 2.0 ** Natural(Q + (M - R));
   begin
      if Q < 0 then
         return -X;
      else
         return X;
      end if;
   end Decode_Logarithmic_Quantization;

   function Decode_Logarithmic_Quantization(Q: Unsigned_32; Min, Max: IEEE_Float_32) return IEEE_Float_32 is
      R: constant Unsigned_32 := 2 ** Unsigned_32'Size - 1;
      M: Unsigned_32 := Unsigned_32 (IEEE_Float_32'Ceiling (EF.Log (Max) / EF.Log(2.0)));
      X: IEEE_Float_32 := 2.0 ** Natural(Q + (M - R));
   begin
      return X;
   end Decode_Logarithmic_Quantization;

end NNEF_TFF_IO;
