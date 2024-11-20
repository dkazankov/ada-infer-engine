pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

package Integer_Arrays.Operators is

    pragma Pure;

    function Selection (Condition: Boolean; True_Value, False_Value: Integer'Base) return Integer'Base;
    pragma Inline (Selection);

    function Selection (Condition: Boolean; True_Value, False_Value: Tiny_Positive_Vector) return Tiny_Positive_Vector;
    pragma Inline (Selection);
    function Selection (Condition: Boolean; True_Value, False_Value: Tiny_Integer_Vector) return Tiny_Integer_Vector;
    pragma Inline (Selection);

end Integer_Arrays.Operators;
