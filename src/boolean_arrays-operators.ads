pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

with Boolean_Functions;
with Integer_Arrays;

package Boolean_Arrays.Operators is

    pragma Preelaborate (Boolean_Arrays.Operators);

    use Boolean_Functions;
    use Integer_Arrays;

    -- 4.2.1 Unary operations
    -- Logical operations

    procedure Not_Operator (X: Boolean_Vector; Y: out Boolean_Vector);
    pragma Inline (Not_Operator);
    procedure Not_Operator (X: Boolean_Matrix; Y: out Boolean_Matrix);
    pragma Inline (Not_Operator);
    procedure Not_Operator (X: Boolean_Tensor_3D; Y: out Boolean_Tensor_3D);
    pragma Inline (Not_Operator);
    procedure Not_Operator (X: Boolean_Tensor_4D; Y: out Boolean_Tensor_4D);
    pragma Inline (Not_Operator);

    -- 4.2.2 Binary operations
    -- Logical operations

    procedure And_Operator (X, Y: Boolean_Vector; Z: out Boolean_Vector);
    pragma Inline (And_Operator);
    procedure And_Operator (X, Y: Boolean_Matrix; Z: out Boolean_Matrix);
    pragma Inline (And_Operator);
    procedure And_Operator (X, Y: Boolean_Tensor_3D; Z: out Boolean_Tensor_3D);
    pragma Inline (And_Operator);
    procedure And_Operator (X, Y: Boolean_Tensor_4D; Z: out Boolean_Tensor_4D);
    pragma Inline (And_Operator);

    procedure Or_Operator (X, Y: Boolean_Vector; Z: out Boolean_Vector);
    pragma Inline (Or_Operator);
    procedure Or_Operator (X, Y: Boolean_Matrix; Z: out Boolean_Matrix);
    pragma Inline (Or_Operator);
    procedure Or_Operator (X, Y: Boolean_Tensor_3D; Z: out Boolean_Tensor_3D);
    pragma Inline (Or_Operator);
    procedure Or_Operator (X, Y: Boolean_Tensor_4D; Z: out Boolean_Tensor_4D);
    pragma Inline (Or_Operator);

    -- 4.4 Reduce operations

    procedure All_Reduce(Input: Boolean_Vector; Output: out Boolean_Vector);
    pragma Inline (All_Reduce);
    procedure All_Reduce(Input: Boolean_Matrix; Axes: Tiny_Positive_Vector; Output: out Boolean_Matrix);
    pragma Inline (All_Reduce);
    procedure All_Reduce(Input: Boolean_Tensor_3D; Axes: Tiny_Positive_Vector; Output: out Boolean_Tensor_3D);
    pragma Inline (All_Reduce);
    procedure All_Reduce(Input: Boolean_Tensor_4D; Axes: Tiny_Positive_Vector; Output: out Boolean_Tensor_4D);
    pragma Inline (All_Reduce);

    procedure Any_Reduce(Input: Boolean_Vector; Output: out Boolean_Vector);
    pragma Inline (All_Reduce);
    procedure Any_Reduce(Input: Boolean_Matrix; Axes: Tiny_Positive_Vector; Output: out Boolean_Matrix);
    pragma Inline (All_Reduce);
    procedure Any_Reduce(Input: Boolean_Tensor_3D; Axes: Tiny_Positive_Vector; Output: out Boolean_Tensor_3D);
    pragma Inline (All_Reduce);
    procedure Any_Reduce(Input: Boolean_Tensor_4D; Axes: Tiny_Positive_Vector; Output: out Boolean_Tensor_4D);
    pragma Inline (All_Reduce);

    -- Utility

    procedure For_Each (F: Unary_Boolean_Function; X: Boolean_Vector; Y: out Boolean_Vector);
    procedure For_Each (F: Unary_Boolean_Function; X: Boolean_Matrix; Y: out Boolean_Matrix);
    procedure For_Each (F: Unary_Boolean_Function; X: Boolean_Tensor_3D; Y: out Boolean_Tensor_3D);
    procedure For_Each (F: Unary_Boolean_Function; X: Boolean_Tensor_4D; Y: out Boolean_Tensor_4D);

    procedure For_Each (F: Binary_Boolean_Function; X, Y: Boolean_Vector; Z: out Boolean_Vector);
    procedure For_Each (F: Binary_Boolean_Function; X, Y: Boolean_Matrix; Z: out Boolean_Matrix);
    procedure For_Each (F: Binary_Boolean_Function; X, Y: Boolean_Tensor_3D; Z: out Boolean_Tensor_3D);
    procedure For_Each (F: Binary_Boolean_Function; X, Y: Boolean_Tensor_4D; Z: out Boolean_Tensor_4D);

    procedure Reduce (F: Binary_Boolean_Function; Input: Boolean_Vector; Output: out Boolean_Vector);
    procedure Reduce (F: Binary_Boolean_Function; Input: Boolean_Matrix; Axes: Tiny_Positive_Vector; Output: out Boolean_Matrix);
    procedure Reduce (F: Binary_Boolean_Function; Input: Boolean_Tensor_3D; Axes: Tiny_Positive_Vector; Output: out Boolean_Tensor_3D);
    procedure Reduce (F: Binary_Boolean_Function; Input: Boolean_Tensor_4D; Axes: Tiny_Positive_Vector; Output: out Boolean_Tensor_4D);

end Boolean_Arrays.Operators;
