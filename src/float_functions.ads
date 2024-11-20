pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

with Ada.Numerics.Elementary_Functions;
with Generic_Real_Functions;

package Float_Functions is new Generic_Real_Functions (Float_Type => Float, Elementary_Functions => Ada.Numerics.Elementary_Functions);
pragma Preelaborate (Float_Functions);
