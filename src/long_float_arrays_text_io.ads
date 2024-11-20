pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

with Long_Float_Arrays;
with Generic_Real_Arrays.Text_IO;
with Ada.Long_Float_Text_IO;

package Long_Float_Arrays_Text_IO is new Long_Float_Arrays.Text_IO (Float_IO => Ada.Long_Float_Text_IO);
