pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

package Boolean_Functions is

    pragma Preelaborate (Boolean_Functions);

    type Unary_Boolean_Function is private;
    function Call (F: Unary_Boolean_Function; X: Boolean'Base) return Boolean'Base;
    pragma Inline(Call);

    type Binary_Boolean_Function is private;
    function Call (F: Binary_Boolean_Function; X, Y: Boolean'Base) return Boolean'Base;
    pragma Inline(Call);

    function Identity (X: Boolean'Base) return Boolean'Base;
    function Is_Not (X: Boolean'Base) return Boolean'Base;
    function And_Then (X, Y: Boolean'Base) return Boolean'Base;
    function Or_Else (X, Y: Boolean'Base) return Boolean'Base;

    Identity_Function: constant Unary_Boolean_Function;
    Not_Function: constant Unary_Boolean_Function;
    And_Function: constant Binary_Boolean_Function;
    Or_Function: constant Binary_Boolean_Function;

private

    type Unary_Boolean_Function is access function(X: Boolean'Base) return Boolean'Base;
    type Binary_Boolean_Function is access function(X, Y: Boolean'Base) return Boolean'Base;

    Identity_Function: constant Unary_Boolean_Function := Identity'Access;
    Not_Function: constant Unary_Boolean_Function := Is_Not'Access;
    And_Function: constant Binary_Boolean_Function := And_Then'Access;
    Or_Function: constant Binary_Boolean_Function := Or_Else'Access;

end Boolean_Functions;
