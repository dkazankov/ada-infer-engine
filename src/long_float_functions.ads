pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

with Ada.Numerics.Long_Elementary_Functions;
with Generic_Real_Functions;

package Long_Float_Functions is new Generic_Real_Functions (Float_Type => Long_Float, Elementary_Functions => Ada.Numerics.Long_Elementary_Functions);
pragma Preelaborate (Long_Float_Functions);
