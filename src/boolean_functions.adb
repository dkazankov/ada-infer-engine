pragma Ada_95;
pragma Profile (Ravenscar);

package body Boolean_Functions is

    function Call (F: Unary_Boolean_Function; X: Boolean'Base) return Boolean'Base is
    begin
        return F (X);
    end Call;

    function Call (F: Binary_Boolean_Function; X, Y: Boolean'Base) return Boolean'Base is
    begin
        return F (X, Y);
    end Call;

    function Identity (X: Boolean'Base) return Boolean'Base is
    begin
        return X;
    end Identity;

    function Is_Not (X: Boolean'Base) return Boolean'Base is
    begin
        return NOT X;
    end Is_Not;

    function And_Then (X, Y: Boolean'Base) return Boolean'Base is
    begin
        return X AND then Y;
    end And_Then;

    function Or_Else (X, Y: Boolean'Base) return Boolean'Base is
    begin
        return X OR else Y;
    end Or_Else;

end Boolean_Functions;
