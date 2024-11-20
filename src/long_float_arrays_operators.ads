pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

with Long_Float_Arrays;
with Generic_Real_Arrays.Operators;
with Ada.Numerics.Long_Elementary_Functions;
with Long_Float_Functions;

package Long_Float_Arrays_Operators is new Long_Float_Arrays.Operators (Elementary_Functions => Ada.Numerics.Long_Elementary_Functions, Real_Functions => Long_Float_Functions);
pragma Preelaborate (Long_Float_Arrays_Operators);
