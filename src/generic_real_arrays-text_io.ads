pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

with Ada.Text_IO; use Ada.Text_IO;

generic
    with package Float_IO is new Ada.Text_IO.Float_IO (Real);
    use Float_IO;
package Generic_Real_Arrays.Text_IO is

    Default_Delimiter: constant String := (1 => ASCII.HT);

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

end Generic_Real_Arrays.Text_IO;
