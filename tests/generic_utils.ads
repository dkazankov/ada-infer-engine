pragma Ada_95;

with Ada.Text_IO;
with Generic_Real_Arrays;
with Generic_Real_Arrays.IO;

generic

    type Real is digits <>;
    with package Real_Arrays is new Generic_Real_Arrays(Real => Real);
    use Real_Arrays;

package Generic_Utils is

    package IO is new Real_Arrays.IO;

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

end Generic_Utils;