pragma Ada_95;
pragma Profile (Ravenscar);

package body Generic_Real_Arrays is

    procedure For_Each (F: Unary_Real_Function; X: Real_Vector; Y: out Real_Vector)
    is
    begin
        for I in X'Range loop
            Y (I) := Call (F, X (I));
        end loop;
    end For_Each;

    procedure For_Each (F : Unary_Real_Function; X : Real_Matrix; Y: out Real_Matrix)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                Y (I, J) := Call (F, X (I, J));
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Unary_Real_Function; X : Real_Tensor_3D; Y : out Real_Tensor_3D)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                for K in X'Range (3) loop
                    Y (I, J, K) := Call (F, X (I, J, K));
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Unary_Real_Function; X : Real_Tensor_4D; Y : out Real_Tensor_4D)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                for K in X'Range (3) loop
                    for L in X'Range (4) loop
                        Y (I, J, K, L) := Call (F, X (I, J, K, L));
                    end loop;
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Binary_Real_Function; X, Y : Real_Vector; Z : out Real_Vector)
    is
    begin
        for I in Z'Range loop
            Z (I) := Call (F, X (I), Y (I));
        end loop;
    end For_Each;

    procedure For_Each
       (F : Binary_Real_Function; X, Y : Real_Matrix; Z : out Real_Matrix)
    is
    begin
        for I in Z'Range (1) loop
            for J in Z'Range (2) loop
                Z (I, J) := Call (F, X (I, J), Y (I, J));
            end loop;
        end loop;
    end For_Each;

    procedure For_Each (F : Binary_Real_Function; X, Y : Real_Tensor_3D; Z : out Real_Tensor_3D)
    is
    begin
        for I in Z'Range (1) loop
            for J in Z'Range (2) loop
                for K in Z'Range (3) loop
                    Z (I, J, K) := Call (F, X (I, J, K), Y (I, J, K));
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Binary_Real_Function; X, Y : Real_Tensor_4D; Z : out Real_Tensor_4D)
    is
    begin
        for I in Z'Range (1) loop
            for J in Z'Range (2) loop
                for K in Z'Range (3) loop
                    for L in Z'Range (4) loop
                        Z (I, J, K, L) := Call (F, X (I, J, K, L), Y (I, J, K, L));
                    end loop;
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Reduced
       (F : Binary_Real_Function; X, Y : Real_Vector; Z : out Real_Vector)
    is
        XI: Positive := X'First;
        YI: Positive := Y'First;
        DX, DY: Natural := 1;
    begin
        if X'Length /= Y'Length then
            if X'Length = 1 then
                DX := 0;
            end if;
            if Y'Length = 1 then
                DY := 0;
            end if;
        end if;
        for I in Z'Range loop
            Z (I) := Call (F, X (XI), Y (YI));
            XI := XI + DX;
            YI := YI + DY;
        end loop;
    end For_Reduced;

    procedure For_Reduced
       (F : Binary_Real_Function; X, Y : Real_Matrix; Z : out Real_Matrix)
    is
        X_Length: Tiny_Positive_Vector := (X'Length (1), X'Length (2));
        Y_Length: Tiny_Positive_Vector := (Y'Length (1), Y'Length (2));
        XI: Positive := X'First (1);
        YI: Positive := Y'First (1);
        XJ, YJ: Positive;
        DX, DY: Natural_Vector := (1, 1);
    begin
        for I in X_Length'Range loop
            if X_Length (I) /= Y_Length (I) then
                if X_Length (I) = 1 then
                    DX (I) := 0;
                end if;
                if Y_Length (I) = 1 then
                    DY (I) := 0;
                end if;
            end if;
        end loop;
        for I in Z'Range (1) loop
            XJ := X'First (2);
            YJ := Y'First (2);
            for J in Z'Range (2) loop
                Z (I, J) := Call (F, X (XI, XJ), Y (YI, YJ));
                XJ := XJ + DX (2);
                YJ := YJ + DY (2);
            end loop;
            XI := XI + DX (1);
            YI := YI + DY (1);
        end loop;
    end For_Reduced;

    procedure For_Reduced (F : Binary_Real_Function; X, Y : Real_Tensor_3D; Z : out Real_Tensor_3D)
    is
        X_Length: Tiny_Positive_Vector := (X'Length (1), X'Length (2), X'Length (3));
        Y_Length: Tiny_Positive_Vector := (Y'Length (1), Y'Length (2), Y'Length (3));
        XI: Positive := X'First (1);
        YI: Positive := Y'First (1);
        XJ, YJ, XK, YK: Positive;
        DX, DY: Natural_Vector := (1, 1, 1);
    begin
        for I in X_Length'Range loop
            if X_Length (I) /= Y_Length (I) then
                if X_Length (I) = 1 then
                    DX (I) := 0;
                end if;
                if Y_Length (I) = 1 then
                    DY (I) := 0;
                end if;
            end if;
        end loop;
        for I in Z'Range (1) loop
            XJ := X'First (2);
            YJ := Y'First (2);
            for J in Z'Range (2) loop
                XK := X'First (3);
                YK := Y'First (3);
                for K in Z'Range (3) loop
                    Z (I, J, K) := Call (F, X (XI, XJ, XK), Y (YI, YJ, YK));
                    XK := XK + DX (3);
                    YK := YK + DY (3);
                end loop;
                XJ := XJ + DX (2);
                YJ := YJ + DY (2);
            end loop;
            XI := XI + DX (1);
            YI := YI + DY (1);
        end loop;
    end For_Reduced;

    procedure For_Reduced
       (F : Binary_Real_Function; X, Y : Real_Tensor_4D; Z : out Real_Tensor_4D)
    is
        X_Length: Tiny_Positive_Vector := (X'Length (1), X'Length (2), X'Length (3), X'Length (4));
        Y_Length: Tiny_Positive_Vector := (Y'Length (1), Y'Length (2), Y'Length (3), Y'Length (4));
        XI: Positive := X'First (1);
        YI: Positive := Y'First (1);
        XJ, YJ, XK, YK, XL, YL: Positive;
        DX, DY: Natural_Vector := (1, 1, 1, 1);
    begin
        for I in X_Length'Range loop
            if X_Length (I) /= Y_Length (I) then
                if X_Length (I) = 1 then
                    DX (I) := 0;
                end if;
                if Y_Length (I) = 1 then
                    DY (I) := 0;
                end if;
            end if;
        end loop;
        for I in Z'Range (1) loop
            XJ := X'First (2);
            YJ := Y'First (2);
            for J in Z'Range (2) loop
                XK := X'First (3);
                YK := Y'First (3);
                for K in Z'Range (3) loop
                    XL := X'First (4);
                    YL := Y'First (4);
                    for L in Z'Range (4) loop
                        Z (I, J, K, L) := Call (F, X (XI, XJ, XK, XL), Y (YI, YJ, YK, YL));
                        XL := XL + DX (4);
                        YL := YL + DY (4);
                    end loop;
                    XK := XK + DX (3);
                    YK := YK + DY (3);
                end loop;
                XJ := XJ + DX (2);
                YJ := YJ + DY (2);
            end loop;
            XI := XI + DX (1);
            YI := YI + DY (1);
        end loop;
    end For_Reduced;

    procedure For_Each
       (F : Binary_Real_Function; X : Real_Vector; Y : Real; Z : out Real_Vector)
    is
    begin
        for I in X'Range loop
            Z (I) := Call (F, X (I), Y);
        end loop;
    end For_Each;

    procedure For_Each
       (F : Binary_Real_Function; X : Real_Matrix; Y : Real; Z : out Real_Matrix)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                Z (I, J) := Call (F, X (I, J), Y);
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Binary_Real_Function; X : Real_Tensor_3D; Y : Real; Z : out Real_Tensor_3D)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                for K in X'Range (3) loop
                    Z (I, J, K) := Call (F, X (I, J, K), Y);
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Binary_Real_Function; X : Real_Tensor_4D; Y : Real; Z : out Real_Tensor_4D)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                for K in X'Range (3) loop
                    for L in X'Range (4) loop
                        Z (I, J, K, L) := Call (F, X (I, J, K, L), Y);
                    end loop;
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Binary_Real_Function; X : Real_Vector; Y : Integer_Vector; Z : out Real_Vector)
    is
    begin
        for I in X'Range loop
            Z (I) := Call (F, X (I), Real (Y (I)));
        end loop;
    end For_Each;

    procedure For_Each
       (F : Binary_Real_Function; X : Real_Matrix; Y : Integer_Matrix; Z : out Real_Matrix)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                Z (I, J) := Call (F, X (I, J), Real (Y (I, J)));
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Binary_Real_Function; X : Real_Tensor_3D; Y : Integer_Tensor_3D; Z : out Real_Tensor_3D)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                for K in X'Range (3) loop
                    Z (I, J, K) := Call (F, X (I, J, K), Real (Y (I, J, K)));
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Binary_Real_Function; X : Real_Tensor_4D; Y : Integer_Tensor_4D; Z : out Real_Tensor_4D)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                for K in X'Range (3) loop
                    for L in X'Range (4) loop
                        Z (I, J, K, L) := Call (F, X (I, J, K, L), Real (Y (I, J, K, L)));
                    end loop;
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each (F: Ternary_Real_Function; X, A, B: Real_Vector; Y: out Real_Vector)
    is
    begin
        for I in X'Range loop
            Y (I) := Call (F, X (I), A (I), B (I));
        end loop;
    end For_Each;

    procedure For_Each (F : Ternary_Real_Function; X, A, B: Real_Matrix; Y: out Real_Matrix)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                Y (I, J) := Call (F, X (I, J), A (I, J), B (I, J));
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Ternary_Real_Function; X, A, B: Real_Tensor_3D; Y : out Real_Tensor_3D)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                for K in X'Range (3) loop
                    Y (I, J, K) := Call (F, X (I, J, K), A (I, J, K), B (I, J, K));
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Ternary_Real_Function; X, A, B: Real_Tensor_4D; Y : out Real_Tensor_4D)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                for K in X'Range (3) loop
                    for L in X'Range (4) loop
                        Y (I, J, K, L) := Call (F, X (I, J, K, L), A (I, J, K, L), B (I, J, K, L));
                    end loop;
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Ternary_Real_Function; X : Real_Vector; A, B: Real; Y: out Real_Vector)
    is
    begin
        for I in X'Range loop
            Y (I) := Call (F, X (I), A, B);
        end loop;
    end For_Each;

    procedure For_Each
       (F : Ternary_Real_Function; X : Real_Matrix; A, B: Real; Y : out Real_Matrix)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                Y (I, J) := Call (F, X (I, J), A, B);
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Ternary_Real_Function; X : Real_Tensor_3D; A, B: Real; Y : out Real_Tensor_3D)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                for K in X'Range (3) loop
                    Y (I, J, K) := Call (F, X (I, J, K), A, B);
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Ternary_Real_Function; X : Real_Tensor_4D; A, B: Real; Y : out Real_Tensor_4D)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                for K in X'Range (3) loop
                    for L in X'Range (4) loop
                        Y (I, J, K, L) := Call (F, X (I, J, K, L), A, B);
                    end loop;
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each (F : Compare_Real_Function; X, Y : Real_Vector; Z : out Boolean_Vector)
    is
    begin
        for I in Z'Range loop
            Z (I) := Call (F, X (I), Y (I));
        end loop;
    end For_Each;

    procedure For_Each (F : Compare_Real_Function; X, Y : Real_Matrix; Z : out Boolean_Matrix)
    is
    begin
        for I in Z'Range (1) loop
            for J in Z'Range (2) loop
                Z (I, J) := Call (F, X (I, J), Y (I, J));
            end loop;
        end loop;
    end For_Each;

    procedure For_Each (F : Compare_Real_Function; X, Y : Real_Tensor_3D; Z : out Boolean_Tensor_3D)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                for K in X'Range (3) loop
                    Z (I, J, K) := Call (F, X (I, J, K), Y (I, J, K));
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Compare_Real_Function; X, Y : Real_Tensor_4D; Z : out Boolean_Tensor_4D)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                for K in X'Range (3) loop
                    for L in X'Range (4) loop
                        Z (I, J, K, L) := Call (F, X (I, J, K, L), Y (I, J, K, L));
                    end loop;
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Compare_Real_Function; X : Real_Vector; Y : Real; Z : out Boolean_Vector)
    is
    begin
        for I in X'Range loop
            Z (I) := Call (F, X (I), Y);
        end loop;
    end For_Each;

    procedure For_Each
       (F : Compare_Real_Function; X : Real_Matrix; Y : Real; Z : out Boolean_Matrix)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                Z (I, J) := Call (F, X (I, J), Y);
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Compare_Real_Function; X : Real_Tensor_3D; Y : Real; Z : out Boolean_Tensor_3D)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                for K in X'Range (3) loop
                    Z (I, J, K) := Call (F, X (I, J, K), Y);
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Compare_Real_Function; X : Real_Tensor_4D; Y : Real; Z : out Boolean_Tensor_4D)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                for K in X'Range (3) loop
                    for L in X'Range (4) loop
                        Z (I, J, K, L) := Call (F, X (I, J, K, L), Y);
                    end loop;
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Select_Real_Function; C: Boolean_Vector; X, Y : Real_Vector; Z : out Real_Vector)
    is
    begin
        for I in X'Range loop
            Z (I) := Call (F, C (I), X (I), Y (I));
        end loop;
    end For_Each;

    procedure For_Each
       (F : Select_Real_Function; C: Boolean_Matrix; X, Y : Real_Matrix; Z : out Real_Matrix)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                Z (I, J) := Call (F, C (I, J), X (I, J), Y (I, J));
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Select_Real_Function; C: Boolean_Tensor_3D; X, Y : Real_Tensor_3D; Z : out Real_Tensor_3D)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                for K in X'Range (3) loop
                    Z (I, J, K) := Call (F, C (I, J, K), X (I, J, K), Y (I, J, K));
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Select_Real_Function; C: Boolean_Tensor_4D; X, Y : Real_Tensor_4D; Z : out Real_Tensor_4D)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                for K in X'Range (3) loop
                    for L in X'Range (4) loop
                        Z (I, J, K, L) := Call (F, C (I, J, K, L), X (I, J, K, L), Y (I, J, K, L));
                    end loop;
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Select_Real_Function; C: Boolean_Vector; X : Real_Vector; Y : Real; Z : out Real_Vector)
    is
    begin
        for I in X'Range loop
            Z (I) := Call (F, C (I), X (I), Y);
        end loop;
    end For_Each;

    procedure For_Each
       (F : Select_Real_Function; C: Boolean_Matrix; X : Real_Matrix; Y : Real; Z : out Real_Matrix)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                Z (I, J) := Call (F, C (I, J), X (I, J), Y);
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Select_Real_Function; C: Boolean_Tensor_3D; X : Real_Tensor_3D; Y : Real; Z : out Real_Tensor_3D)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                for K in X'Range (3) loop
                    Z (I, J, K) := Call (F, C (I, J, K), X (I, J, K), Y);
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure For_Each
       (F : Select_Real_Function; C: Boolean_Tensor_4D; X : Real_Tensor_4D; Y : Real; Z : out Real_Tensor_4D)
    is
    begin
        for I in X'Range (1) loop
            for J in X'Range (2) loop
                for K in X'Range (3) loop
                    for L in X'Range (4) loop
                        Z (I, J, K, L) := Call (F, C (I, J, K, L), X (I, J, K, L), Y);
                    end loop;
                end loop;
            end loop;
        end loop;
    end For_Each;

    procedure Reduce (F: Binary_Real_Function; Input: Real_Vector; Output: out Real_Vector) is
    begin
        for I in Input'Range loop
            pragma Warnings (Off, "may be referenced before it has a value");
            Output (Output'First) := Call (F, Output (Output'First), Input (I));
            pragma Warnings (On, "may be referenced before it has a value");
        end loop;
    end Reduce;

    procedure Reduce (F: Binary_Real_Function; Input: Real_Matrix; Axes: Tiny_Positive_Vector; Output: out Real_Matrix)
    is
        DI, DJ: Natural := 1;
        VI, VJ: Positive;
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

    procedure Reduce (F: Binary_Real_Function; Input: Real_Tensor_3D; Axes: Tiny_Positive_Vector; Output: out Real_Tensor_3D)
    is
        DI, DJ, DK: Natural := 1;
        VI, VJ, VK: Positive;
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

    procedure Reduce (F: Binary_Real_Function; Input: Real_Tensor_4D; Axes: Tiny_Positive_Vector; Output: out Real_Tensor_4D)
    is
        DI, DJ, DK, DL: Natural := 1;
        VI, VJ, VK, VL: Positive;
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

    procedure Arg_Reduce (F: Compare_Real_Function; Input : Real_Vector; Output: out Natural_Vector) is
        VI: Positive;
        SI: Positive;
    begin
        SI := Input'First;
        VI := Output'First;
        for I in Input'Range loop
            if Call (F, Input (I), Input (SI)) then
                Output (VI) := (I-Input'First);
                SI := I;
            end if;
        end loop;
    end Arg_Reduce;

    procedure Arg_Reduce
       (F: Compare_Real_Function; Input : Real_Matrix; Axes : Tiny_Positive_Vector; Output: out Natural_Matrix)
    is
        DI, DJ: Natural := 1;
        VI, VJ: Positive;
        SI, SJ: Positive;
        L2: constant Natural := Input'Length(2);
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
                SI := Input'First(1) + Output (VI, VJ) / L2;
                SJ := Input'First(2) + Output (VI, VJ) rem L2;
                pragma Warnings (On, "may be referenced before it has a value");
                if Call (F, Input (I, J), Input (SI, SJ)) then
                    Output (VI, VJ) := (J-Input'First(2)) + L2 * (I-Input'First(1));
                end if;
                VJ := VJ + DJ;
            end loop;
            VI := VI + DI;
        end loop;
    end Arg_Reduce;

    procedure Arg_Reduce
       (F: Compare_Real_Function; Input : Real_Tensor_3D; Axes : Tiny_Positive_Vector; Output: out Natural_Tensor_3D)
    is
        DI, DJ, DK: Natural := 1;
        VI, VJ, VK: Positive;
        SI, SJ, SK: Positive;
        L2: constant Natural := Input'Length(2);
        L3: constant Natural := Input'Length(3);
        L23: constant Natural := L2 * L3;
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
                    SI := Input'First(1) + Output (VI, VJ, VK) / L23;
                    SJ := Input'First(2) + Output (VI, VJ, VK) / L3 rem L2;
                    SK := Input'First(3) + Output (VI, VJ, VK) rem L3;
                    pragma Warnings (On, "may be referenced before it has a value");
                    if Call (F, Input (I, J, K), Input (SI, SJ, SK)) then
                        Output (VI, VJ, VK) := (K-Input'First(3)) + L3 * ((J-Input'First(2)) + L2 * (I-Input'First(1)));
                    end if;
                    VK := VK + DK;
                end loop;
                VJ := VJ + DJ;
            end loop;
            VI := VI + DI;
        end loop;
    end Arg_Reduce;

    procedure Arg_Reduce
       (F: Compare_Real_Function; Input : Real_Tensor_4D; Axes : Tiny_Positive_Vector; Output: out Natural_Tensor_4D)
    is
        DI, DJ, DK, DL: Natural := 1;
        VI, VJ, VK, VL: Positive;
        SI, SJ, SK, SL: Positive;
        L2: constant Natural := Input'Length(2);
        L3: constant Natural := Input'Length(3);
        L4: constant Natural := Input'Length(4);
        L34: constant Natural := L3 * L4;
        L234: constant Natural := L2 * L34;
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
                        SI := Input'First(1) + Output (VI, VJ, VK, VL) / L234;
                        SJ := Input'First(2) + Output (VI, VJ, VK, VL) / L34 rem L2;
                        SK := Input'First(3) + Output (VI, VJ, VK, VL) / L4 rem L3;
                        SL := Input'First(4) + Output (VI, VJ, VK, VL) rem L4;
                        pragma Warnings (On, "may be referenced before it has a value");
                        if Call (F, Input (I, J, K, L), Input (SI, SJ, SK, SL)) then
                            Output (VI, VJ, VK, VL) := (L-Input'First(4)) + L4 * ((K-Input'First(3)) + L3 * ((J-Input'First(2)) + L2 * (I-Input'First(1))));
                        end if;
                        VL := VL + DL;
                    end loop;
                    VK := VK + DK;
                end loop;
                VJ := VJ + DJ;
            end loop;
            VI := VI + DI;
        end loop;
    end Arg_Reduce;

    procedure Arg_Sort (F: Compare_Real_Function; Vector: Real_Vector; Sorted: out Positive_Vector) is
    begin
        Sorted(Sorted'First) := Vector'First;
        for I in Vector'First+1 .. Vector'Last loop
            Sorted(I) := I;
            for J in Sorted'First .. I-1 loop
                if Call (F, Vector(Sorted(J)), Vector(I)) then
                    -- Shift right
                    for K in reverse J .. I-1 loop
                        Sorted(K+1) := Sorted(K);
                    end loop;
                    Sorted(J) := I;
                    exit;
                end if;
            end loop;
        end loop;
    end;

    --  function Border_Value_Index (Index: Tiny_Integer_Vector; First, Last: Tiny_Positive_Vector; Border: Border_Modes) return Tiny_Integer_Vector is
    --      Result: Tiny_Integer_Vector := Index;
    --  begin
    --      for I in Index'Range loop
    --          if Index(I) < First(I) then
    --              case Border is
    --                  when Border_Mode_Replicate =>
    --                      Result(I) := First(I);
    --                  when Border_Mode_Reflect =>
    --                      Result(I) := First(I) - Index(I) + 1;
    --                  when Border_Mode_Reflect_Even =>
    --                      Result(I) := First(I) - Index(I);
    --                  when others =>
    --                      null;
    --              end case;
    --          elsif Index(I) > Last(I) then
    --              case Border is
    --                  when Border_Mode_Replicate =>
    --                      Result(I) := Last(I);
    --                  when Border_Mode_Reflect =>
    --                      Result(I) := Last(I) - (Index(I)-Last(I));
    --                  when Border_Mode_Reflect_Even =>
    --                      Result(I) := Last(I) - (Index(I)-Last(I)-1);
    --                  when others =>
    --                      null;
    --              end case;
    --          end if;
    --      end loop;
    --      return Result;
    --  end Border_Value_Index;

    function Border_Value_Index (Index: Integer; First, Last: Positive; Border: Border_Modes) return Integer is
    begin
        if Index < First then
            case Border is
                when Border_Mode_Replicate =>
                    return First;
                when Border_Mode_Reflect =>
                    return First - Index + 1;
                when Border_Mode_Reflect_Even =>
                    return First - Index;
                when others =>
                    return Index;
            end case;
        elsif Index > Last then
            case Border is
                when Border_Mode_Replicate =>
                    return Last;
                when Border_Mode_Reflect =>
                    return Last - (Index-Last);
                when Border_Mode_Reflect_Even =>
                    return Last - (Index-Last-1);
                when others =>
                    return Index;
            end case;
        else
            return Index;
        end if;
    end Border_Value_Index;

    function Border_Value_Index_3 (Index: Tiny_Integer_Vector_3; First, Last: Tiny_Positive_Vector_3; Border: Border_Modes) return Tiny_Integer_Vector_3 is
    begin
        return ( Border_Value_Index (Index (1), First (1), Last (1), Border),
            Border_Value_Index (Index (2), First (2), Last (2), Border),
            Border_Value_Index (Index (3), First (3), Last (3), Border) );
    end Border_Value_Index_3;

    function Border_Value_Index_4 (Index: Tiny_Integer_Vector_4; First, Last: Tiny_Positive_Vector_4; Border: Border_Modes) return Tiny_Integer_Vector_4 is
    begin
        return ( Border_Value_Index (Index (1), First (1), Last (1), Border),
            Border_Value_Index (Index (2), First (2), Last (2), Border),
            Border_Value_Index (Index (3), First (3), Last (3), Border),
            Border_Value_Index (Index (4), First (4), Last (4), Border) );
    end Border_Value_Index_4;

    --  function Is_Border_Index (Index: Tiny_Integer_Vector; First, Last: Tiny_Positive_Vector) return Boolean is
    --  begin
    --      for I in Index'Range loop
    --          if Index(I) < First(I) OR else Index(I) > Last(I) then
    --              return true;
    --          end if;
    --      end loop;
    --      return false;
    --  end Is_Border_Index;

    function Is_Border_Index_3 (Index: Tiny_Integer_Vector_3; First, Last: Tiny_Positive_Vector_3) return Boolean is
    begin
        return Index(3) < First(3) OR else Index(3) > Last(3) OR else
            Index(2) < First(2) OR else Index(2) > Last(2) OR else
            Index(1) < First(1) OR else Index(1) > Last(1);
    end Is_Border_Index_3;

    function Is_Border_Index_4 (Index: Tiny_Integer_Vector_4; First, Last: Tiny_Positive_Vector_4) return Boolean is
    begin
        return Index(4) < First(4) OR else Index(4) > Last(4) OR else
            Index(3) < First(3) OR else Index(3) > Last(3) OR else
            Index(2) < First(2) OR else Index(2) > Last(2) OR else
            Index(1) < First(1) OR else Index(1) > Last(1);
    end Is_Border_Index_4;

    --  procedure Get_Input_Value (Input: Real_Tensor_3D; Index: Tiny_Integer_Vector; Border: Border_Modes; Value: out Real; Ignore: out Boolean) is
    --  begin
    --      if Is_Border_Index (Index,
    --          (Input'First(1), Input'First(2), Input'First(3)),
    --          (Input'Last(1), Input'Last(2), Input'Last(3))) then
    --          if Border = Border_Mode_Constant then
    --              Value := Border_Constant_Value;
    --          elsif Border = Border_Mode_Ignore then
    --              Value := Border_Constant_Value;
    --              Ignore := true;
    --              return;
    --          else
    --              declare
    --                  Idx: Tiny_Integer_Vector := Border_Value_Index(Index,
    --                      (Input'First(1), Input'First(2), Input'First(3)),
    --                      (Input'Last(1), Input'Last(2), Input'Last(3)),
    --                      Border
    --                  );
    --              begin
    --                  Value := Input(Idx(1), Idx(2), Idx(3));
    --              end;
    --          end if;
    --      else
    --          Value := Input(Index(1), Index(2), Index(3));
    --      end if;
    --      Ignore := false;
    --  end Get_Input_Value;

    --  procedure Get_Input_Value (Input: Real_Tensor_4D; Index: Tiny_Integer_Vector; Border: Border_Modes; Value: out Real; Ignore: out Boolean) is
    --  begin
    --      if Is_Border_Index (Index,
    --          (Input'First(1), Input'First(2), Input'First(3), Input'First(4)),
    --          (Input'Last(1), Input'Last(2), Input'Last(3), Input'Last(4))) then
    --          if Border = Border_Mode_Constant then
    --              Value := Border_Constant_Value;
    --          elsif Border = Border_Mode_Ignore then
    --              Value := Border_Constant_Value;
    --              Ignore := true;
    --              return;
    --          else
    --              declare
    --                  Idx: Tiny_Integer_Vector := Border_Value_Index(Index,
    --                      (Input'First(1), Input'First(2), Input'First(3), Input'First(4)),
    --                      (Input'Last(1), Input'Last(2), Input'Last(3), Input'Last(4)),
    --                      Border
    --                  );
    --              begin
    --                  Value := Input(Idx(1), Idx(2), Idx(3), Idx(4));
    --              end;
    --          end if;
    --      else
    --          Value := Input(Index(1), Index(2), Index(3), Index(4));
    --      end if;
    --      Ignore := false;
    --  end Get_Input_Value;

    procedure Get_Input_Value_3 (Input: Real_Tensor_3D; Index: Tiny_Integer_Vector_3; Border: Border_Modes; Value: out Real; Ignore: out Boolean) is
    begin
        if Is_Border_Index_3 (Index,
            (Input'First(1), Input'First(2), Input'First(3)),
            (Input'Last(1), Input'Last(2), Input'Last(3))) then
            if Border = Border_Mode_Constant then
                Value := Border_Constant_Value;
            elsif Border = Border_Mode_Ignore then
                Value := Border_Constant_Value;
                Ignore := true;
                return;
            else
                declare
                    Idx: Tiny_Integer_Vector_3 := Border_Value_Index_3 (Index,
                        (Input'First(1), Input'First(2), Input'First(3)),
                        (Input'Last(1), Input'Last(2), Input'Last(3)),
                        Border
                    );
                begin
                    Value := Input(Idx(1), Idx(2), Idx(3));
                end;
            end if;
        else
            Value := Input(Index(1), Index(2), Index(3));
        end if;
        Ignore := false;
    end Get_Input_Value_3;

    procedure Get_Input_Value_4 (Input: Real_Tensor_4D; Index: Tiny_Integer_Vector_4; Border: Border_Modes; Value: out Real; Ignore: out Boolean) is
    begin
        if Is_Border_Index_4 (Index,
            (Input'First(1), Input'First(2), Input'First(3), Input'First(4)),
            (Input'Last(1), Input'Last(2), Input'Last(3), Input'Last(4))) then
            if Border = Border_Mode_Constant then
                Value := Border_Constant_Value;
            elsif Border = Border_Mode_Ignore then
                Value := Border_Constant_Value;
                Ignore := true;
                return;
            else
                declare
                    Idx: Tiny_Integer_Vector_4 := Border_Value_Index_4 (Index,
                        (Input'First(1), Input'First(2), Input'First(3), Input'First(4)),
                        (Input'Last(1), Input'Last(2), Input'Last(3), Input'Last(4)),
                        Border
                    );
                begin
                    Value := Input(Idx(1), Idx(2), Idx(3), Idx(4));
                end;
            end if;
        else
            Value := Input(Index(1), Index(2), Index(3), Index(4));
        end if;
        Ignore := false;
    end Get_Input_Value_4;

    procedure Set_Bias (Bias: Real_Matrix; Output: out Real_Tensor_3D) is
        Fill_Value: Real;
    begin
        if Bias'Length(2) = 1 then
            Fill_Value := Bias (1, 1);
        end if;
        for J in Output'Range(2) loop
            if Bias'Length(2) /= 1 then
                Fill_Value := Bias (1, J);
            end if;
            for I in Output'Range(1) loop
                for K in Output'Range(3) loop
                    Output (I, J, K) := Fill_Value;
                end loop;
            end loop;
        end loop;
    end Set_Bias;

    procedure Set_Bias (Bias: Real_Matrix; Output: out Real_Tensor_4D) is
        Fill_Value: Real;
    begin
        if Bias'Length(2) = 1 then
            Fill_Value := Bias (1, 1);
        end if;
        for J in Output'Range(2) loop
            if Bias'Length(2) /= 1 then
                Fill_Value := Bias (1, J);
            end if;
            for I in Output'Range(1) loop
                for K in Output'Range(3) loop
                    for L in Output'Range(4) loop
                        Output (I, J, K, L) := Fill_Value;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Set_Bias;

    procedure Conv_1D_Core
       (Input: Real_Tensor_3D; Input_Index: Tiny_Positive_Vector_2;
        Filter: Real_Tensor_3D; Filter_Index: Tiny_Positive_Vector_2;
        Output: in out Real_Tensor_3D; Output_Index: Tiny_Positive_Vector_2;
        Border: Border_Modes;
        Padding: Padding_Extent;
        Stride, Dilation : Positive)
    is
        Input_Value: Real;
        Idx1: Integer;
        Ignore: Boolean;
    begin
        for I1 in Output'Range (3) loop
            for J1 in Filter'Range (3) loop
                Idx1 := (I1-1) * Stride + (J1-1) * Dilation - Padding (1) + Input'First(3);
                Get_Input_Value_3 (Input, (Input_Index(1), Input_Index(2), Idx1), Border, Input_Value, Ignore);
                if NOT Ignore then
                    Output(Output_Index(1), Output_Index(2), I1) := Output(Output_Index(1), Output_Index(2), I1) +
                        Input_Value * Filter (Filter_Index(1), Filter_Index(2), J1);
                end if;
            end loop;
        end loop;
    end Conv_1D_Core;

    procedure Conv_1D (Input, Filter: Real_Tensor_3D; Border: Border_Modes;
        Padding: Padding_Extent; Stride, Dilation : Positive; Output: in out Real_Tensor_3D) is
    begin
        for B in Output'Range(1) loop
            for K2 in Output'Range(2) loop
                for K1 in Input'Range(2) loop
                    Conv_1D_Core (Input, (B, K1), Filter, (K2, K1), Output, (B, K2), Border, Padding, Stride, Dilation);
                end loop;
            end loop;
        end loop;
    end Conv_1D;

    procedure Depthwise_Conv_1D (Input, Filter: Real_Tensor_3D; Border: Border_Modes;
        Padding: Padding_Extent; Stride, Dilation : Positive; Output: in out Real_Tensor_3D) is
        Multiplier: constant Natural := Output'Length(2) / Input'Length(2);
        Broadcast: constant Boolean := Filter'Length(1) = 1;
        K2, Z: Positive := 1;
    begin
        for B in Output'Range(1) loop
            for K1 in Input'Range(2) loop
                for M in 1..Multiplier loop
                    K2 := Multiplier * (K1-1) + M;
                    if NOT Broadcast then
                        Z := K2;
                    end if;
                    Conv_1D_Core (Input, (B, K1), Filter, (Z, 1), Output, (B, K2), Border, Padding, Stride, Dilation);
                end loop;
            end loop;
        end loop;
    end Depthwise_Conv_1D;

    procedure Groupped_Conv_1D (Input, Filter: Real_Tensor_3D; Border: Border_Modes;
        Padding: Padding_Extent; Stride, Dilation : Positive; Groups: Natural; Output: in out Real_Tensor_3D) is
        Input_Block: constant Natural := Input'Length(2) / Groups;
        Output_Block: constant Natural := Output'Length(2) / Groups;
        K1, K2: Positive;
    begin
        for B in Output'Range(1) loop
            for G in 1..Groups loop
                for Z in 1..Output_Block loop
                    K2 := (G - 1) * Output_Block + Z;
                    for C in 1..Input_Block loop
                        K1 := (G - 1) * Input_Block + C;
                        Conv_1D_Core (Input, (B, K1), Filter, (K2, C), Output, (B, K2), Border, Padding, Stride, Dilation);
                    end loop;
                end loop;
            end loop;
        end loop;
    end Groupped_Conv_1D;

    procedure Conv_2D_Core
       (Input: Real_Tensor_4D; Input_Index: Tiny_Positive_Vector_2;
        Filter: Real_Tensor_4D; Filter_Index: Tiny_Positive_Vector_2;
        Output: in out Real_Tensor_4D; Output_Index: Tiny_Positive_Vector_2;
        Border: Border_Modes;
        Padding: Padding_Type_2;
        Stride, Dilation : Tiny_Positive_Vector_2)
    is
        Input_Value: Real;
        Idx1, Idx2: Integer;
        Ignore: Boolean;
    begin
        for I1 in Output'Range (3) loop
            for I2 in Output'Range (4) loop
                for J1 in Filter'Range (3) loop
                    Idx1 := (I1-1) * Stride (1) + (J1-1) * Dilation (1) - Padding (1)(1) + Input'First(3);
                    for J2 in Filter'Range (4) loop
                        Idx2 := (I2-1) * Stride (2) + (J2-1) * Dilation (2) - Padding (2)(1) + Input'First(4);
                        Get_Input_Value_4 (Input, (Input_Index(1), Input_Index(2), Idx1, Idx2), Border, Input_Value, Ignore);
                        if NOT Ignore then
                            Output(Output_Index(1), Output_Index(2), I1, I2) := Output(Output_Index(1), Output_Index(2), I1, I2) +
                                Input_Value * Filter (Filter_Index(1), Filter_Index(2), J1, J2);
                        end if;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Conv_2D_Core;

    procedure Conv_2D (Input, Filter: Real_Tensor_4D; Border: Border_Modes;
        Padding: Padding_Type_2; Stride, Dilation : Tiny_Positive_Vector_2; Output: in out Real_Tensor_4D) is
    begin
        for B in Output'Range(1) loop
            for K2 in Output'Range(2) loop
                for K1 in Input'Range(2) loop
                    Conv_2D_Core (Input, (B, K1), Filter, (K2, K1), Output, (B, K2), Border, Padding, Stride, Dilation);
                end loop;
            end loop;
        end loop;
    end Conv_2D;

    procedure Depthwise_Conv_2D (Input, Filter: Real_Tensor_4D; Border: Border_Modes;
        Padding: Padding_Type_2; Stride, Dilation : Tiny_Positive_Vector_2; Output: in out Real_Tensor_4D) is
        Multiplier: constant Natural := Output'Length(2) / Input'Length(2);
        Broadcast: constant Boolean := Filter'Length(1) = 1;
        K2, Z: Positive := 1;
    begin
        for B in Output'Range(1) loop
            for K1 in Input'Range(2) loop
                for M in 1..Multiplier loop
                    K2 := Multiplier * (K1-1) + M;
                    if NOT Broadcast then
                        Z := K2;
                    end if;
                    Conv_2D_Core (Input, (B, K1), Filter, (Z, 1), Output, (B, K2), Border, Padding, Stride, Dilation);
                end loop;
            end loop;
        end loop;
    end Depthwise_Conv_2D;

    procedure Groupped_Conv_2D (Input, Filter: Real_Tensor_4D; Border: Border_Modes;
        Padding: Padding_Type_2; Stride, Dilation : Tiny_Positive_Vector_2; Groups: Natural; Output: in out Real_Tensor_4D) is
        Input_Block: constant Natural := Input'Length(2) / Groups;
        Output_Block: constant Natural := Output'Length(2) / Groups;
        K1, K2: Positive;
    begin
        for B in Output'Range(1) loop
            for G in 1..Groups loop
                for Z in 1..Output_Block loop
                    K2 := (G - 1) * Output_Block + Z;
                    for C in 1..Input_Block loop
                        K1 := (G - 1) * Input_Block + C;
                        Conv_2D_Core (Input, (B, K1), Filter, (K2, C), Output, (B, K2), Border, Padding, Stride, Dilation);
                    end loop;
                end loop;
            end loop;
        end loop;
    end Groupped_Conv_2D;

    procedure Conv_Transposed_1D_Core
       (Input: Real_Tensor_3D; Input_Index: Tiny_Positive_Vector_2;
        Filter: Real_Tensor_3D; Filter_Index: Tiny_Positive_Vector_2;
        Output: in out Real_Tensor_3D; Output_Index: Tiny_Positive_Vector_2;
        Border: Border_Modes;
        Padding: Padding_Extent;
        Stride, Dilation : Positive)
    is
        Input_Value: Real;
        Idx1: Integer;
        Ignore: Boolean;
    begin
        for I1 in Output'Range (3) loop
            for J1 in Filter'Range (3) loop
                Idx1 := (I1-1) + Padding (1) - (J1-1) * Dilation;
                if Idx1 rem Stride = 0 then
                    Idx1 := Idx1 / Stride + Input'First(3);
                    Get_Input_Value_3 (Input, (Input_Index(1), Input_Index(2), Idx1), Border, Input_Value, Ignore);
                    if NOT Ignore then
                        Output(Output_Index(1), Output_Index(2), I1) := Output(Output_Index(1), Output_Index(2), I1) +
                            Input_Value * Filter (Filter_Index(1), Filter_Index(2), J1);
                    end if;
                end if;
            end loop;
        end loop;
    end Conv_Transposed_1D_Core;

    procedure Conv_Transposed_1D (Input, Filter: Real_Tensor_3D; Border: Border_Modes;
        Padding: Padding_Extent; Stride, Dilation : Positive; Output: in out Real_Tensor_3D) is
    begin
        for B in Output'Range(1) loop
            for K1 in Output'Range(2) loop
                for K2 in Input'Range(2) loop
                    Conv_Transposed_1D_Core (Input, (B, K2), Filter, (K2, K1), Output, (B, K1), Border, Padding, Stride, Dilation);
                end loop;
            end loop;
        end loop;
    end Conv_Transposed_1D;

    procedure Depthwise_Conv_Transposed_1D (Input, Filter: Real_Tensor_3D; Border: Border_Modes;
        Padding: Padding_Extent; Stride, Dilation : Positive; Output: in out Real_Tensor_3D) is
        Multiplier: constant Natural := Input'Length(2) / Output'Length(2);
        Broadcast: constant Boolean := Filter'Length(1) = 1;
        K1, Z: Positive := 1;
    begin
        for B in Output'Range(1) loop
            for K2 in Input'Range(2) loop
                if NOT Broadcast then
                    Z := K2;
                end if;
                for M in 1..Multiplier loop
                    K1 := (K2 + 1) / Multiplier;
                    Conv_Transposed_1D_Core (Input, (B, K2), Filter, (Z, 1), Output, (B, K1), Border, Padding, Stride, Dilation);
                end loop;
            end loop;
        end loop;
    end Depthwise_Conv_Transposed_1D;

    procedure Groupped_Conv_Transposed_1D (Input, Filter: Real_Tensor_3D; Border: Border_Modes;
        Padding: Padding_Extent; Stride, Dilation : Positive; Groups: Natural; Output: in out Real_Tensor_3D) is
        Input_Block: constant Natural := Input'Length(2) / Groups;
        Output_Block: constant Natural := Output'Length(2) / Groups;
        K1, K2: Positive;
    begin
        for B in Output'Range(1) loop
            for G in 1..Groups loop
                for Z in 1..Input_Block loop
                    K2 := (G - 1) * Input_Block + Z;
                    for C in 1..Output_Block loop
                        K1 := (G - 1) * Output_Block + C;
                        Conv_Transposed_1D_Core (Input, (B, K2), Filter, (K2, C), Output, (B, K1), Border, Padding, Stride, Dilation);
                    end loop;
                end loop;
            end loop;
        end loop;
    end Groupped_Conv_Transposed_1D;

    procedure Conv_Transposed_2D_Core
       (Input: Real_Tensor_4D; Input_Index: Tiny_Positive_Vector_2;
        Filter: Real_Tensor_4D; Filter_Index: Tiny_Positive_Vector_2;
        Output: in out Real_Tensor_4D; Output_Index: Tiny_Positive_Vector_2;
        Border: Border_Modes;
        Padding: Padding_Type_2;
        Stride, Dilation : Tiny_Positive_Vector_2)
    is
        Input_Value: Real;
        Ignore: Boolean;
        Idx1, Idx2: Integer;
    begin
        for I1 in Output'Range (3) loop
            for I2 in Output'Range (4) loop
                for J1 in Filter'Range (3) loop
                    Idx1 := (I1-1) + Padding (1)(1) - (J1-1) * Dilation (1);
                    if Idx1 rem Stride (1) = 0 then
                        Idx1 := Idx1 / Stride (1) + Input'First(3);
                        for J2 in Filter'Range (4) loop
                            Idx2 := (I2-1) + Padding (2)(1) - (J2-1) * Dilation (2);
                            if Idx2 rem Stride (1) = 0 then
                                Idx2 := Idx2 / Stride (2) + Input'First(4);
                                Get_Input_Value_4 (Input, (Input_Index(1), Input_Index(2), Idx1, Idx2), Border, Input_Value, Ignore);
                                if NOT Ignore then
                                    Output(Output_Index(1), Output_Index(2), I1, I2) := Output(Output_Index(1), Output_Index(2), I1, I2) +
                                        Input_Value * Filter (Filter_Index(1), Filter_Index(2), J1, J2);
                                end if;
                            end if;
                        end loop;
                    end if;
                end loop;
            end loop;
        end loop;
    end Conv_Transposed_2D_Core;

    procedure Conv_Transposed_2D (Input, Filter: Real_Tensor_4D; Border: Border_Modes;
        Padding: Padding_Type_2; Stride, Dilation : Tiny_Positive_Vector_2; Output: in out Real_Tensor_4D) is
    begin
        for B in Output'Range(1) loop
            for K1 in Output'Range(2) loop
                for K2 in Input'Range(2) loop
                    Conv_Transposed_2D_Core (Input, (B, K2), Filter, (K2, K1), Output, (B, K1), Border, Padding, Stride, Dilation);
                end loop;
            end loop;
        end loop;
    end Conv_Transposed_2D;

    procedure Depthwise_Conv_Transposed_2D (Input, Filter: Real_Tensor_4D; Border: Border_Modes;
        Padding: Padding_Type_2; Stride, Dilation : Tiny_Positive_Vector_2; Output: in out Real_Tensor_4D) is
        Multiplier: constant Natural := Input'Length(2) / Output'Length(2);
        Broadcast: constant Boolean := Filter'Length(1) = 1;
        K1, Z: Positive := 1;
    begin
        for B in Output'Range(1) loop
            for K2 in Input'Range(2) loop
                if NOT Broadcast then
                    Z := K2;
                end if;
                for M in 1..Multiplier loop
                    K1 := (K2 + 1) / Multiplier;
                    Conv_Transposed_2D_Core (Input, (B, K2), Filter, (Z, 1), Output, (B, K1), Border, Padding, Stride, Dilation);
                end loop;
            end loop;
        end loop;
    end Depthwise_Conv_Transposed_2D;

    procedure Groupped_Conv_Transposed_2D (Input, Filter: Real_Tensor_4D; Border: Border_Modes;
        Padding: Padding_Type_2; Stride, Dilation : Tiny_Positive_Vector_2; Groups: Natural; Output: in out Real_Tensor_4D) is
        Input_Block: constant Natural := Input'Length(2) / Groups;
        Output_Block: constant Natural := Output'Length(2) / Groups;
        K1, K2: Positive;
    begin
        for B in Output'Range(1) loop
            for G in 1..Groups loop
                for Z in 1..Input_Block loop
                    K2 := (G - 1) * Input_Block + Z;
                    for C in 1..Output_Block loop
                        K1 := (G - 1) * Output_Block + C;
                        Conv_Transposed_2D_Core (Input, (B, K2), Filter, (K2, C), Output, (B, K1), Border, Padding, Stride, Dilation);
                    end loop;
                end loop;
            end loop;
        end loop;
    end Groupped_Conv_Transposed_2D;

    procedure Pool
       (Input            : Real_Tensor_3D;
        Size : Tiny_Positive_Vector_3;
        Border           : Border_Modes;
        Padding          : Padding_Type_3;
        Stride, Dilation : Tiny_Positive_Vector_3;
        F : Binary_Real_Function;
        Output           : out Real_Tensor_3D) is
        Input_Value: Real;
        Ignore: Boolean;
        Input_Index: Tiny_Integer_Vector_3;
    begin
        for I1 in Output'Range(1) loop
            for I2 in Output'Range(2) loop
                for I3 in Output'Range(3) loop
                    for J1 in 1..Size(1) loop
                        Input_Index(1) := (I1-1) * Stride (1) + (J1-1) * Dilation (1) - Padding (1)(1) + Input'First(1);
                        for J2 in 1..Size(2) loop
                            Input_Index(2) := (I2-1) * Stride (2) + (J2-1) * Dilation (2) - Padding (2)(1) + Input'First(2);
                            for J3 in 1..Size(3) loop
                                Input_Index(3) := (I3-1) * Stride (3) + (J3-1) * Dilation (3) - Padding (3)(1) + Input'First(3);
                                Get_Input_Value_3 (Input, Input_Index, Border, Input_Value, Ignore);
                                if NOT Ignore then
                                    pragma Warnings (Off, "may be referenced before it has a value");
                                    Output (I1, I2, I3) := Call (F, Output (I1, I2, I3), Input_Value);
                                    pragma Warnings (On, "may be referenced before it has a value");
                                end if;
                            end loop;
                        end loop;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Pool;

    procedure Pool
       (Input            : Real_Tensor_4D;
        Size : Tiny_Positive_Vector_4;
        Border           : Border_Modes;
        Padding          : Padding_Type_4;
        Stride, Dilation : Tiny_Positive_Vector_4;
        F : Binary_Real_Function;
        Output           : out Real_Tensor_4D) is
        Input_Value: Real;
        Ignore: Boolean;
        Input_Index: Tiny_Integer_Vector_4;
    begin
        for I1 in Output'Range(1) loop
            for I2 in Output'Range(2) loop
                for I3 in Output'Range(3) loop
                    for I4 in Output'Range(4) loop
                        for J1 in 1..Size(1) loop
                            Input_Index(1) := (I1-1) * Stride (1) + (J1-1) * Dilation (1) - Padding (1)(1) + Input'First(1);
                            for J2 in 1..Size(2) loop
                                Input_Index(2) := (I2-1) * Stride (2) + (J2-1) * Dilation (2) - Padding (2)(1) + Input'First(2);
                                for J3 in 1..Size(3) loop
                                    Input_Index(3) := (I3-1) * Stride (3) + (J3-1) * Dilation (3) - Padding (3)(1) + Input'First(3);
                                    for J4 in 1..Size(4) loop
                                        Input_Index(4) := (I4-1) * Stride (4) + (J4-1) * Dilation (4) - Padding (4)(1) + Input'First(4);
                                        Get_Input_Value_4 (Input, Input_Index, Border, Input_Value, Ignore);
                                        if NOT Ignore then
                                            pragma Warnings (Off, "may be referenced before it has a value");
                                            Output (I1, I2, I3, I4) := Call (F, Output (I1, I2, I3, I4), Input_Value);
                                            pragma Warnings (On, "may be referenced before it has a value");
                                        end if;
                                    end loop;
                                end loop;
                            end loop;
                        end loop;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Pool;

    procedure Pool_Transposed
       (Input            : Real_Tensor_3D;
        Size : Tiny_Positive_Vector_3;
        Border           : Border_Modes;
        Padding          : Padding_Type_3;
        Stride, Dilation : Tiny_Positive_Vector_3;
        F : Binary_Real_Function;
        Output           : out Real_Tensor_3D) is
        Input_Value: Real;
        Ignore: Boolean;
        Input_Index: Tiny_Integer_Vector_3;
    begin
        for I1 in Output'Range(1) loop
            for I2 in Output'Range(2) loop
                for I3 in Output'Range(3) loop
                    for J1 in 1..Size(1) loop
                        Input_Index(1) := (I1-1) + Padding (1)(1) - (J1-1) * Dilation (1);
                        if Input_Index(1) rem Stride (1) = 0 then
                            Input_Index(1) := Input_Index(1) / Stride (1) + Input'First(1);
                            for J2 in 1..Size(2) loop
                                Input_Index(2) := (I2-1) + Padding (2)(1) - (J2-1) * Dilation (2);
                                if Input_Index(2) rem Stride (2) = 0 then
                                    Input_Index(2) := Input_Index(2) / Stride (2) + Input'First(2);
                                    for J3 in 1..Size(3) loop
                                        Input_Index(3) := (I3-1) + Padding (3)(1) - (J3-1) * Dilation (3);
                                        if Input_Index(3) rem Stride (3) = 0 then
                                            Input_Index(3) := Input_Index(3) / Stride (3) + Input'First(3);
                                            Get_Input_Value_3 (Input, Input_Index, Border, Input_Value, Ignore);
                                            if NOT Ignore then
                                                pragma Warnings (Off, "may be referenced before it has a value");
                                                Output (I1, I2, I3) := Call (F, Output (I1, I2, I3), Input_Value);
                                                pragma Warnings (On, "may be referenced before it has a value");
                                            end if;
                                        end if;
                                    end loop;
                                end if;
                            end loop;
                        end if;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Pool_Transposed;

    procedure Pool_Transposed
       (Input            : Real_Tensor_4D;
        Size : Tiny_Positive_Vector_4;
        Border           : Border_Modes;
        Padding          : Padding_Type_4;
        Stride, Dilation : Tiny_Positive_Vector_4;
        F : Binary_Real_Function;
        Output           : out Real_Tensor_4D) is
        Input_Value: Real;
        Ignore: Boolean;
        Input_Index: Tiny_Integer_Vector_4;
    begin
        for I1 in Output'Range(1) loop
            for I2 in Output'Range(2) loop
                for I3 in Output'Range(3) loop
                    for I4 in Output'Range(4) loop
                        for J1 in 1..Size(1) loop
                            Input_Index(1) := (I1-1) + Padding (1)(1) - (J1-1) * Dilation (1);
                            if Input_Index(1) rem Stride (1) = 0 then
                                Input_Index(1) := Input_Index(1) / Stride (1) + Input'First(1);
                                for J2 in 1..Size(2) loop
                                    Input_Index(2) := (I2-1) + Padding (2)(1) - (J2-1) * Dilation (2);
                                    if Input_Index(2) rem Stride (2) = 0 then
                                        Input_Index(2) := Input_Index(2) / Stride (2) + Input'First(2);
                                        for J3 in 1..Size(3) loop
                                            Input_Index(3) := (I3-1) + Padding (3)(1) - (J3-1) * Dilation (3);
                                            if Input_Index(3) rem Stride (3) = 0 then
                                                Input_Index(3) := Input_Index(3) / Stride (3) + Input'First(3);
                                                for J4 in 1..Size(4) loop
                                                    Input_Index(4) := (I4-1) + Padding (4)(1) - (J4-1) * Dilation (4);
                                                    if Input_Index(4) rem Stride (4) = 0 then
                                                        Input_Index(4) := Input_Index(4) / Stride (4) + Input'First(4);
                                                        Get_Input_Value_4 (Input, Input_Index, Border, Input_Value, Ignore);
                                                        if NOT Ignore then
                                                            pragma Warnings (Off, "may be referenced before it has a value");
                                                            Output (I1, I2, I3, I4) := Call (F, Output (I1, I2, I3, I4), Input_Value);
                                                            pragma Warnings (On, "may be referenced before it has a value");
                                                        end if;
                                                    end if;
                                                end loop;
                                            end if;
                                        end loop;
                                    end if;
                                end loop;
                            end if;
                        end loop;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Pool_Transposed;

    procedure Pool_Area
       (Input_Shape: Tiny_Positive_Vector_3;
        Size: Tiny_Positive_Vector_3;
        Padding: Padding_Type_3;
        Stride, Dilation: Tiny_Positive_Vector_3;
        Tensor: in out Real_Tensor_3D) is
        Input_Index: Tiny_Integer_Vector_3;
    begin
        for I1 in Tensor'Range(1) loop
            for I2 in Tensor'Range(2) loop
                for I3 in Tensor'Range(3) loop
                    for J1 in 1..Size(1) loop
                        Input_Index (1) := (I1-1) * Stride (1) + (J1-1) * Dilation (1) - Padding (1)(1);
                        if Input_Index (1) >= 0 AND then Input_Index(1) < Input_Shape(1) then
                            for J2 in 1..Size(2) loop
                                Input_Index (2) := (I2-1) * Stride (2) + (J2-1) * Dilation (2) - Padding (2)(1);
                                if Input_Index (2) >= 0 AND then Input_Index(2) < Input_Shape(2) then
                                    for J3 in 1..Size(3) loop
                                        Input_Index (3) := (I3-1) * Stride (3) + (J3-1) * Dilation (3) - Padding (3)(1);
                                        if Input_Index (3) >= 0 AND then Input_Index(3) < Input_Shape(3) then
                                            Tensor (I1, I2, I3) := Tensor (I1, I2, I3) + 1.0;
                                        end if;
                                    end loop;
                                end if;
                            end loop;
                        end if;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Pool_Area;

    procedure Pool_Area
       (Input_Shape: Tiny_Positive_Vector_4;
        Size: Tiny_Positive_Vector_4;
        Padding: Padding_Type_4;
        Stride, Dilation: Tiny_Positive_Vector_4;
        Tensor: in out Real_Tensor_4D) is
        Input_Index: Tiny_Integer_Vector_4;
    begin
        for I1 in Tensor'Range(1) loop
            for I2 in Tensor'Range(2) loop
                for I3 in Tensor'Range(3) loop
                    for I4 in Tensor'Range(4) loop
                        for J1 in 1..Size(1) loop
                            Input_Index (1) := (I1-1) * Stride (1) + (J1-1) * Dilation (1) - Padding (1)(1);
                            if Input_Index (1) >= 0 AND then Input_Index(1) < Input_Shape(1) then
                                for J2 in 1..Size(2) loop
                                    Input_Index (2) := (I2-1) * Stride (2) + (J2-1) * Dilation (2) - Padding (2)(1);
                                    if Input_Index (2) >= 0 AND then Input_Index(2) < Input_Shape(2) then
                                        for J3 in 1..Size(3) loop
                                            Input_Index (3) := (I3-1) * Stride (3) + (J3-1) * Dilation (3) - Padding (3)(1);
                                            if Input_Index (3) >= 0 AND then Input_Index(3) < Input_Shape(3) then
                                                for J4 in 1..Size(4) loop
                                                    Input_Index (4) := (I4-1) * Stride (4) + (J4-1) * Dilation (4) - Padding (4)(1);
                                                    if Input_Index (4) >= 0 AND then Input_Index(4) < Input_Shape(4) then
                                                        Tensor (I1, I2, I3, I4) := Tensor (I1, I2, I3, I4) + 1.0;
                                                    end if;
                                                end loop;
                                            end if;
                                        end loop;
                                    end if;
                                end loop;
                            end if;
                        end loop;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Pool_Area;

    procedure Pool_Area_Transposed
       (Input_Shape: Tiny_Positive_Vector_3;
        Size : Tiny_Positive_Vector_3;
        Padding          : Padding_Type_3;
        Stride, Dilation : Tiny_Positive_Vector_3;
        Tensor           : in out Real_Tensor_3D) is
        Input_Index: Tiny_Integer_Vector_3;
    begin
        for I1 in Tensor'Range(1) loop
            for I2 in Tensor'Range(2) loop
                for I3 in Tensor'Range(3) loop
                    for J1 in 1..Size(1) loop
                        Input_Index(1) := (I1-1) + Padding (1)(1) - (J1-1) * Dilation (1);
                        if Input_Index(1) rem Stride (1) = 0 then
                            Input_Index(1) := Input_Index(1) / Stride (1);
                            if Input_Index (1) >= 0 AND then Input_Index(1) < Input_Shape(1) then
                            for J2 in 1..Size(2) loop
                                Input_Index(2) := (I2-1) + Padding (2)(1) - (J2-1) * Dilation (2);
                                if Input_Index(2) rem Stride (2) = 0 then
                                    Input_Index(2) := Input_Index(2) / Stride (2);
                                    if Input_Index (2) >= 0 AND then Input_Index(2) < Input_Shape(2) then
                                    for J3 in 1..Size(3) loop
                                        Input_Index(3) := (I3-1) + Padding (3)(1) - (J3-1) * Dilation (3);
                                        if Input_Index(3) rem Stride (3) = 0 then
                                            Input_Index(3) := Input_Index(3) / Stride (3);
                                            if Input_Index (3) >= 0 AND then Input_Index(3) < Input_Shape(3) then
                                                Tensor (I1, I2, I3) := Tensor (I1, I2, I3) + 1.0;
                                            end if;
                                        end if;
                                    end loop;
                                    end if;
                                end if;
                            end loop;
                            end if;
                        end if;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Pool_Area_Transposed;

    procedure Pool_Area_Transposed
       (Input_Shape: Tiny_Positive_Vector_4;
        Size : Tiny_Positive_Vector_4;
        Padding          : Padding_Type_4;
        Stride, Dilation : Tiny_Positive_Vector_4;
        Tensor           : in out Real_Tensor_4D) is
        Input_Index: Tiny_Integer_Vector_4;
    begin
        for I1 in Tensor'Range(1) loop
            for I2 in Tensor'Range(2) loop
                for I3 in Tensor'Range(3) loop
                    for I4 in Tensor'Range(4) loop
                        for J1 in 1..Size(1) loop
                            Input_Index(1) := (I1-1) + Padding (1)(1) - (J1-1) * Dilation (1);
                            if Input_Index(1) rem Stride (1) = 0 then
                                Input_Index(1) := Input_Index(1) / Stride (1);
                                if Input_Index (1) >= 0 AND then Input_Index(1) < Input_Shape(1) then
                                for J2 in 1..Size(2) loop
                                    Input_Index(2) := (I2-1) + Padding (2)(1) - (J2-1) * Dilation (2);
                                    if Input_Index(2) rem Stride (2) = 0 then
                                        Input_Index(2) := Input_Index(2) / Stride (2);
                                        if Input_Index (2) >= 0 AND then Input_Index(2) < Input_Shape(2) then
                                        for J3 in 1..Size(3) loop
                                            Input_Index(3) := (I3-1) + Padding (3)(1) - (J3-1) * Dilation (3);
                                            if Input_Index(3) rem Stride (3) = 0 then
                                                Input_Index(3) := Input_Index(3) / Stride (3);
                                                if Input_Index (3) >= 0 AND then Input_Index(3) < Input_Shape(3) then
                                                for J4 in 1..Size(4) loop
                                                    Input_Index(4) := (I4-1) + Padding (4)(1) - (J4-1) * Dilation (4);
                                                    if Input_Index(4) rem Stride (4) = 0 then
                                                        Input_Index(4) := Input_Index(4) / Stride (4);
                                                        if Input_Index (4) >= 0 AND then Input_Index(4) < Input_Shape(4) then
                                                            Tensor (I1, I2, I3, I4) := Tensor (I1, I2, I3, I4) + 1.0;
                                                        end if;
                                                    end if;
                                                end loop;
                                                end if;
                                            end if;
                                        end loop;
                                        end if;
                                    end if;
                                end loop;
                                end if;
                            end if;
                        end loop;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Pool_Area_Transposed;

    procedure Arg_Pool
       (Input            : Real_Tensor_3D;
        Size : Tiny_Positive_Vector_3;
        Border           : Border_Modes;
        Padding          : Padding_Type_3;
        Stride, Dilation : Tiny_Positive_Vector_3;
        F : Compare_Real_Function;
        Output           : out Natural_Tensor_3D) is
        Input_Value, Arg_Value: Real;
        Ignore: Boolean;
        Input_Index: Tiny_Integer_Vector_3;
    begin
        for I1 in Output'Range(1) loop
            for I2 in Output'Range(2) loop
                for I3 in Output'Range(3) loop
                    Output (I1, I2, I3) := 0;
                    Input_Index(1) := (I1-1) * Stride (1) + Padding (1)(1) + Input'First(1);
                    Input_Index(2) := (I2-1) * Stride (2) + Padding (2)(1) + Input'First(2);
                    Input_Index(3) := (I3-1) * Stride (3) + Padding (3)(1) + Input'First(3);
                    Get_Input_Value_3 (Input, Input_Index, Border, Arg_Value, Ignore);
                    for J1 in 0..Size(1)-1 loop
                        Input_Index(1) := (I1-1) * Stride (1) + J1 * Dilation (1) - Padding (1)(1) + Input'First(1);
                        for J2 in 0..Size(2)-1 loop
                            Input_Index(2) := (I2-1) * Stride (2) + J2 * Dilation (2) - Padding (2)(1) + Input'First(2);
                            for J3 in 0..Size(3)-1 loop
                                Input_Index(3) := (I3-1) * Stride (3) + J3 * Dilation (3) - Padding (3)(1) + Input'First(3);
                                Get_Input_Value_3 (Input, Input_Index, Border, Input_Value, Ignore);
                                if NOT Ignore then
                                    if Call (F, Input_Value, Arg_Value) then
                                        Output (I1, I2, I3) := J3 + Size (3) * (J2 + Size (2) * J1);
                                        Arg_Value := Input_Value;
                                    end if;
                                end if;
                            end loop;
                        end loop;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Arg_Pool;

    procedure Arg_Pool
       (Input            : Real_Tensor_4D;
        Size : Tiny_Positive_Vector_4;
        Border           : Border_Modes;
        Padding          : Padding_Type_4;
        Stride, Dilation : Tiny_Positive_Vector_4;
        F : Compare_Real_Function;
        Output           : out Natural_Tensor_4D) is
        Input_Value, Arg_Value: Real;
        Ignore: Boolean;
        Input_Index: Tiny_Integer_Vector_4;
    begin
        for I1 in Output'Range(1) loop
            for I2 in Output'Range(2) loop
                for I3 in Output'Range(3) loop
                    for I4 in Output'Range(4) loop
                        Output (I1, I2, I3, I4) := 0;
                        Input_Index(1) := (I1-1) * Stride (1) + Padding (1)(1) + Input'First(1);
                        Input_Index(2) := (I2-1) * Stride (2) + Padding (2)(1) + Input'First(2);
                        Input_Index(3) := (I3-1) * Stride (3) + Padding (3)(1) + Input'First(3);
                        Input_Index(4) := (I4-1) * Stride (4) + Padding (4)(1) + Input'First(4);
                        Get_Input_Value_4 (Input, Input_Index, Border, Arg_Value, Ignore);
                        for J1 in 0..Size(1)-1 loop
                            Input_Index(1) := (I1-1) * Stride (1) + J1 * Dilation (1) - Padding (1)(1) + Input'First(1);
                            for J2 in 0..Size(2)-1 loop
                                Input_Index(2) := (I2-1) * Stride (2) + J2 * Dilation (2) - Padding (2)(1) + Input'First(2);
                                for J3 in 0..Size(3)-1 loop
                                    Input_Index(3) := (I3-1) * Stride (3) + J3 * Dilation (3) - Padding (3)(1) + Input'First(3);
                                    for J4 in 0..Size(4)-1 loop
                                        Input_Index(4) := (I4-1) * Stride (4) + J4 * Dilation (4) - Padding (4)(1) + Input'First(4);
                                        Get_Input_Value_4 (Input, Input_Index, Border, Input_Value, Ignore);
                                        if NOT Ignore then
                                            if Call (F, Input_Value, Arg_Value) then
                                                Output (I1, I2, I3, I4) := J4 + Size (4) * (J3 + Size (3) * (J2 + Size (2) * J1));
                                                Arg_Value := Input_Value;
                                            end if;
                                        end if;
                                    end loop;
                                end loop;
                            end loop;
                        end loop;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Arg_Pool;

    procedure Sample_Core
       (Input            : Real_Tensor_3D; Index : Natural_Tensor_3D;
        Size : Tiny_Positive_Vector_3;
        Border           : Border_Modes;
        Padding          : Padding_Type_3;
        Stride, Dilation : Tiny_Positive_Vector_3;
        Output: out Real_Tensor_3D) is
        Input_Value: Real := 0.0;
        Idx1, Idx2, Idx3: Integer;
        J1, J2, J3: Natural;
        Ignore: Boolean;
    begin
        for I1 in Output'Range(1) loop
            for I2 in Output'Range(2) loop
                for I3 in Output'Range(3) loop
                    J1 := Index (I1, I2, I3) / (Size(2)*Size(3));
                    J2 := (Index (I1, I2, I3) rem (Size(2)*Size(3))) / Size(3);
                    J3 := Index (I1, I2, I3) rem Size(3);
                    Idx1 := (I1-1) * Stride (1) + J1 * Dilation (1) - Padding (1)(1) + 1;
                    Idx2 := (I2-1) * Stride (2) + J2 * Dilation (2) - Padding (2)(1) + 1;
                    Idx3 := (I3-1) * Stride (3) + J3 * Dilation (3) - Padding (3)(1) + 1;
                    Get_Input_Value_3 (Input, (Idx1, Idx2, Idx3), Border, Input_Value, Ignore);
                    if NOT Ignore then
                        Output (I1, I2, I3) := Input_Value;
                    end if;
                end loop;
            end loop;
        end loop;
    end Sample_Core;

    procedure Sample_Core
       (Input            : Real_Tensor_4D; Index : Natural_Tensor_4D;
        Size : Tiny_Positive_Vector_4;
        Border           : Border_Modes;
        Padding          : Padding_Type_4;
        Stride, Dilation : Tiny_Positive_Vector_4;
        Output: out Real_Tensor_4D) is
        Input_Value: Real := 0.0;
        Idx1, Idx2, Idx3, Idx4: Integer;
        J1, J2, J3, J4: Natural;
        Ignore: Boolean;
    begin
        for I1 in Output'Range(1) loop
            for I2 in Output'Range(2) loop
                for I3 in Output'Range(3) loop
                    for I4 in Output'Range(4) loop
                        J1 := Index (I1, I2, I3, I4) / (Size(2)*Size(3)*Size(4));
                        J2 := (Index (I1, I2, I3, I4) rem (Size(2)*Size(3)*Size(4))) / (Size(3)*Size(4));
                        J3 := (Index (I1, I2, I3, I4) rem (Size(3)*Size(4))) / Size(4);
                        J4 := Index (I1, I2, I3, I4) rem Size(4);
                        Idx1 := (I1-1) * Stride (1) + J1 * Dilation (1) - Padding (1)(1) + 1;
                        Idx2 := (I2-1) * Stride (2) + J2 * Dilation (2) - Padding (2)(1) + 1;
                        Idx3 := (I3-1) * Stride (3) + J3 * Dilation (3) - Padding (3)(1) + 1;
                        Idx4 := (I4-1) * Stride (4) + J4 * Dilation (4) - Padding (4)(1) + 1;
                        Get_Input_Value_4 (Input, (Idx1, Idx2, Idx3, Idx4), Border, Input_Value, Ignore);
                        if NOT Ignore then
                            Output (I1, I2, I3, I4) := Input_Value;
                        end if;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Sample_Core;

    procedure Desample_Core
       (Input            : Real_Tensor_3D; Index : Natural_Tensor_3D;
        Size : Tiny_Positive_Vector_3;
        Border           : Border_Modes;
        Padding          : Padding_Type_3;
        Stride, Dilation : Tiny_Positive_Vector_3;
        Output: in out Real_Tensor_3D) is
        Input_Value: Real := 0.0;
        Border1, Border2, Border3: Boolean;
        Idx1, Idx2, Idx3: Integer;
        J1, J2, J3: Natural;
        Ignore: Boolean;
    begin
        for I1 in Output'Range(1) loop
            for I2 in Output'Range(2) loop
                for I3 in Output'Range(3) loop
                    J1 := Index (I1, I2, I3) / (Size(2)*Size(3));
                    J2 := (Index (I1, I2, I3) rem (Size(2)*Size(3))) / Size(3);
                    J3 := Index (I1, I2, I3) rem Size(3);
                    Idx1 := (I1-1) + Padding (1)(1) - J1 * Dilation (1);
                    Idx1 := Idx1 / Stride (1) + 1;
                    Idx2 := (I2-1) + Padding (2)(1) - J2 * Dilation (2);
                    Idx2 := Idx2 / Stride (2) + 1;
                    Idx3 := (I3-1) + Padding (3)(1) - J3 * Dilation (3);
                    Idx3 := Idx3 / Stride (3) + 1;
                    Get_Input_Value_3 (Input, (Idx1, Idx2, Idx3), Border, Input_Value, Ignore);
                    Output (I1, I2, I3) := 0.0;
                    if NOT Ignore then
                        Output (I1, I2, I3) := Output (I1, I2, I3) + Input_Value;
                    end if;
                end loop;
            end loop;
        end loop;
    end Desample_Core;

    procedure Desample_Core
       (Input            : Real_Tensor_4D; Index : Natural_Tensor_4D;
        Size : Tiny_Positive_Vector_4;
        Border           : Border_Modes;
        Padding          : Padding_Type_4;
        Stride, Dilation : Tiny_Positive_Vector_4;
        Output: in out Real_Tensor_4D) is
        Input_Value: Real := 0.0;
        Idx1, Idx2, Idx3, Idx4: Integer;
        J1, J2, J3, J4: Natural;
        Ignore: Boolean;
    begin
        for I1 in Output'Range(1) loop
            for I2 in Output'Range(2) loop
                for I3 in Output'Range(3) loop
                    for I4 in Output'Range(4) loop
                        J1 := Index (I1, I2, I3, I4) / (Size(2)*Size(3)*Size(4));
                        J2 := (Index (I1, I2, I3, I4) rem (Size(2)*Size(3)*Size(4))) / (Size(3)*Size(4));
                        J3 := (Index (I1, I2, I3, I4) rem (Size(3)*Size(4))) / Size(4);
                        J4 := Index (I1, I2, I3, I4) rem Size(4);
                        Idx1 := (I1-1) + Padding (1)(1) - J1 * Dilation (1);
                        Idx1 := Idx1 / Stride (1) + 1;
                        Idx2 := (I2-1) + Padding (2)(1) - J2 * Dilation (2);
                        Idx2 := Idx2 / Stride (2) + 1;
                        Idx3 := (I3-1) + Padding (3)(1) - J3 * Dilation (3);
                        Idx3 := Idx3 / Stride (3) + 1;
                        Idx4 := (I4-1) + Padding (4)(1) - J4 * Dilation (4);
                        Idx4 := Idx4 / Stride (4) + 1;
                        Get_Input_Value_4 (Input, (Idx1, Idx2, Idx3, Idx4), Border, Input_Value, Ignore);
                        Output (I1, I2, I3, I4) := 0.0;
                        if NOT Ignore then
                            Output (I1, I2, I3, I4) := Output (I1, I2, I3, I4) + Input_Value;
                        end if;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Desample_Core;

    procedure Reshape (Input: Real_Vector; Output: out Real_Matrix) is
        I1: Positive := Input'First;
    begin
        for I in Output'Range(1) loop
            for J in Output'Range(2) loop
                Output (I, J) := Input (I1);
                I1 := I1 + 1;
            end loop;
        end loop;
    end Reshape;

    procedure Reshape (Input: Real_Vector; Output: out Real_Tensor_3D) is
        I1: Positive := Input'First;
    begin
        for I in Output'Range(1) loop
            for J in Output'Range(2) loop
                for K in Output'Range(3) loop
                    Output (I, J, K) := Input (I1);
                    I1 := I1 + 1;
                end loop;
            end loop;
        end loop;
    end Reshape;

    procedure Reshape (Input: Real_Vector; Output: out Real_Tensor_4D) is
        I1: Positive := Input'First;
    begin
        for I in Output'Range(1) loop
            for J in Output'Range(2) loop
                for K in Output'Range(3) loop
                    for L in Output'Range(4) loop
                        Output (I, J, K, L) := Input (I1);
                        I1 := I1 + 1;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Reshape;

    procedure Reshape (Input: Real_Matrix; Output: out Real_Vector) is
        I1: Positive := Output'First;
    begin
        for I in Input'Range(1) loop
            for J in Input'Range(2) loop
                Output (I1) := Input (I, J);
                I1 := I1 + 1;
            end loop;
        end loop;
    end Reshape;

    procedure Reshape (Input: Real_Matrix; Output: out Real_Tensor_3D) is
        I1: Positive := Input'First(1);
        J1: Positive := Input'First(2);
    begin
        for I in Output'Range(1) loop
            for J in Output'Range(2) loop
                for K in Output'Range(3) loop
                    Output (I, J, K) := Input (I1, J1);
                    if J1 = Input'Last(2) then
                        I1 := I1 + 1;
                        J1 := Input'First(2);
                    else
                        J1 := J1 + 1;
                    end if;
                end loop;
            end loop;
        end loop;
    end Reshape;

    procedure Reshape (Input: Real_Matrix; Output: out Real_Tensor_4D) is
        I1: Positive := Input'First(1);
        J1: Positive := Input'First(2);
    begin
        for I in Output'Range(1) loop
            for J in Output'Range(2) loop
                for K in Output'Range(3) loop
                    for L in Output'Range(4) loop
                        Output (I, J, K, L) := Input (I1, J1);
                        if J1 = Input'Last(2) then
                            I1 := I1 + 1;
                            J1 := Input'First(2);
                        else
                            J1 := J1 + 1;
                        end if;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Reshape;

    procedure Reshape (Input: Real_Tensor_3D; Output: out Real_Vector) is
        I1: Positive := Output'First;
    begin
        for I in Input'Range(1) loop
            for J in Input'Range(2) loop
                for K in Input'Range(3) loop
                    Output (I1) := Input (I, J, K);
                    I1 := I1 + 1;
                end loop;
            end loop;
        end loop;
    end Reshape;

    procedure Reshape (Input: Real_Tensor_3D; Output: out Real_Matrix) is
        I1: Positive := Output'First(1);
        J1: Positive := Output'First(2);
    begin
        for I in Input'Range(1) loop
            for J in Input'Range(2) loop
                for K in Input'Range(3) loop
                    Output (I1, J1) := Input (I, J, K);
                    if J1 = Output'Last(2) then
                        I1 := I1 + 1;
                        J1 := Output'First(2);
                    else
                        J1 := J1 + 1;
                    end if;
                end loop;
            end loop;
        end loop;
    end Reshape;

    procedure Reshape (Input: Real_Tensor_3D; Output: out Real_Tensor_4D) is
        I1: Positive := Input'First(1);
        J1: Positive := Input'First(2);
        K1: Positive := Input'First(3);
    begin
        for I in Output'Range(1) loop
            for J in Output'Range(2) loop
                for K in Output'Range(3) loop
                    for L in Output'Range(4) loop
                        Output (I, J, K, L) := Input (I1, J1, K1);
                        if K1 = Input'Last(3) then
                            if J1 = Input'Last(2) then
                                I1 := I1 + 1;
                                J1 := Input'First(2);
                            else
                                J1 := J1 + 1;
                            end if;
                            K1 := Input'First(3);
                        else
                            K1 := K1 + 1;
                        end if;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Reshape;

    procedure Reshape (Input: Real_Tensor_4D; Output: out Real_Vector) is
        I1: Positive := Output'First;
    begin
        for I in Input'Range(1) loop
            for J in Input'Range(2) loop
                for K in Input'Range(3) loop
                    for L in Input'Range(4) loop
                        Output (I1) := Input (I, J, K, L);
                        I1 := I1 + 1;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Reshape;

    procedure Reshape (Input: Real_Tensor_4D; Output: out Real_Matrix) is
        I1: Positive := Output'First(1);
        J1: Positive := Output'First(2);
    begin
        for I in Input'Range(1) loop
            for J in Input'Range(2) loop
                for K in Input'Range(3) loop
                    for L in Input'Range(4) loop
                        Output (I1, J1) := Input (I, J, K, L);
                        if J1 = Output'Last(2) then
                            I1 := I1 + 1;
                            J1 := Output'First(2);
                        else
                            J1 := J1 + 1;
                        end if;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Reshape;

    procedure Reshape (Input: Real_Tensor_4D; Output: out Real_Tensor_3D) is
        I1: Positive := Output'First(1);
        J1: Positive := Output'First(2);
        K1: Positive := Output'First(3);
    begin
        for I in Input'Range(1) loop
            for J in Input'Range(2) loop
                for K in Input'Range(3) loop
                    for L in Input'Range(4) loop
                        Output (I1, J1, K1) := Input (I, J, K, L);
                        if K1 = Output'Last(3) then
                            if J1 = Output'Last(2) then
                                I1 := I1 + 1;
                                J1 := Output'First(2);
                            else
                                J1 := J1 + 1;
                            end if;
                            K1 := Output'First(3);
                        else
                            K1 := K1 + 1;
                        end if;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Reshape;

    procedure Transpose (X : Real_Matrix; A: out Real_Matrix) is
    begin
        for I in X'Range(1) loop
            for J in X'Range(2) loop
                A (J, I) := X (I, J);
            end loop;
        end loop;
    end Transpose;

    procedure Transpose (X : Real_Vector; A: out Real_Matrix) is
    begin
        for I in X'Range loop
            A (1, I) := X (I);
        end loop;
    end Transpose;

    procedure Transpose (A : Real_Matrix; X: out Real_Vector) is
    begin
        for I in A'Range (2) loop
            X (I) := A (1, I);
        end loop;
    end Transpose;

    procedure Transpose (Input: Real_Tensor_3D; Axes: Tiny_Positive_Vector; Output: out Real_Tensor_3D) is
        --  Input_Shape: Positive_Vector := (Input'Length(1), Input'Length(2), Input'Length(3));
        Output_Shape: Tiny_Positive_Vector := (Output'Length(1), Output'Length(2), Output'Length(3));
        Output_Axes: Tiny_Positive_Vector(Output_Shape'Range);
    begin
        for I in Axes'Range loop
            --  Output_Shape(I) := Input_Shape(Axes(I));
            Output_Axes(I) := Axes(I);
        end loop;
        for I in Axes'Last+1..Output_Axes'Last loop
            --  Output_Shape(I) := Input_Shape(I);
            Output_Axes(I) := I;
        end loop;
        declare
            --  Output: Real_Tensor_3D(1..Output_Shape(1), 1..Output_Shape(2), 1..Output_Shape(3));
            Index: Tiny_Positive_Vector(1..3);
        begin
            for I in Input'Range(1) loop
                Index(Output_Axes(1)) := I;
                for J in Input'Range(2) loop
                    Index(Output_Axes(2)) := J;
                    for K in Input'Range(3) loop
                        Index(Output_Axes(3)) := K;
                        Output (Index(1), Index(2), Index(3)) := Input (I, J, K);
                    end loop;
                end loop;
            end loop;
            --  return Output;
        end;
    end Transpose;

    procedure Transpose (Input: Real_Tensor_4D; Axes: Tiny_Positive_Vector; Output: out Real_Tensor_4D) is
        --  Input_Shape: Tiny_Positive_Vector := (Input'Length(1), Input'Length(2), Input'Length(3), Input'Length(4));
        Output_Shape: Tiny_Positive_Vector := (Output'Length(1), Output'Length(2), Output'Length(3), Output'Length(4));
        Output_Axes: Tiny_Positive_Vector(Output_Shape'Range);
    begin
        for I in Axes'Range loop
            --  Output_Shape(I) := Input_Shape(Axes(I));
            Output_Axes(I) := Axes(I);
        end loop;
        for I in Axes'Last+1..Output_Axes'Last loop
            --  Output_Shape(I) := Input_Shape(I);
            Output_Axes(I) := I;
        end loop;
        declare
            --  Output: Real_Tensor_4D(1..Output_Shape(1), 1..Output_Shape(2), 1..Output_Shape(3), 1..Output_Shape(4));
            Index: Tiny_Positive_Vector(1..4);
        begin
            for I in Input'Range(1) loop
                Index(Output_Axes(1)) := I;
                for J in Input'Range(2) loop
                    Index(Output_Axes(2)) := J;
                    for K in Input'Range(3) loop
                        Index(Output_Axes(3)) := K;
                        for L in Input'Range(4) loop
                            Index(Output_Axes(4)) := L;
                            Output (Index(1), Index(2), Index(3), Index(4)) := Input (I, J, K, L);
                        end loop;
                    end loop;
                end loop;
            end loop;
            --  return Output;
        end;
    end Transpose;

    procedure Slice (Input: Real_Tensor_4D; Axes: Tiny_Positive_Vector; Slice_Begin, Slice_End: Tiny_Integer_Vector; Stride: Tiny_Integer_Vector; Output: out Real_Tensor_4D) is
        Input_Shape: Tiny_Positive_Vector := (Input'Length(1), Input'Length(2), Input'Length(3), Input'Length(4));
        First: Tiny_Positive_Vector := (Input'First(1), Input'First(2), Input'First(3), Input'First(4));
        Last: Tiny_Positive_Vector := (Input'Last(1), Input'Last(2), Input'Last(3), Input'Last(4));
        Strides: Tiny_Integer_Vector := (1..4 => 1);
        VI, VJ, VK, VL: Positive;
    begin
        for I in Axes'Range loop
            if Slice_Begin(I) < 1 then
                First(Axes(I)) := Input_Shape(Axes(I)) - Slice_Begin(I);
            else
                First(Axes(I)) := Slice_Begin(I);
            end if;
            if Slice_End(I) < 1 then
                Last(Axes(I)) := Input_Shape(Axes(I)) - Slice_End(I);
            else
                Last(Axes(I)) := Slice_End(I);
            end if;
            Strides(Axes(I)) := Stride(I);
        end loop;
        for I in Output'Range(1) loop
            VI := First(1) + (I-1) * Strides(1);
            for J in Output'Range(2) loop
                VJ := First(2) + (J-1) * Strides(2);
                for K in Output'Range(3) loop
                    VK := First(3) + (K-1) * Strides(3);
                    for L in Output'Range(4) loop
                        VL := First(4) + (L-1) * Strides(4);
                        Output(I, J, K, L) := Input(VI, VJ, VK, VL);
                    end loop;
                end loop;
            end loop;
        end loop;
    end;

    procedure Pad (Input: Real_Tensor_4D; Padding: Padding_Type; Border: Border_Modes := Border_Mode_Constant; Value: Real := 0.0; Output: out Real_Tensor_4D) is
        VI, VJ, VK, VL: Positive;
        Input_Value: Real;
        Ignore: Boolean;
    begin
        for I in Output'Range(1) loop
            VI := I - Padding(1)(1);
            for J in Output'Range(2) loop
                VJ := J - Padding(2)(1);
                for K in Output'Range(3) loop
                    VK := K - Padding(3)(1);
                    for L in Output'Range(4) loop
                        VL := L - Padding(4)(1);
                        Get_Input_Value_4 (Input, (VI, VJ, VK, VL), Border, Input_Value, Ignore);
                        if NOT Ignore then
                            Output (I, J, K, L) := Input_Value;
                        end if;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Pad;

    procedure Tile (Input: Real_Tensor_4D; Output: out Real_Tensor_4D) is
        VI, VJ, VK, VL: Positive;
    begin
        for I in Output'Range(1) loop
            VI := (I-1) rem Input'Length(1) + 1;
            for J in Output'Range(2) loop
                VJ := (J-1) rem Input'Length(2) + 1;
                for K in Output'Range(3) loop
                    VK := (K-1) rem Input'Length(3) + 1;
                    for L in Output'Range(4) loop
                        VL := (L-1) rem Input'Length(4);
                        Output(I, J, K, L) := Input(VI, VJ, VK, VL);
                    end loop;
                end loop;
            end loop;
        end loop;
    end Tile;

    procedure Gather (Input: Real_Tensor_3D; Indices: Positive_Matrix; Axis: Positive := 1; Output: out Real_Tensor_4D) is
        VI, VJ, VK: Positive;
    begin
        for I in Output'Range(1) loop
            if Axis > 1 then
                VI := I;
            end if;
            for J in Output'Range(2) loop
                if Axis > 2 then
                    VJ := J;
                end if;
                for K in Output'Range(3) loop
                    for L in Output'Range(4) loop
                        if Axis = 1 then
                            VI := Indices(I, J);
                            VJ := K;
                            VK := L;
                        elsif Axis = 2 then
                            VJ := Indices(J, K);
                            VK := L;
                        elsif Axis = 3 then
                            VK := Indices(K, L);
                        end if;
                        Output(I, J, K, L) := Input(VI, VJ, VK);
                    end loop;
                end loop;
            end loop;
        end loop;
    end Gather;

    procedure Cast (Input: Real_Tensor_4D; Output: out Integer_Tensor_4D) is
    begin
        for I in Output'Range(1) loop
            for J in Output'Range(2) loop
                for K in Output'Range(3) loop
                    for L in Output'Range(4) loop
                        Output(I, J, K, L) := Integer(Input(I, J, K, L));
                    end loop;
                end loop;
            end loop;
        end loop;
    end Cast;

    procedure Cast (Input: Integer_Tensor_4D; Output: out Boolean_Tensor_4D) is
    begin
        for I in Output'Range(1) loop
            for J in Output'Range(2) loop
                for K in Output'Range(3) loop
                    for L in Output'Range(4) loop
                        Output(I, J, K, L) := Input(I, J, K, L) /= 0;
                    end loop;
                end loop;
            end loop;
        end loop;
    end Cast;

    procedure Cast (Input: Integer_Tensor_4D; Output: out Real_Tensor_4D) is
    begin
        for I in Output'Range(1) loop
            for J in Output'Range(2) loop
                for K in Output'Range(3) loop
                    for L in Output'Range(4) loop
                        Output(I, J, K, L) := Real(Input(I, J, K, L));
                    end loop;
                end loop;
            end loop;
        end loop;
    end Cast;

    procedure Inner_Product(A, B: Real_Matrix; C: out Real_Matrix) is
    begin
        for I in A'Range(1) loop
            for J in B'Range(2) loop
                C(I, J) := 0.0;
                for K in A'Range(2) loop
                    C(I, J) := C(I, J) + A(I, K) * B(K, J);
                end loop;
            end loop;
        end loop;
    end;

    procedure Inner_Product(A: Real_Vector; B: Real_Matrix; C: out Real_Matrix) is
    begin
        for I in A'Range loop
            for J in B'Range(2) loop
                C(I, J) := A(I) * B(1, J);
            end loop;
        end loop;
    end;

    procedure Inner_Product(A: Real_Matrix; B: Real_Vector; C: out Real_Vector) is
    begin
        for I in A'Range(1) loop
            C(I) := 0.0;
            for J in A'Range(2) loop
                C(I) := C(I) + A(I, J) * B(J);
            end loop;
        end loop;
    end;

    procedure MatMult_TransposeAB (A, B : Real_Matrix; C: out Real_Matrix) is
    begin
        for I in A'Range(2) loop
            for J in B'Range(1) loop
                C(I, J) := 0.0;
                for K in A'Range(1) loop
                    C(I, J) := C(I, J) + A(K, I) * B(J, K);
                end loop;
            end loop;
        end loop;
    end MatMult_TransposeAB;

    procedure MatMult_TransposeA (A, B : Real_Matrix; C: out Real_Matrix) is
    begin
        for I in A'Range(2) loop
            for J in B'Range(2) loop
                C(I, J) := 0.0;
                for K in A'Range(1) loop
                    C(I, J) := C(I, J) + A(K, I) * B(K, J);
                end loop;
            end loop;
        end loop;
    end MatMult_TransposeA;

    procedure MatMult_TransposeB (A, B : Real_Matrix; C: out Real_Matrix) is
    begin
        for I in A'Range(1) loop
            for J in B'Range(1) loop
                C(I, J) := 0.0;
                for K in A'Range(2) loop
                    C(I, J) := C(I, J) + A(I, K) * B(J, K);
                end loop;
            end loop;
        end loop;
    end MatMult_TransposeB;

    procedure MatMult (A, B : Real_Matrix; C: out Real_Matrix) is
    begin
        Inner_Product(A, B, C);
    end MatMult;

    procedure MatMult_TransposeB (A: Real_Vector; B : Real_Matrix; C: out Real_Vector) is
    begin
        for J in B'Range(1) loop
            C(J) := 0.0;
            for I in A'Range loop
                C(J) := C(J) + A(I) * B(J, I);
            end loop;
        end loop;
    end MatMult_TransposeB;

    procedure MatMult (A: Real_Vector; B : Real_Matrix; C: out Real_Vector) is
    begin
        for J in B'Range(2) loop
            C(J) := 0.0;
            for I in A'Range loop
                C(J) := C(J) + A(I) * B(I, J);
            end loop;
        end loop;
    end MatMult;

    --  function Row (A : Real_Matrix; N : Integer) return Real_Matrix is
    --      B : Real_Matrix (1 .. 1, A'Range (2));
    --  begin
    --      for I in A'Range (2) loop
    --          B (1, I) := A (N, I);
    --      end loop;
    --      return B;
    --  end Row;

    --  function Row (A : Real_Matrix; N : Integer) return Real_Vector is
    --      X : Real_Vector (A'Range (2));
    --  begin
    --      for I in A'Range (2) loop
    --          X (I) := A (N, I);
    --      end loop;
    --      return X;
    --  end Row;

    --  function Column (A : Real_Matrix; N : Integer) return Real_Vector is
    --      X : Real_Vector (A'Range (1));
    --  begin
    --      for I in A'Range (1) loop
    --          X (I) := A (I, N);
    --      end loop;
    --      return X;
    --  end Column;

    --  procedure Set (X : in out Real_Vector; Value : Real) is
    --  begin
    --      for I in X'Range loop
    --          X (I) := Value;
    --      end loop;
    --  end Set;

    --  procedure Set (A : in out Real_Matrix; Value : Real) is
    --  begin
    --      for I in A'Range (1) loop
    --          for J in A'Range (2) loop
    --              A (I, J) := Value;
    --          end loop;
    --      end loop;
    --  end Set;

    function Outer_Product (Left, Right : Real_Vector) return Real_Matrix is
        Result: Real_Matrix(Left'Range, Right'Range);
    begin
        for I in Left'Range loop
            for J in Right'Range loop
                Result(I, J) := Left(I) * Right(J);
            end loop;
        end loop;
        return Result;
    end;

end Generic_Real_Arrays;
