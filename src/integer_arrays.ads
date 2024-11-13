pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

with Generic_Integer_Arrays;

package Integer_Arrays is

    pragma Pure (Integer_Arrays);

    package Integer_Arrays is new Generic_Integer_Arrays(Integer_Type => Integer);
    subtype Integer_Vector is Integer_Arrays.Vector;
    subtype Integer_Matrix is Integer_Arrays.Matrix;
    subtype Integer_Tensor_3D is Integer_Arrays.Tensor_3D;
    subtype Integer_Tensor_4D is Integer_Arrays.Tensor_4D;
    subtype Tiny_Integer_Vector is Integer_Arrays.Tiny_Vector;
    subtype Tiny_Integer_Vector_3 is Tiny_Integer_Vector (1..3);
    subtype Tiny_Integer_Vector_4 is Tiny_Integer_Vector (1..4);

    package Natural_Arrays is new Generic_Integer_Arrays(Integer_Type => Natural);
    subtype Natural_Vector is Natural_Arrays.Vector;
    subtype Natural_Matrix is Natural_Arrays.Matrix;
    subtype Natural_Tensor_3D is Natural_Arrays.Tensor_3D;
    subtype Natural_Tensor_4D is Natural_Arrays.Tensor_4D;
    subtype Tiny_Natural_Vector is Natural_Arrays.Tiny_Vector;

    package Positive_Arrays is new Generic_Integer_Arrays(Integer_Type => Positive);
    subtype Positive_Vector is Positive_Arrays.Vector;
    subtype Positive_Matrix is Positive_Arrays.Matrix;
    subtype Positive_Tensor_3D is Positive_Arrays.Tensor_3D;
    subtype Positive_Tensor_4D is Positive_Arrays.Tensor_4D;
    subtype Tiny_Positive_Vector is Positive_Arrays.Tiny_Vector;
    subtype Tiny_Positive_Vector_1 is Tiny_Positive_Vector (1..1);
    subtype Tiny_Positive_Vector_2 is Tiny_Positive_Vector (1..2);
    subtype Tiny_Positive_Vector_3 is Tiny_Positive_Vector (1..3);
    subtype Tiny_Positive_Vector_4 is Tiny_Positive_Vector (1..4);

    function Selection (Condition: Boolean; True_Value, False_Value: Integer'Base) return Integer'Base;
    pragma Inline (Selection);

    function Selection (Condition: Boolean; True_Value, False_Value: Tiny_Positive_Vector) return Tiny_Positive_Vector;
    pragma Inline (Selection);
    function Selection (Condition: Boolean; True_Value, False_Value: Tiny_Integer_Vector) return Tiny_Integer_Vector;
    pragma Inline (Selection);

end Integer_Arrays;
