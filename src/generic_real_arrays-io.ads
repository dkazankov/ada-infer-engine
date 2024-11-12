pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

with Ada.Text_IO;
with Ada.Streams.Stream_IO;

generic
package Generic_Real_Arrays.IO is

    package Float_IO is new Ada.Text_IO.Float_IO (Real);
    use Float_IO;

    Default_Delimiter: constant String := (1 => ASCII.HT);

    use Ada.Text_IO;
    
    procedure Put (Item: Real_Vector;
                    Fore: Field := Default_Fore;
                    Aft : Field := Default_Aft;
                    Exp : Field := Default_Exp;
                    Delimiter: String := Default_Delimiter
                    );
    procedure Put (Item: Real_Matrix;
                    Fore: Field := Default_Fore;
                    Aft : Field := Default_Aft;
                    Exp : Field := Default_Exp;
                    Delimiter: String := Default_Delimiter
                    );

    procedure Put (File: File_Type;
                    Item: Real_Vector;
                    Fore : Field := Default_Fore;
                    Aft  : Field := Default_Aft;
                    Exp  : Field := Default_Exp;
                    Delimiter: String := Default_Delimiter
                    );
    procedure Put (File: File_Type;
                    Item: Real_Matrix;
                    Fore : Field := Default_Fore;
                    Aft  : Field := Default_Aft;
                    Exp  : Field := Default_Exp;
                    Delimiter: String := Default_Delimiter
                    );
    procedure Put (File: File_Type;
                    Item: Real_Tensor_3D;
                    Fore : Field := Default_Fore;
                    Aft  : Field := Default_Aft;
                    Exp  : Field := Default_Exp;
                    Delimiter: String := Default_Delimiter
                    );
    procedure Put (File: File_Type;
                    Item: Real_Tensor_4D;
                    Fore : Field := Default_Fore;
                    Aft  : Field := Default_Aft;
                    Exp  : Field := Default_Exp;
                    Delimiter: String := Default_Delimiter
                    );

    use Ada.Streams;

    TFF_Tensor_Extents_Error: exception;

    procedure Read_TFF (File: Stream_IO.File_Type; Tensor: out Real_Vector);
    procedure Read_TFF (File: Stream_IO.File_Type; Tensor: out Real_Matrix);
    procedure Read_TFF (File: Stream_IO.File_Type; Tensor: out Real_Tensor_3D);
    procedure Read_TFF (File: Stream_IO.File_Type; Tensor: out Real_Tensor_4D);

    procedure Write_TFF (Tensor: Real_Vector; File: Stream_IO.File_Type);
    procedure Write_TFF (Tensor: Real_Matrix; File: Stream_IO.File_Type);
    procedure Write_TFF (Tensor: Real_Tensor_3D; File: Stream_IO.File_Type);
    procedure Write_TFF (Tensor: Real_Tensor_4D; File: Stream_IO.File_Type);

end Generic_Real_Arrays.IO;
