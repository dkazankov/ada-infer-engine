pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);
with Float_Arrays; use Float_Arrays;
package AlexNet is
    pragma Remote_Call_Interface;
    procedure Forward (data: Real_Tensor_4D; prob: out Real_Matrix);
    --  procedure Trace (Path: String);
end AlexNet;
