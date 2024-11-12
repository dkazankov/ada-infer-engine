pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

with Generic_Real_Functions;
with Boolean_Arrays;
with Integer_Arrays;

generic
   type Real is digits <>;

package Generic_Real_Arrays is
    pragma Preelaborate;

    package Real_Functions is new Generic_Real_Functions (Float_Type => Real);
    use Real_Functions;
    use Boolean_Arrays;
    use Integer_Arrays;

    type Real_Vector is array (Positive range <>) of aliased Real'Base;
    pragma Pack(Real_Vector);
    type Real_Matrix is array (Positive range <>, Positive range <>) of aliased Real'Base;
    pragma Pack(Real_Matrix);
    type Real_Tensor_3D is array (Positive range <>, Positive range <>, Positive range <>) of aliased Real'Base;
    pragma Pack(Real_Tensor_3D);
    type Real_Tensor_4D is array (Positive range <>, Positive range <>, Positive range <>, Positive range <>) of aliased Real'Base;
    pragma Pack(Real_Tensor_4D);

    type Border_Modes is
        (Border_Mode_Ignore, Border_Mode_Constant, Border_Mode_Replicate,
        Border_Mode_Reflect, Border_Mode_Reflect_Even);
    type Padding_Extent is array (1..2) of Integer;
    type Padding_Type is array (Positive range <>) of Padding_Extent;
    subtype Padding_Type_1 is Padding_Type (1..1);
    subtype Padding_Type_2 is Padding_Type (1..2);
    subtype Padding_Type_3 is Padding_Type (1..3);
    subtype Padding_Type_4 is Padding_Type (1..4);

    Padding_Auto: constant Padding_Type := (1..0 => (0, 0));
    Default_Stride: constant Tiny_Positive_Vector := (1..0 => 1);
    Default_Dilation: constant Tiny_Positive_Vector := (1..0 => 1);

    procedure For_Each (X: Real_Vector; F: Unary_Real_Function; Y: out Real_Vector);
    pragma Precondition (X'Length = Y'Length);
    procedure For_Each (X : Real_Matrix; F : Unary_Real_Function; Y: out Real_Matrix);
    pragma Precondition (X'Length(1) = Y'Length(1) AND then X'Length(2) = Y'Length(2));
    procedure For_Each (X : Real_Tensor_3D; F : Unary_Real_Function; Y : out Real_Tensor_3D);
    pragma Precondition (X'Length(1) = Y'Length(1) AND then X'Length(2) = Y'Length(2) AND then X'Length(3) = Y'Length(3));
    procedure For_Each (X : Real_Tensor_4D; F : Unary_Real_Function; Y : out Real_Tensor_4D);
    pragma Precondition (X'Length(1) = Y'Length(1) AND then X'Length(2) = Y'Length(2) AND then X'Length(3) = Y'Length(3) AND then X'Length(4) = Y'Length(4));

    procedure For_Each (X, Y : Real_Vector; F : Binary_Real_Function; Z : out Real_Vector);
    pragma Precondition (X'Length = Y'Length AND then X'Length = Z'Length);
    procedure For_Each (X, Y : Real_Matrix; F : Binary_Real_Function; Z : out Real_Matrix);
    pragma Precondition (X'Length(1) = Y'Length(1) AND then X'Length(1) = Z'Length(1)
        AND then X'Length(2) = Y'Length(2) AND then X'Length(2) = Z'Length(2));
    procedure For_Each (X, Y : Real_Tensor_3D; F : Binary_Real_Function; Z : out Real_Tensor_3D);
    pragma Precondition (X'Length(1) = Y'Length(1) AND then X'Length(1) = Z'Length(1)
        AND then X'Length(2) = Y'Length(2) AND then X'Length(2) = Z'Length(2)
        AND then X'Length(3) = Y'Length(3) AND then X'Length(3) = Z'Length(3));
    procedure For_Each (X, Y : Real_Tensor_4D; F : Binary_Real_Function; Z : out Real_Tensor_4D);
    pragma Precondition (X'Length(1) = Y'Length(1) AND then X'Length(1) = Z'Length(1)
        AND then X'Length(2) = Y'Length(2) AND then X'Length(2) = Z'Length(2)
        AND then X'Length(3) = Y'Length(3) AND then X'Length(3) = Z'Length(3)
        AND then X'Length(4) = Y'Length(4) AND then X'Length(4) = Z'Length(4));

    procedure For_Reduced (X, Y : Real_Vector; F : Binary_Real_Function; Z : out Real_Vector);
    procedure For_Reduced (X, Y : Real_Matrix; F : Binary_Real_Function; Z : out Real_Matrix);
    procedure For_Reduced (X, Y : Real_Tensor_3D; F : Binary_Real_Function; Z : out Real_Tensor_3D);
    procedure For_Reduced (X, Y : Real_Tensor_4D; F : Binary_Real_Function; Z : out Real_Tensor_4D);

    procedure For_Each (X : Real_Vector; Y : Real; F : Binary_Real_Function; Z : out Real_Vector);
    procedure For_Each (X : Real_Matrix; Y : Real; F : Binary_Real_Function; Z : out Real_Matrix);
    procedure For_Each (X : Real_Tensor_3D; Y : Real; F : Binary_Real_Function; Z : out Real_Tensor_3D);
    procedure For_Each (X : Real_Tensor_4D; Y : Real; F : Binary_Real_Function; Z : out Real_Tensor_4D);

    procedure For_Each (X : Real_Vector; Y : Integer_Vector; F : Binary_Real_Function; Z : out Real_Vector);
    procedure For_Each (X : Real_Matrix; Y : Integer_Matrix; F : Binary_Real_Function; Z : out Real_Matrix);
    procedure For_Each (X : Real_Tensor_3D; Y : Integer_Tensor_3D; F : Binary_Real_Function; Z : out Real_Tensor_3D);
    procedure For_Each (X : Real_Tensor_4D; Y : Integer_Tensor_4D; F : Binary_Real_Function; Z : out Real_Tensor_4D);

    procedure For_Each (X, A, B: Real_Vector; F: Ternary_Real_Function; Y: out Real_Vector);
    procedure For_Each (X, A, B: Real_Matrix; F : Ternary_Real_Function; Y: out Real_Matrix);
    procedure For_Each (X, A, B: Real_Tensor_3D; F : Ternary_Real_Function; Y : out Real_Tensor_3D);
    procedure For_Each (X, A, B: Real_Tensor_4D; F : Ternary_Real_Function; Y : out Real_Tensor_4D);

    procedure For_Each (X : Real_Vector; A, B: Real; F : Ternary_Real_Function; Y: out Real_Vector);
    procedure For_Each (X : Real_Matrix; A, B: Real; F : Ternary_Real_Function; Y : out Real_Matrix);
    procedure For_Each (X : Real_Tensor_3D; A, B: Real; F : Ternary_Real_Function; Y : out Real_Tensor_3D);
    procedure For_Each (X : Real_Tensor_4D; A, B: Real; F : Ternary_Real_Function; Y : out Real_Tensor_4D);

    procedure For_Each (X, Y : Real_Vector; F : Compare_Real_Function; Z : out Boolean_Vector);
    procedure For_Each (X, Y : Real_Matrix; F : Compare_Real_Function; Z : out Boolean_Matrix);
    procedure For_Each (X, Y : Real_Tensor_3D; F : Compare_Real_Function;  Z : out Boolean_Tensor_3D);
    procedure For_Each (X, Y : Real_Tensor_4D; F : Compare_Real_Function; Z : out Boolean_Tensor_4D);

    procedure For_Each (X : Real_Vector; Y : Real; F : Compare_Real_Function; Z : out Boolean_Vector);
    procedure For_Each (X : Real_Matrix; Y : Real; F : Compare_Real_Function; Z : out Boolean_Matrix);
    procedure For_Each (X : Real_Tensor_3D; Y : Real; F : Compare_Real_Function; Z : out Boolean_Tensor_3D);
    procedure For_Each (X : Real_Tensor_4D; Y : Real; F : Compare_Real_Function; Z : out Boolean_Tensor_4D);

    procedure For_Each (C: Boolean_Vector; X, Y : Real_Vector; F : Select_Real_Function; Z : out Real_Vector);
    procedure For_Each (C: Boolean_Matrix; X, Y : Real_Matrix; F : Select_Real_Function; Z : out Real_Matrix);
    procedure For_Each (C: Boolean_Tensor_3D; X, Y : Real_Tensor_3D; F : Select_Real_Function; Z : out Real_Tensor_3D);
    procedure For_Each (C: Boolean_Tensor_4D; X, Y : Real_Tensor_4D; F : Select_Real_Function; Z : out Real_Tensor_4D);

    procedure For_Each (C: Boolean_Vector; X : Real_Vector; Y : Real; F : Select_Real_Function; Z : out Real_Vector);
    procedure For_Each (C: Boolean_Matrix; X : Real_Matrix; Y : Real; F : Select_Real_Function; Z : out Real_Matrix);
    procedure For_Each (C: Boolean_Tensor_3D; X : Real_Tensor_3D; Y : Real; F : Select_Real_Function; Z : out Real_Tensor_3D);
    procedure For_Each (C: Boolean_Tensor_4D; X : Real_Tensor_4D; Y : Real; F : Select_Real_Function; Z : out Real_Tensor_4D);

    procedure Reduce (Input: Real_Vector; F: Binary_Real_Function; Output: out Real_Vector);
    procedure Reduce (Input: Real_Matrix; Axes: Tiny_Positive_Vector; F: Binary_Real_Function; Output: out Real_Matrix);
    procedure Reduce (Input: Real_Tensor_3D; Axes: Tiny_Positive_Vector; F: Binary_Real_Function; Output: out Real_Tensor_3D);
    procedure Reduce (Input: Real_Tensor_4D; Axes: Tiny_Positive_Vector; F: Binary_Real_Function; Output: out Real_Tensor_4D);

    procedure Arg_Reduce (Input : Real_Vector; F: Compare_Real_Function; Output: out Natural_Vector);
    procedure Arg_Reduce (Input : Real_Matrix; Axes : Tiny_Positive_Vector; F: Compare_Real_Function; Output: out Natural_Matrix);
    procedure Arg_Reduce (Input : Real_Tensor_3D; Axes : Tiny_Positive_Vector; F: Compare_Real_Function; Output: out Natural_Tensor_3D);
    procedure Arg_Reduce (Input : Real_Tensor_4D; Axes : Tiny_Positive_Vector; F: Compare_Real_Function; Output: out Natural_Tensor_4D);

    procedure Arg_Sort (Vector: Real_Vector; F: Compare_Real_Function; Sorted: out Positive_Vector);
    --  procedure Arg_Sort (Vector: Real_Matrix; F: Compare_Real_Function; Sorted: out Positive_Matrix);
    --  procedure Arg_Sort (Vector: Real_Tensor_3D; F: Compare_Real_Function; Sorted: out Positive_Tensor_3D);
    --  procedure Arg_Sort (Vector: Real_Tensor_4D; F: Compare_Real_Function; Sorted: out Positive_Tensor_4D);

    -- 4.3 Sliding window operations

    Border_Constant_Value: constant Real := 0.0;

    function Border_Value_Index (Index: Tiny_Integer_Vector; First, Last: Tiny_Positive_Vector; Border: Border_Modes) return Tiny_Integer_Vector;
    function Is_Border_Index (Index: Tiny_Integer_Vector; First, Last: Tiny_Positive_Vector) return Boolean;
    procedure Get_Input_Value (Input: Real_Tensor_3D; Index: Tiny_Integer_Vector; Border: Border_Modes; Value: out Real; Ignore: out Boolean);
    procedure Get_Input_Value (Input: Real_Tensor_4D; Index: Tiny_Integer_Vector; Border: Border_Modes; Value: out Real; Ignore: out Boolean);

    procedure Set_Bias (Bias: Real_Matrix; Output: out Real_Tensor_3D);
    procedure Set_Bias (Bias: Real_Matrix; Output: out Real_Tensor_4D);

    procedure Conv_1D_Core
    (Input: Real_Tensor_3D; Input_Index: Tiny_Positive_Vector_2;
        Filter: Real_Tensor_3D; Filter_Index: Tiny_Positive_Vector_2;
        Output: in out Real_Tensor_3D; Output_Index: Tiny_Positive_Vector_2;
        Border: Border_Modes;
        Padding: Padding_Extent;
        Stride, Dilation : Positive);
    procedure Conv_1D (Input, Filter: Real_Tensor_3D; Border: Border_Modes;
        Padding: Padding_Extent; Stride, Dilation : Positive; Output: in out Real_Tensor_3D);
    procedure Depthwise_Conv_1D (Input, Filter: Real_Tensor_3D; Border: Border_Modes;
        Padding: Padding_Extent; Stride, Dilation : Positive; Output: in out Real_Tensor_3D);
    procedure Groupped_Conv_1D (Input, Filter: Real_Tensor_3D; Border: Border_Modes;
        Padding: Padding_Extent; Stride, Dilation : Positive; Groups: Natural; Output: in out Real_Tensor_3D);

    procedure Conv_2D_Core
    (Input: Real_Tensor_4D; Input_Index: Tiny_Positive_Vector_2;
        Filter: Real_Tensor_4D; Filter_Index: Tiny_Positive_Vector_2;
        Output: in out Real_Tensor_4D; Output_Index: Tiny_Positive_Vector_2;
        Border: Border_Modes;
        Padding: Padding_Type_2;
        Stride, Dilation : Tiny_Positive_Vector_2);
    procedure Conv_2D (Input, Filter: Real_Tensor_4D; Border: Border_Modes;
        Padding: Padding_Type_2; Stride, Dilation : Tiny_Positive_Vector_2; Output: in out Real_Tensor_4D);
    procedure Depthwise_Conv_2D (Input, Filter: Real_Tensor_4D; Border: Border_Modes;
        Padding: Padding_Type_2; Stride, Dilation : Tiny_Positive_Vector_2; Output: in out Real_Tensor_4D);
    procedure Groupped_Conv_2D (Input, Filter: Real_Tensor_4D; Border: Border_Modes;
        Padding: Padding_Type_2; Stride, Dilation : Tiny_Positive_Vector_2; Groups: Natural; Output: in out Real_Tensor_4D);

    procedure Conv_Transposed_1D_Core
    (Input: Real_Tensor_3D; Input_Index: Tiny_Positive_Vector_2;
        Filter: Real_Tensor_3D; Filter_Index: Tiny_Positive_Vector_2;
        Output: in out Real_Tensor_3D; Output_Index: Tiny_Positive_Vector_2;
        Border: Border_Modes;
        Padding: Padding_Extent;
        Stride, Dilation : Positive);
    procedure Conv_Transposed_1D (Input, Filter: Real_Tensor_3D; Border: Border_Modes;
        Padding: Padding_Extent; Stride, Dilation : Positive; Output: in out Real_Tensor_3D);
    procedure Depthwise_Conv_Transposed_1D (Input, Filter: Real_Tensor_3D; Border: Border_Modes;
        Padding: Padding_Extent; Stride, Dilation : Positive; Output: in out Real_Tensor_3D);
    procedure Groupped_Conv_Transposed_1D (Input, Filter: Real_Tensor_3D; Border: Border_Modes;
        Padding: Padding_Extent; Stride, Dilation : Positive; Groups: Natural; Output: in out Real_Tensor_3D);
    procedure Conv_Transposed_2D_Core
    (Input: Real_Tensor_4D; Input_Index: Tiny_Positive_Vector_2;
        Filter: Real_Tensor_4D; Filter_Index: Tiny_Positive_Vector_2;
        Output: in out Real_Tensor_4D; Output_Index: Tiny_Positive_Vector_2;
        Border: Border_Modes;
        Padding: Padding_Type_2;
        Stride, Dilation : Tiny_Positive_Vector_2);
    procedure Conv_Transposed_2D (Input, Filter: Real_Tensor_4D; Border: Border_Modes;
        Padding: Padding_Type_2; Stride, Dilation : Tiny_Positive_Vector_2; Output: in out Real_Tensor_4D);
    procedure Depthwise_Conv_Transposed_2D (Input, Filter: Real_Tensor_4D; Border: Border_Modes;
        Padding: Padding_Type_2; Stride, Dilation : Tiny_Positive_Vector_2; Output: in out Real_Tensor_4D);
    procedure Groupped_Conv_Transposed_2D (Input, Filter: Real_Tensor_4D; Border: Border_Modes;
        Padding: Padding_Type_2; Stride, Dilation : Tiny_Positive_Vector_2; Groups: Natural; Output: in out Real_Tensor_4D);

    procedure Pool (Input: Real_Tensor_3D; Size: Tiny_Positive_Vector_3; Border: Border_Modes; Padding: Padding_Type_3; Stride, Dilation : Tiny_Positive_Vector_3;
        F: Binary_Real_Function; Output: out Real_Tensor_3D);
    procedure Pool (Input: Real_Tensor_4D; Size: Tiny_Positive_Vector_4; Border: Border_Modes; Padding: Padding_Type_4; Stride, Dilation : Tiny_Positive_Vector_4;
        F: Binary_Real_Function; Output: out Real_Tensor_4D);

    procedure Pool_Transposed
    (Input            : Real_Tensor_3D;
        Size : Tiny_Positive_Vector_3;
        Border           : Border_Modes;
        Padding          : Padding_Type_3;
        Stride, Dilation : Tiny_Positive_Vector_3;
        F : Binary_Real_Function;
        Output           : out Real_Tensor_3D);
    procedure Pool_Transposed
    (Input            : Real_Tensor_4D;
        Size : Tiny_Positive_Vector_4;
        Border           : Border_Modes;
        Padding          : Padding_Type_4;
        Stride, Dilation : Tiny_Positive_Vector_4;
        F : Binary_Real_Function;
        Output           : out Real_Tensor_4D);

    procedure Pool_Area (Input_Shape: Tiny_Positive_Vector_3; Size: Tiny_Positive_Vector_3; Padding: Padding_Type_3; Stride, Dilation: Tiny_Positive_Vector_3;
        Tensor: in out Real_Tensor_3D);
    procedure Pool_Area (Input_Shape: Tiny_Positive_Vector_4; Size: Tiny_Positive_Vector_4; Padding: Padding_Type_4; Stride, Dilation: Tiny_Positive_Vector_4;
        Tensor: in out Real_Tensor_4D);

    procedure Pool_Area_Transposed
    (Input_Shape: Tiny_Positive_Vector_3;
        Size : Tiny_Positive_Vector_3;
        Padding          : Padding_Type_3;
        Stride, Dilation : Tiny_Positive_Vector_3;
        Tensor           : in out Real_Tensor_3D);
    procedure Pool_Area_Transposed
    (Input_Shape: Tiny_Positive_Vector_4;
        Size : Tiny_Positive_Vector_4;
        Padding          : Padding_Type_4;
        Stride, Dilation : Tiny_Positive_Vector_4;
        Tensor           : in out Real_Tensor_4D);

    procedure Arg_Pool
    (Input            : Real_Tensor_3D;
        Size : Tiny_Positive_Vector_3;
        Border           : Border_Modes;
        Padding          : Padding_Type_3;
        Stride, Dilation : Tiny_Positive_Vector_3;
        F : Compare_Real_Function;
        Output           : out Natural_Tensor_3D);
    procedure Arg_Pool
    (Input            : Real_Tensor_4D;
        Size : Tiny_Positive_Vector_4;
        Border           : Border_Modes;
        Padding          : Padding_Type_4;
        Stride, Dilation : Tiny_Positive_Vector_4;
        F : Compare_Real_Function;
        Output           : out Natural_Tensor_4D);

    procedure Sample_Core
    (Input            : Real_Tensor_3D; Index : Natural_Tensor_3D;
        Size : Tiny_Positive_Vector_3;
        Border           : Border_Modes;
        Padding          : Padding_Type_3;
        Stride, Dilation : Tiny_Positive_Vector_3;
        Output: out Real_Tensor_3D);
    procedure Sample_Core
    (Input            : Real_Tensor_4D; Index : Natural_Tensor_4D;
        Size : Tiny_Positive_Vector_4;
        Border           : Border_Modes;
        Padding          : Padding_Type_4;
        Stride, Dilation : Tiny_Positive_Vector_4;
        Output: out Real_Tensor_4D);

    procedure Desample_Core
    (Input            : Real_Tensor_3D; Index : Natural_Tensor_3D;
        Size : Tiny_Positive_Vector_3;
        Border           : Border_Modes;
        Padding          : Padding_Type_3;
        Stride, Dilation : Tiny_Positive_Vector_3;
        Output: in out Real_Tensor_3D);
    procedure Desample_Core
    (Input            : Real_Tensor_4D; Index : Natural_Tensor_4D;
        Size : Tiny_Positive_Vector_4;
        Border           : Border_Modes;
        Padding          : Padding_Type_4;
        Stride, Dilation : Tiny_Positive_Vector_4;
        Output: in out Real_Tensor_4D);

    -- 4.5.1 Reshaping

    procedure Reshape (Input: Real_Vector; Output: out Real_Matrix);
    procedure Reshape (Input: Real_Vector; Output: out Real_Tensor_3D);
    procedure Reshape (Input: Real_Vector; Output: out Real_Tensor_4D);

    procedure Reshape (Input: Real_Matrix; Output: out Real_Vector);
    procedure Reshape (Input: Real_Matrix; Output: out Real_Tensor_3D);
    procedure Reshape (Input: Real_Matrix; Output: out Real_Tensor_4D);

    procedure Reshape (Input: Real_Tensor_3D; Output: out Real_Vector);
    procedure Reshape (Input: Real_Tensor_3D; Output: out Real_Matrix);
    procedure Reshape (Input: Real_Tensor_3D; Output: out Real_Tensor_4D);

    procedure Reshape (Input: Real_Tensor_4D; Output: out Real_Vector);
    procedure Reshape (Input: Real_Tensor_4D; Output: out Real_Matrix);
    procedure Reshape (Input: Real_Tensor_4D; Output: out Real_Tensor_3D);

    -- 4.5.2 Transposing

    procedure Transpose (X : Real_Matrix; A: out Real_Matrix);
    procedure Transpose (X : Real_Vector; A: out Real_Matrix);
    procedure Transpose (A : Real_Matrix; X: out Real_Vector);

    procedure Transpose (Input: Real_Tensor_3D; Axes: Tiny_Positive_Vector; Output: out Real_Tensor_3D);
    procedure Transpose (Input: Real_Tensor_4D; Axes: Tiny_Positive_Vector; Output: out Real_Tensor_4D);

    -- 4.5.3 Splitting and Concatenation

    -- 4.5.4 Slicing

    procedure Slice (Input: Real_Tensor_4D; Axes: Tiny_Positive_Vector; Slice_Begin, Slice_End: Tiny_Integer_Vector; Stride: Tiny_Integer_Vector; Output: out Real_Tensor_4D);

    -- 4.5.5 Padding

    procedure Pad (Input: Real_Tensor_4D; Padding: Padding_Type; Border: Border_Modes := Border_Mode_Constant; Value: Real := 0.0; Output: out Real_Tensor_4D);

    -- 4.5.6 Tiling

    procedure Tile (Input: Real_Tensor_4D; Output: out Real_Tensor_4D);

    -- 4.5.7 Gathering

    procedure Gather (Input: Real_Tensor_3D; Indices: Positive_Matrix; Axis: Positive := 1; Output: out Real_Tensor_4D);

    -- 4.5.8 Casting

    procedure Cast (Input: Real_Tensor_4D; Output: out Integer_Tensor_4D);
    procedure Cast (Input: Integer_Tensor_4D; Output: out Boolean_Tensor_4D);
    procedure Cast (Input: Integer_Tensor_4D; Output: out Real_Tensor_4D);

    -- 4.7 Matrix multiplication

    procedure Inner_Product(A, B: Real_Matrix; C: out Real_Matrix);
    procedure Inner_Product(A: Real_Vector; B: Real_Matrix; C: out Real_Matrix);
    procedure Inner_Product(A: Real_Matrix; B: Real_Vector; C: out Real_Vector);
    procedure MatMult (A, B : Real_Matrix; TransposeA, TransposeB : Boolean := False; C: out Real_Matrix);
    procedure MatMult (A: Real_Vector; B : Real_Matrix; TransposeB : Boolean := False; C: out Real_Vector);

    --  function Row (A : Real_Matrix; N : Integer) return Real_Matrix;
    --  function Row (A : Real_Matrix; N : Integer) return Real_Vector;
    --  function Column (A : Real_Matrix; N : Integer) return Real_Vector;

    --  procedure Set (X : in out Real_Vector; Value : Real);
    --  procedure Set (A : in out Real_Matrix; Value : Real);

    function Outer_Product (Left, Right : Real_Vector) return Real_Matrix;

end Generic_Real_Arrays;
