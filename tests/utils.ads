pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

with Ada.Text_IO;
with Float_Arrays; use Float_Arrays;

package Utils is

    procedure Load_Image_Content (Path: String; Index: Positive; Tensor: out Real_Tensor_4D);

    function Get_Line (File: Ada.Text_IO.File_Type) return String;
    Index_Not_Found_Error: exception;
    function Get_Line (Path: String; Index: Natural) return String;

    procedure Load_TFF_Data (Path: String; Tensor: out Real_Vector);
    procedure Load_TFF_Data (Path: String; Tensor: out Real_Matrix);
    procedure Load_TFF_Data (Path: String; Tensor: out Real_Tensor_4D);

    procedure Write_TFF_Data (Tensor: Real_Vector; Path: String);
    procedure Write_TFF_Data (Tensor: Real_Matrix; Path: String);
    procedure Write_TFF_Data (Tensor: Real_Tensor_4D; Path: String);

    procedure Put (Tensor: Real_Vector; Path: String);
    procedure Put (Tensor: Real_Matrix; Path: String);
    procedure Put (Tensor: Real_Tensor_4D; Path: String);

end Utils;