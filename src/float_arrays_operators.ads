pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

with Float_Arrays;
with Generic_Real_Arrays.Operators;
with Ada.Numerics.Elementary_Functions;
with Float_Functions;

package Float_Arrays_Operators is new Float_Arrays.Operators (Elementary_Functions => Ada.Numerics.Elementary_Functions, Real_Functions => Float_Functions);
pragma Preelaborate (Float_Arrays_Operators);
