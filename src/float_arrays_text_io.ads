pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

with Float_Arrays;
with Generic_Real_Arrays.Text_IO;
with Ada.Float_Text_IO;

package Float_Arrays_Text_IO is new Float_Arrays.Text_IO (Float_IO => Ada.Float_Text_IO);
