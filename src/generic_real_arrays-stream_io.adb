pragma Ada_95;
pragma Profile (Ravenscar);

with Interfaces; use Interfaces;
with NNEF_TFF_IO; use NNEF_TFF_IO;

package body Generic_Real_Arrays.Stream_IO is

   procedure Read_Elements (Stream: not null access Root_Stream_Type'Class) is
      Magic: Stream_Element_Array (1..2);
   begin
      Stream_Element_Array'Read(Stream, Magic);
      if Magic (1) = NNEF_TFF_Magic (1)
            AND then Magic (2) = NNEF_TFF_Magic (2) then
         declare
            Header: TFF_Header_Type;
            procedure Got_Element(Value: Real; Index: Index_Type) renames Element;
            function To_Real is new Generic_To_Float(Result_Type => Real);
            procedure Callback(Index: Unsigned_32_Array; Element: Stream_Element_Array) is
               Index1: Index_Type (Natural(Index'First)..Natural(Index'Last));
            begin
               for I in Index'Range loop
                  Index1 (Natural(I)) := Natural (Index (I));
               end loop;
               Got_Element (To_Real (Element, Header), Index1);
            end;
            pragma Inline (Callback);
            procedure Read_Data is new Generic_Read_TFF_Data(Callback => Callback);
         begin
            TFF_Header_Type'Read(Stream, Header);
            Test (Header);
            if Header.Number_Of_Bits > Real'Size then
               raise TFF_Item_Type_Error;
            end if;
            if Header.Item_Type_Code.Item_Type /= 2#0000# AND then
               Header.Item_Type_Code.Item_Type /= 2#0010# AND then
               Header.Item_Type_Code.Item_Type /= 2#0011# then
               raise TFF_Item_Type_Error;
            end if;
            Read_Data (Stream, Header);
         end;
      end if;
   end Read_Elements;

   procedure Read_TFF (File: File_Type; Tensor: out Real_Vector) is
      In_Stream: Stream_Access := Stream(File);
      Header: TFF_Header_Type;
      function To_Real is new Generic_To_Float(Result_Type => Real);
      procedure Callback(Index: Unsigned_32_Array; Element: Stream_Element_Array) is
      begin
         Tensor (Natural (Index (0))+1) := To_Real(Element, Header);
      end;
      pragma Inline (Callback);
      procedure Read_Data is new Generic_Read_TFF_Data(Callback => Callback);
   begin
      Read_TFF_Header(In_Stream, Header);
      if Header.Number_Of_Bits > Real'Size then
         raise TFF_Item_Type_Error;
      end if;
      if Header.Rank /= 1 then
         raise TFF_Rank_Error;
      end if;
      if Tensor'Length /= Integer(Header.Extents(0)) then
         raise TFF_Tensor_Extents_Error;
      end if;
      if Header.Item_Type_Code.Vendor_Code = 0 then
         if Header.Item_Type_Code.Item_Type /= 2#0000# AND then
            Header.Item_Type_Code.Item_Type /= 2#0010# AND then
            Header.Item_Type_Code.Item_Type /= 2#0011# then
            raise TFF_Item_Type_Error;
         end if;
      else
         raise TFF_Item_Type_Error;
      end if;
      Read_Data (In_Stream, Header);
   end Read_TFF;

   procedure Read_TFF (File: File_Type; Tensor: out Real_Matrix) is
      In_Stream: Stream_Access := Stream(File);
      Header: TFF_Header_Type;
      function To_Real is new Generic_To_Float(Result_Type => Real);
      procedure Callback(Index: Unsigned_32_Array; Element: Stream_Element_Array) is
      begin
         Tensor (Natural (Index (0))+1, Natural (Index (1))+1) := To_Real(Element, Header);
      end;
      pragma Inline (Callback);
      procedure Read_Data is new Generic_Read_TFF_Data(Callback => Callback);
   begin
      Read_TFF_Header(In_Stream, Header);
      if Header.Number_Of_Bits > Real'Size then
         raise TFF_Item_Type_Error;
      end if;
      if Header.Rank /= 2 then
         raise TFF_Rank_Error;
      end if;
      if Tensor'Length(1) /= Integer(Header.Extents(0)) OR else
         Tensor'Length(2) /= Integer(Header.Extents(1)) then
         raise TFF_Tensor_Extents_Error;
      end if;
      if Header.Item_Type_Code.Vendor_Code = 0 then
         if Header.Item_Type_Code.Item_Type /= 2#0000# AND then
            Header.Item_Type_Code.Item_Type /= 2#0010# AND then
            Header.Item_Type_Code.Item_Type /= 2#0011# then
            raise TFF_Item_Type_Error;
         end if;
      else
         raise TFF_Item_Type_Error;
      end if;
      pragma Inline (Callback);
      Read_Data (In_Stream, Header);
   end Read_TFF;

   procedure Read_TFF (File: File_Type; Tensor: out Real_Tensor_3D) is
      In_Stream: Stream_Access := Stream(File);
      Header: TFF_Header_Type;
      function To_Real is new Generic_To_Float(Result_Type => Real);
      procedure Callback(Index: Unsigned_32_Array; Element: Stream_Element_Array) is
      begin
         Tensor (Natural (Index (0))+1, Natural (Index (1))+1, Natural (Index (2))+1) := To_Real(Element, Header);
      end;
      pragma Inline (Callback);
      procedure Read_Data is new Generic_Read_TFF_Data(Callback => Callback);
   begin
      Read_TFF_Header(In_Stream, Header);
      if Header.Number_Of_Bits > Real'Size then
         raise TFF_Item_Type_Error;
      end if;
      if Header.Rank /= 3 then
         raise TFF_Rank_Error;
      end if;
      if Tensor'Length(1) /= Integer(Header.Extents(0)) OR else
         Tensor'Length(2) /= Integer(Header.Extents(1)) OR else
         Tensor'Length(3) /= Integer(Header.Extents(2)) then
         raise TFF_Tensor_Extents_Error;
      end if;
      if Header.Item_Type_Code.Vendor_Code = 0 then
         if Header.Item_Type_Code.Item_Type /= 2#0000# AND then
            Header.Item_Type_Code.Item_Type /= 2#0010# AND then
            Header.Item_Type_Code.Item_Type /= 2#0011# then
            raise TFF_Item_Type_Error;
         end if;
      else
         raise TFF_Item_Type_Error;
      end if;
      Read_Data (In_Stream, Header);
   end Read_TFF;

   procedure Read_TFF (File: File_Type; Tensor: out Real_Tensor_4D) is
      In_Stream: Stream_Access := Stream(File);
      Header: TFF_Header_Type;
      function To_Real is new Generic_To_Float(Result_Type => Real);
      procedure Callback(Index: Unsigned_32_Array; Element: Stream_Element_Array) is
      begin
         Tensor (Natural (Index (0))+1, Natural (Index (1))+1, Natural (Index (2))+1, Natural (Index (3))+1) := To_Real(Element, Header);
      end;
      pragma Inline (Callback);
      procedure Read_Data is new Generic_Read_TFF_Data(Callback => Callback);
   begin
      Read_TFF_Header(In_Stream, Header);
      if Header.Number_Of_Bits > Real'Size then
         raise TFF_Item_Type_Error;
      end if;
      if Header.Rank /= 4 then
         raise TFF_Rank_Error;
      end if;
      if Tensor'Length(1) /= Integer(Header.Extents(0)) OR else
         Tensor'Length(2) /= Integer(Header.Extents(1)) OR else
         Tensor'Length(3) /= Integer(Header.Extents(2)) OR else
         Tensor'Length(4) /= Integer(Header.Extents(3)) then
         raise TFF_Tensor_Extents_Error;
      end if;
      if Header.Item_Type_Code.Vendor_Code = 0 then
         if Header.Item_Type_Code.Item_Type /= 2#0000# AND then
            Header.Item_Type_Code.Item_Type /= 2#0010# AND then
            Header.Item_Type_Code.Item_Type /= 2#0011# then
            raise TFF_Item_Type_Error;
         end if;
      else
         raise TFF_Item_Type_Error;
      end if;
      Read_Data (In_Stream, Header);
   end Read_TFF;

    procedure Write_TFF (Tensor: Real_Vector; File: File_Type) is
      Out_Stream: Stream_Access := Stream(File);
      Header: TFF_Header_Type;
      function To_Array is new Generic_From_Float(Element_Type => Real);
      procedure Callback(Index: Unsigned_32_Array; Element: out Stream_Element_Array) is
      begin
         Element := To_Array (Tensor (Natural (Index (0))+1), Header);
      end;
      procedure Write_Data is new Generic_Write_TFF_Data(Callback => Callback);
   begin
      Header.Version_Info := (Version_Info_Major => 1, Version_Info_Minor => 0);
      Header.Length_In_Bytes := Real'Size * Tensor'Length / 8;
      Header.Rank := 1;
      Header.Extents := (0 => Tensor'Length, others => 0);
      Header.Number_Of_Bits := Real'Size;
      Header.Item_Type_Code := (Vendor_Code => 0, Item_Type => 0);
      Header.Parameters := (others => 0);
      Write_TFF_Header (Header, Out_Stream);
      Write_Data (Header, Out_Stream);
   end Write_TFF;

    procedure Write_TFF (Tensor: Real_Matrix; File: File_Type) is
      Out_Stream: Stream_Access := Stream(File);
      Header: TFF_Header_Type;
      function To_Array is new Generic_From_Float(Element_Type => Real);
      procedure Callback(Index: Unsigned_32_Array; Element: out Stream_Element_Array) is
      begin
         Element := To_Array (Tensor (Natural (Index (0))+1, Natural (Index (1))+1), Header);
      end;
      procedure Write_Data is new Generic_Write_TFF_Data(Callback => Callback);
   begin
      Header.Version_Info := (Version_Info_Major => 1, Version_Info_Minor => 0);
      Header.Length_In_Bytes := Real'Size * Tensor'Length(1) * Tensor'Length(2) / 8;
      Header.Rank := 2;
      Header.Extents := (0 => Tensor'Length(1), 1 => Tensor'Length(2), others => 0);
      Header.Number_Of_Bits := Real'Size;
      Header.Item_Type_Code := (Vendor_Code => 0, Item_Type => 0);
      Header.Parameters := (others => 0);
      Write_TFF_Header (Header, Out_Stream);
      Write_Data (Header, Out_Stream);
   end Write_TFF;

    procedure Write_TFF (Tensor: Real_Tensor_3D; File: File_Type) is
      Out_Stream: Stream_Access := Stream(File);
      Header: TFF_Header_Type;
      function To_Array is new Generic_From_Float(Element_Type => Real);
      procedure Callback(Index: Unsigned_32_Array; Element: out Stream_Element_Array) is
      begin
         Element := To_Array (Tensor (Natural (Index (0))+1, Natural (Index (1))+1, Natural (Index (2))+1), Header);
      end;
      procedure Write_Data is new Generic_Write_TFF_Data(Callback => Callback);
   begin
      Header.Version_Info := (Version_Info_Major => 1, Version_Info_Minor => 0);
      Header.Length_In_Bytes := Real'Size * Tensor'Length(1) * Tensor'Length(2) * Tensor'Length(3) / 8;
      Header.Rank := 3;
      Header.Extents := (0 => Tensor'Length(1), 1 => Tensor'Length(2), 2 => Tensor'Length(3), others => 0);
      Header.Number_Of_Bits := Real'Size;
      Header.Item_Type_Code := (Vendor_Code => 0, Item_Type => 0);
      Header.Parameters := (others => 0);
      Write_TFF_Header (Header, Out_Stream);
      Write_Data (Header, Out_Stream);
   end Write_TFF;
    
    procedure Write_TFF (Tensor: Real_Tensor_4D; File: File_Type) is
      Out_Stream: Stream_Access := Stream(File);
      Header: TFF_Header_Type;
      function To_Array is new Generic_From_Float(Element_Type => Real);
      procedure Callback(Index: Unsigned_32_Array; Element: out Stream_Element_Array) is
      begin
         Element := To_Array (Tensor (Natural (Index (0))+1, Natural (Index (1))+1, Natural (Index (2))+1, Natural (Index (3))+1), Header);
      end;
      procedure Write_Data is new Generic_Write_TFF_Data(Callback => Callback);
   begin
      Header.Version_Info := (Version_Info_Major => 1, Version_Info_Minor => 0);
      Header.Length_In_Bytes := Real'Size * Tensor'Length(1) * Tensor'Length(2) * Tensor'Length(3) * Tensor'Length(4) / 8;
      Header.Rank := 4;
      Header.Extents := (0 => Tensor'Length(1), 1 => Tensor'Length(2), 2 => Tensor'Length(3), 3 => Tensor'Length(4), others => 0);
      Header.Number_Of_Bits := Real'Size;
      Header.Item_Type_Code := (Vendor_Code => 0, Item_Type => 0);
      Header.Parameters := (others => 0);
      Write_TFF_Header (Header, Out_Stream);
      Write_Data (Header, Out_Stream);
   end Write_TFF;

end Generic_Real_Arrays.Stream_IO;
