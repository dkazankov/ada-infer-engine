pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
use Ada.Streams;

generic
package Generic_Real_Arrays.Stream_IO is

    pragma Preelaborate (Generic_Real_Arrays.Stream_IO);

    TFF_Tensor_Extents_Error: exception;

    generic
        type Index_Type is array (Natural range <>) of Natural;
        with procedure Element(Value: Real; Index: Index_Type);
    procedure Read_Elements (Stream: not null access Root_Stream_Type'Class);

    procedure Read_TFF (File: File_Type; Tensor: out Real_Vector);
    procedure Read_TFF (File: File_Type; Tensor: out Real_Matrix);
    procedure Read_TFF (File: File_Type; Tensor: out Real_Tensor_3D);
    procedure Read_TFF (File: File_Type; Tensor: out Real_Tensor_4D);

    procedure Write_TFF (Tensor: Real_Vector; File: File_Type);
    procedure Write_TFF (Tensor: Real_Matrix; File: File_Type);
    procedure Write_TFF (Tensor: Real_Tensor_3D; File: File_Type);
    procedure Write_TFF (Tensor: Real_Tensor_4D; File: File_Type);

end Generic_Real_Arrays.Stream_IO;
