pragma Ada_95;
pragma Profile (Ravenscar);

package body Integer_Arrays is

    function Selection (Condition: Boolean; True_Value, False_Value: Integer'Base) return Integer'Base is
    begin
        if Condition then
            return True_Value;
        else
            return False_Value;
        end if;
    end Selection;

    function Selection (Condition: Boolean; True_Value, False_Value: Tiny_Positive_Vector) return Tiny_Positive_Vector is
    begin
        if Condition then
            return True_Value;
        else
            return False_Value;
        end if;
    end Selection;

    function Selection (Condition: Boolean; True_Value, False_Value: Tiny_Integer_Vector) return Tiny_Integer_Vector is
    begin
        if Condition then
            return True_Value;
        else
            return False_Value;
        end if;
    end Selection;

end Integer_Arrays;
