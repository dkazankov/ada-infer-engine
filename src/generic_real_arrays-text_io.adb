pragma Ada_95;
pragma Profile (Ravenscar);

with Ada.Strings.Fixed;

package body Generic_Real_Arrays.Text_IO is

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

end Generic_Real_Arrays.Text_IO;
