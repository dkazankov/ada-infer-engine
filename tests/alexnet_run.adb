pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);
with AlexNet; use AlexNet;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Real_Time; use Ada.Real_Time;
with Generic_Utils;
procedure AlexNet_Run is
    use AlexNet.Real_Arrays;
    Start_Time: Time := Clock;
    End_Time: Time;
    package Utils is new Generic_Utils(Real => Float, Real_Arrays => Real_Arrays);
    procedure External (Var_Name: String; Tensor: out Real_Tensor_4D) is
    begin
        Utils.Load_Image_Content(Argument(1), 1, Tensor);
        End_Time := Clock;
        Put_Line (Duration'Image (To_Duration (End_Time - Start_Time)) & " s");
        Start_Time := Clock;
    end External;
    procedure Variable (Var_Name: String; Tensor: out Real_Matrix) is
    begin
        Utils.Load_TFF_Data(Argument(2) & Var_Name & ".dat", Tensor);
    end Variable;
    procedure Variable (Var_Name: String; Tensor: out Real_Tensor_4D) is
    begin
        Utils.Load_TFF_Data(Argument(2) & Var_Name & ".dat", Tensor);
    end Variable;
    procedure Output (Tensor: Real_Matrix; Var_Name: String) is
        Output2: Real_Vector (Tensor'Range(2));
        Sorted: Positive_Vector (Output2'Range);
        Class_Index: Natural;
    begin
        Utils.Write_TFF_Data(Tensor, Var_Name & ".dat");
        End_Time := Clock;
        Put_Line (Duration'Image (To_Duration (End_Time - Start_Time)) & " s");

        Reshape(Tensor, Output2);
        Arg_Sort (Output2, Gt_Function, Sorted);

        for I in reverse Sorted'Last-5..Sorted'Last loop
            Class_Index := Sorted (I);
            declare
                Class_Name: String := Utils.Get_Line("class_names.txt", Class_Index);
            begin
                Put_Line(Class_Name & " " & Float'Image (Output2 (Sorted (I))));
            end;
        end loop;
        New_Line;
    end Output;
begin
    variable ("fc7_blob1", variable_12);
    variable ("fc7_blob2", variable_13);
    variable ("fc8_blob1", variable_14);
    variable ("fc8_blob2", variable_15);
    variable ("fc6_blob1", variable_10);
    variable ("conv5_blob2", variable_9);
    variable ("conv5_blob1", variable_8);
    variable ("conv4_blob1", variable_6);
    variable ("conv3_blob2", variable_5);
    variable ("conv3_blob1", variable_4);
    variable ("conv2_blob1", variable_2);
    variable ("conv1_blob1", variable_0);
    variable ("conv1_blob2", variable_1);
    variable ("conv2_blob2", variable_3);
    variable ("conv4_blob2", variable_7);
    variable ("fc6_blob2", variable_11);
    external ("data", data);
    Forward;
    Output (prob, "prob");
end AlexNet_Run;
