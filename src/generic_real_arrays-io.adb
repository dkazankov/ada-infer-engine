pragma Ada_95;
pragma Profile (Ravenscar);

with Ada.Strings.Fixed;
with Interfaces;
with NNEF_TFF_IO;
--  with Ada.Unchecked_Conversion;

package body Generic_Real_Arrays.IO is

   procedure Put (Item: Real_Vector;
                  Fore : Field := Default_Fore;
                  Aft  : Field := Default_Aft;
                  Exp  : Field := Default_Exp;
                  Delimiter: String := Default_Delimiter
                 ) is
   begin
      Put(File => Standard_Output, Item => Item, Fore => Fore, Aft => Aft, Exp => Exp, Delimiter => Delimiter);
   end Put;

   procedure Put (Item: Real_Matrix;
                  Fore : Field := Default_Fore;
                  Aft  : Field := Default_Aft;
                  Exp  : Field := Default_Exp;
                  Delimiter: String := Default_Delimiter
                 ) is
   begin
      Put(File => Standard_Output, Item => Item, Fore => Fore, Aft => Aft, Exp => Exp, Delimiter => Delimiter);
   end Put;

   procedure Put (File: File_Type;
                  Item: Real_Vector;
                  Fore : Field := Default_Fore;
                  Aft  : Field := Default_Aft;
                  Exp  : Field := Default_Exp;
                  Delimiter: String := Default_Delimiter
                 ) is
      use Ada.Strings, Ada.Strings.Fixed;
   begin
      Put_Line(File => File, Item => Trim(Source => Positive'Image (Item'First), Side => Both) & ".." & Trim(Source => Positive'Image (Item'Last), Side => Both));
      for I in Item'Range loop
         Put(File => File, Item => Item(I), Fore => Fore, Aft => Aft, Exp => Exp);
         if I /= Item'Last then
            New_Line(File => File);
         end if;
      end loop;
   end Put;

   procedure Put (File: File_Type;
                  Item: Real_Matrix;
                  Fore : Field := Default_Fore;
                  Aft  : Field := Default_Aft;
                  Exp  : Field := Default_Exp;
                  Delimiter: String := Default_Delimiter
                 ) is
      use Ada.Strings, Ada.Strings.Fixed;
   begin
      Put_Line(File => File, Item => Trim(Source => Positive'Image (Item'First(1)), Side => Both) & ".." & Trim(Source => Positive'Image (Item'Last(1)), Side => Both) &
         Delimiter &
         Trim(Source => Positive'Image (Item'First(2)), Side => Both) & ".." & Trim(Source => Positive'Image (Item'Last(2)), Side => Both));
      for I in Item'Range(1) loop
         for J in Item'Range(2) loop
            if J /= Item'First(2) then
               Put(File => File, Item => Delimiter);
            end if;
            Put(File => File, Item => Item(I, J), Fore => Fore, Aft => Aft, Exp => Exp);
         end loop;
         if I /= Item'Last(1) then
            New_Line(File => File);
         end if;
      end loop;
   end Put;

   procedure Put (File: File_Type;
                  Item: Real_Tensor_3D;
                  Fore : Field := Default_Fore;
                  Aft  : Field := Default_Aft;
                  Exp  : Field := Default_Exp;
                  Delimiter: String := Default_Delimiter
                 ) is
      use Ada.Strings, Ada.Strings.Fixed;
   begin
      Put_Line(File => File, Item => Trim(Source => Positive'Image (Item'First(1)), Side => Both) & ".." & Trim(Source => Positive'Image (Item'Last(1)), Side => Both) &
         Delimiter &
         Trim(Source => Positive'Image (Item'First(2)), Side => Both) & ".." & Trim(Source => Positive'Image (Item'Last(2)), Side => Both) &
         Delimiter &
         Trim(Source => Positive'Image (Item'First(3)), Side => Both) & ".." & Trim(Source => Positive'Image (Item'Last(3)), Side => Both));
      for I in Item'Range(1) loop
         for J in Item'Range(2) loop
            if J /= Item'First(2) then
               New_Line(File => File);
            end if;
            for K in Item'Range(3) loop
               if K /= Item'First(3) then
                  Put(File => File, Item => Delimiter);
               end if;
               Put(File => File, Item => Item(I, J, K), Fore => Fore, Aft => Aft, Exp => Exp);
            end loop;
            if J /= Item'Last(2) then
               New_Line(File => File);
            end if;
         end loop;
         if I /= Item'Last(1) then
            New_Line(File => File);
         end if;
      end loop;
   end Put;

   procedure Put (File: File_Type;
                  Item: Real_Tensor_4D;
                  Fore : Field := Default_Fore;
                  Aft  : Field := Default_Aft;
                  Exp  : Field := Default_Exp;
                  Delimiter: String := Default_Delimiter
                 ) is
      use Ada.Strings, Ada.Strings.Fixed;
   begin
      Put_Line(File => File, Item => Trim(Source => Positive'Image (Item'First(1)), Side => Both) & ".." & Trim(Source => Positive'Image (Item'Last(1)), Side => Both) &
         Delimiter &
         Trim(Source => Positive'Image (Item'First(2)), Side => Both) & ".." & Trim(Source => Positive'Image (Item'Last(2)), Side => Both) &
         Delimiter &
         Trim(Source => Positive'Image (Item'First(3)), Side => Both) & ".." & Trim(Source => Positive'Image (Item'Last(3)), Side => Both));
      for I in Item'Range(1) loop
         for J in Item'Range(2) loop
            for K in Item'Range(3) loop
               if I /= Item'First(3) then
                  New_Line(File => File);
               end if;
               for L in Item'Range(4) loop
                  if L /= Item'First(4) then
                     Put(File => File, Item => Delimiter);
                  end if;
                  Put(File => File, Item => Item(I, J, K, L), Fore => Fore, Aft => Aft, Exp => Exp);
               end loop;
               if K /= Item'Last(3) then
                  New_Line(File => File);
               end if;
            end loop;
            if J /= Item'Last(2) then
               New_Line(File => File);
            end if;
         end loop;
         if I /= Item'Last(1) then
            New_Line(File => File);
         end if;
      end loop;
   end Put;

   use NNEF_TFF_IO;
   use Interfaces;

   procedure Read_TFF (File: Stream_IO.File_Type; Tensor: out Real_Vector) is
      use Ada.Streams.Stream_IO;
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

   procedure Read_TFF (File: Stream_IO.File_Type; Tensor: out Real_Matrix) is
      use Ada.Streams.Stream_IO;
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

   procedure Read_TFF (File: Stream_IO.File_Type; Tensor: out Real_Tensor_3D) is
      use Ada.Streams.Stream_IO;
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

   procedure Read_TFF (File: Stream_IO.File_Type; Tensor: out Real_Tensor_4D) is
      use Ada.Streams.Stream_IO;
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

    procedure Write_TFF (Tensor: Real_Vector; File: Stream_IO.File_Type) is
      use Ada.Streams.Stream_IO;
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

    procedure Write_TFF (Tensor: Real_Matrix; File: Stream_IO.File_Type) is
      use Ada.Streams.Stream_IO;
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

    procedure Write_TFF (Tensor: Real_Tensor_3D; File: Stream_IO.File_Type) is
      use Ada.Streams.Stream_IO;
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
    
    procedure Write_TFF (Tensor: Real_Tensor_4D; File: Stream_IO.File_Type) is
      use Ada.Streams.Stream_IO;
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

end Generic_Real_Arrays.IO;
