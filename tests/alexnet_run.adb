pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);
with AlexNet; use AlexNet;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Real_Time; use Ada.Real_Time;

with Float_Arrays; use Float_Arrays;
with Float_Arrays_Operators; use Float_Arrays_Operators;
with Float_Functions; use Float_Functions;
with Integer_Arrays; use Integer_Arrays;
with Utils; use Utils;
procedure AlexNet_Run is
    Start_Time: Time := Clock;
    End_Time: Time;
    data: Real_Tensor_4D (1..1, 1..3, 1..227, 1..227);
    prob: Real_Matrix (1..1, 1..1000);
    procedure External (Var_Name: String; Tensor: out Real_Tensor_4D) is
    begin
        Load_Image_Content(Argument(1), 1, Tensor);
    end External;
    pragma Inline (External);
    procedure External (Tensor: Real_Matrix; Var_Name: String) is
    begin
        Write_TFF_Data(Tensor, Var_Name & ".dat");
    end External;
    pragma Inline (External);
    Output2: Real_Vector (prob'Range(2));
    Sorted: Positive_Vector (Output2'Range);
    Class_Index: Natural;
begin
    external ("data", data);
    End_Time := Clock;
    Put_Line (Duration'Image (To_Duration (End_Time - Start_Time)) & " s");
    Start_Time := Clock;
    Forward (data, prob);
    End_Time := Clock;
    Put_Line (Duration'Image (To_Duration (End_Time - Start_Time)) & " s");
    external (prob, "prob");
    --  if Argument_Count > 2 then
    --      Trace (Argument(3));
    --  end if;
    Reshape(prob, Output2);
    Arg_Sort (Gt_Function, Output2, Sorted);
    for I in reverse Sorted'Last-5..Sorted'Last loop
        Class_Index := Sorted (I);
        declare
            Class_Name: String := Utils.Get_Line("class_names.txt", Class_Index);
        begin
            Put_Line(Class_Name & " " & Float'Image (Output2 (Sorted (I))));
        end;
    end loop;
    New_Line;
end AlexNet_Run;
