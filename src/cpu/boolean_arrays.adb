pragma Ada_95;
pragma Profile (Ravenscar);

package body Boolean_Arrays is

    procedure For_Each (F: Unary_Boolean_Function; X: Boolean_Vector; Y: out Boolean_Vector) is
    begin
        for I in X'Range loop
            Y (I) := Call(F, X (I));
        end loop;
    end For_Each;

    procedure For_Each (F: Unary_Boolean_Function; X: Boolean_Matrix; Y: out Boolean_Matrix) is
    begin
        for I in X'Range(1) loop
            for J in X'Range(2) loop
                Y (I, J) := Call (F, X (I, J));
            end loop;
        end loop;
    end For_Each;

    procedure For_Each (F: Unary_Boolean_Function; X: Boolean_Tensor_3D; Y: out Boolean_Tensor_3D) is
    begin
        for I in X'Range(1) loop
            for J in X'Range(2) loop
                for K in X'Range(3) loop
                    Y (I, J, K) := Call (F, X (I, J, K));
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each (F: Unary_Boolean_Function; X: Boolean_Tensor_4D; Y: out Boolean_Tensor_4D) is
    begin
        for I in X'Range(1) loop
            for J in X'Range(2) loop
                for K in X'Range(3) loop
                    for L in X'Range(4) loop
                        Y (I, J, K, L) := Call (F, X (I, J, K, L));
                    end loop;
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each (F: Binary_Boolean_Function; X, Y: Boolean_Vector; Z: out Boolean_Vector) is
    begin
        for I in X'Range loop
            Z (I) := Call(F, X (I), Y (I));
        end loop;
    end For_Each;

    procedure For_Each (F: Binary_Boolean_Function; X, Y: Boolean_Matrix; Z: out Boolean_Matrix) is
    begin
        for I in X'Range(1) loop
            for J in X'Range(2) loop
                Z (I, J) := Call (F, X (I, J), Y (I, J));
            end loop;
        end loop;
    end For_Each;

    procedure For_Each (F: Binary_Boolean_Function; X, Y: Boolean_Tensor_3D; Z: out Boolean_Tensor_3D) is
    begin
        for I in X'Range(1) loop
            for J in X'Range(2) loop
                for K in X'Range(3) loop
                    Z (I, J, K) := Call (F, X (I, J, K), Y (I, J, K));
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each (F: Binary_Boolean_Function; X, Y: Boolean_Tensor_4D; Z: out Boolean_Tensor_4D) is
    begin
        for I in X'Range(1) loop
            for J in X'Range(2) loop
                for K in X'Range(3) loop
                    for L in X'Range(4) loop
                        Z (I, J, K, L) := Call (F, X (I, J, K, L), Y (I, J, K, L));
                    end loop;
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure Reduce (F: Binary_Boolean_Function; Input: Boolean_Vector; Output: out Boolean_Vector) is
    begin
        for I in Input'Range loop
            pragma Warnings (Off, "may be referenced before it has a value");
            Output (Output'First) := Call (F, Output (Output'First), Input (I));
            pragma Warnings (On, "may be referenced before it has a value");
        end loop;
    end Reduce;

    procedure Reduce (F: Binary_Boolean_Function; Input: Boolean_Matrix; Axes: Tiny_Positive_Vector; Output: out Boolean_Matrix)
    is
        DI, DJ: Natural := 1;
        VI, VJ : Positive;
    begin
        for I in Axes'Range loop
            case Axes(I) is
                when 1 => DI := 0;
                when 2 => DJ := 0;
                when others => null;
            end case;
        end loop;
        VI := Output'First(1);
        for I in Input'Range (1) loop
            VJ := Output'First(2);
            for J in Input'Range (2) loop
                pragma Warnings (Off, "may be referenced before it has a value");
                Output (VI, VJ) := Call (F, Output (VI, VJ), Input (I, J));
                pragma Warnings (On, "may be referenced before it has a value");
                VJ := VJ + DJ;
            end loop;
            VI := VI + DI;
        end loop;
    end Reduce;

    procedure Reduce (F: Binary_Boolean_Function; Input: Boolean_Tensor_3D; Axes: Tiny_Positive_Vector; Output: out Boolean_Tensor_3D)
    is
        DI, DJ, DK: Natural := 1;
        VI, VJ, VK : Positive;
    begin
        for I in Axes'Range loop
            case Axes(I) is
                when 1 => DI := 0;
                when 2 => DJ := 0;
                when 3 => DK := 0;
                when others => null;
            end case;
        end loop;
        VI := Output'First(1);
        for I in Input'Range (1) loop
            VJ := Output'First(2);
            for J in Input'Range (2) loop
                VK := Output'First(3);
                for K in Input'Range (3) loop
                    pragma Warnings (Off, "may be referenced before it has a value");
                    Output (VI, VJ, VK) := Call (F, Output (VI, VJ, VK), Input (I, J, K));
                    pragma Warnings (On, "may be referenced before it has a value");
                    VK := VK + DK;
                end loop;
                VJ := VJ + DJ;
            end loop;
            VI := VI + DI;
        end loop;
    end Reduce;

    procedure Reduce (F: Binary_Boolean_Function; Input: Boolean_Tensor_4D; Axes: Tiny_Positive_Vector; Output: out Boolean_Tensor_4D)
    is
        DI, DJ, DK, DL: Natural := 1;
        VI, VJ, VK, VL : Positive;
    begin
        for I in Axes'Range loop
            case Axes(I) is
                when 1 => DI := 0;
                when 2 => DJ := 0;
                when 3 => DK := 0;
                when 4 => DL := 0;
                when others => null;
            end case;
        end loop;
        VI := Output'First(1);
        for I in Input'Range (1) loop
            VJ := Output'First(2);
            for J in Input'Range (2) loop
                VK := Output'First(3);
                for K in Input'Range (3) loop
                    VL := Output'First(4);
                    for L in Input'Range (4) loop
                        pragma Warnings (Off, "may be referenced before it has a value");
                        Output (VI, VJ, VK, VL) := Call (F, Output (VI, VJ, VK, VL), Input (I, J, K, L));
                        pragma Warnings (On, "may be referenced before it has a value");
                        VL := VL + DL;
                    end loop;
                    VK := VK + DK;
                end loop;
                VJ := VJ + DJ;
            end loop;
            VI := VI + DI;
        end loop;
    end Reduce;

    procedure Not_Operator(X: Boolean_Vector; Y: out Boolean_Vector) is
    begin
        For_Each (Not_Function, X, Y);
    end Not_Operator;

    procedure Not_Operator(X: Boolean_Matrix; Y: out Boolean_Matrix) is
    begin
        For_Each (Not_Function, X, Y);
    end Not_Operator;

    procedure Not_Operator(X: Boolean_Tensor_3D; Y: out Boolean_Tensor_3D) is
    begin
        For_Each (Not_Function, X, Y);
    end Not_Operator;

    procedure Not_Operator(X: Boolean_Tensor_4D; Y: out Boolean_Tensor_4D) is
    begin
        For_Each (Not_Function, X, Y);
    end Not_Operator;

    procedure And_Operator(X, Y: Boolean_Vector; Z: out Boolean_Vector) is
    begin
        For_Each (And_Function, X, Y, Z);
    end And_Operator;

    procedure And_Operator(X, Y: Boolean_Matrix; Z: out Boolean_Matrix) is
    begin
        For_Each (And_Function, X, Y, Z);
    end And_Operator;

    procedure And_Operator(X, Y: Boolean_Tensor_3D; Z: out Boolean_Tensor_3D) is
    begin
        For_Each (And_Function, X, Y, Z);
    end And_Operator;

    procedure And_Operator(X, Y: Boolean_Tensor_4D; Z: out Boolean_Tensor_4D) is
    begin
        For_Each (And_Function, X, Y, Z);
    end And_Operator;

    procedure Or_Operator(X, Y: Boolean_Vector; Z: out Boolean_Vector) is
    begin
        For_Each (Or_Function, X, Y, Z);
    end Or_Operator;

    procedure Or_Operator(X, Y: Boolean_Matrix; Z: out Boolean_Matrix) is
    begin
        For_Each (Or_Function, X, Y, Z);
    end Or_Operator;

    procedure Or_Operator(X, Y: Boolean_Tensor_3D; Z: out Boolean_Tensor_3D) is
    begin
        For_Each (Or_Function, X, Y, Z);
    end Or_Operator;

    procedure Or_Operator(X, Y: Boolean_Tensor_4D; Z: out Boolean_Tensor_4D) is
    begin
        For_Each (Or_Function, X, Y, Z);
    end Or_Operator;

    procedure All_Reduce(Input: Boolean_Vector; Output: out Boolean_Vector) is
    begin
        Output := (others => true);
        Reduce (And_Function, Input, Output);
    end All_Reduce;

    procedure All_Reduce(Input: Boolean_Matrix; Axes: Tiny_Positive_Vector; Output: out Boolean_Matrix) is
    begin
        Output := (others => (others => true));
        Reduce (And_Function, Input, Axes, Output);
    end All_Reduce;

    procedure All_Reduce(Input: Boolean_Tensor_3D; Axes: Tiny_Positive_Vector; Output: out Boolean_Tensor_3D) is
    begin
        Output := (others => (others => (others => true)));
        Reduce (And_Function, Input, Axes, Output);
    end All_Reduce;

    procedure All_Reduce(Input: Boolean_Tensor_4D; Axes: Tiny_Positive_Vector; Output: out Boolean_Tensor_4D) is
    begin
        Output := (others => (others => (others => (others => true))));
        Reduce (And_Function, Input, Axes, Output);
    end All_Reduce;

    procedure Any_Reduce(Input: Boolean_Vector; Output: out Boolean_Vector) is
    begin
        Output := (others => false);
        Reduce (Or_Function, Input, Output);
    end Any_Reduce;

    procedure Any_Reduce(Input: Boolean_Matrix; Axes: Tiny_Positive_Vector; Output: out Boolean_Matrix) is
    begin
        Output := (others => (others => false));
        Reduce (Or_Function, Input, Axes, Output);
    end Any_Reduce;

    procedure Any_Reduce(Input: Boolean_Tensor_3D; Axes: Tiny_Positive_Vector; Output: out Boolean_Tensor_3D) is
    begin
        Output := (others => (others => (others => false)));
        Reduce (Or_Function, Input, Axes, Output);
    end Any_Reduce;

    procedure Any_Reduce(Input: Boolean_Tensor_4D; Axes: Tiny_Positive_Vector; Output: out Boolean_Tensor_4D) is
    begin
        Output := (others => (others => (others => (others => false))));
        Reduce (Or_Function, Input, Axes, Output);
    end Any_Reduce;

end Boolean_Arrays;
