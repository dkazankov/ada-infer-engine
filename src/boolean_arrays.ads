pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

with Integer_Arrays;

package Boolean_Arrays is

    pragma Pure (Boolean_Arrays);

    use Integer_Arrays;

    type Boolean_Vector is array (Positive range <>) of Boolean;
    pragma Pack(Boolean_Vector);
    type Boolean_Matrix is array (Positive range <>, Positive range <>) of Boolean;
    pragma Pack(Boolean_Matrix);
    type Boolean_Tensor_3D is array (Positive range <>, Positive range <>, Positive range <>) of Boolean;
    pragma Pack(Boolean_Tensor_3D);
    type Boolean_Tensor_4D is array (Positive range <>, Positive range <>, Positive range <>, Positive range <>) of Boolean;
    pragma Pack(Boolean_Tensor_4D);

    -- 4.2.1 Unary operations
    -- Logical operations

    function "Not"(X: Boolean_Vector) return Boolean_Vector;
    function "Not"(X: Boolean_Matrix) return Boolean_Matrix;
    function "Not"(X: Boolean_Tensor_3D) return Boolean_Tensor_3D;
    function "Not"(X: Boolean_Tensor_4D) return Boolean_Tensor_4D;

    -- 4.2.2 Binary operations
    -- Logical operations

    function "And"(X, Y: Boolean_Vector) return Boolean_Vector;
    function "And"(X, Y: Boolean_Matrix) return Boolean_Matrix;
    function "And"(X, Y: Boolean_Tensor_3D) return Boolean_Tensor_3D;
    function "And"(X, Y: Boolean_Tensor_4D) return Boolean_Tensor_4D;

    function "Or"(X, Y: Boolean_Vector) return Boolean_Vector;
    function "Or"(X, Y: Boolean_Matrix) return Boolean_Matrix;
    function "Or"(X, Y: Boolean_Tensor_3D) return Boolean_Tensor_3D;
    function "Or"(X, Y: Boolean_Tensor_4D) return Boolean_Tensor_4D;

    -- 4.4 Reduce operations

    function All_Reduce(Input: Boolean_Vector) return Boolean_Vector;
    function All_Reduce(Input: Boolean_Matrix; Axes: Positive) return Boolean_Matrix;
    function All_Reduce(Input: Boolean_Tensor_3D; Axes: Tiny_Positive_Vector) return Boolean_Tensor_3D;
    function All_Reduce(Input: Boolean_Tensor_4D; Axes: Tiny_Positive_Vector) return Boolean_Tensor_4D;

    function Any_Reduce(Input: Boolean_Vector) return Boolean_Vector;
    function Any_Reduce(Input: Boolean_Matrix; Axes: Positive) return Boolean_Matrix;
    function Any_Reduce(Input: Boolean_Tensor_3D; Axes: Tiny_Positive_Vector) return Boolean_Tensor_3D;
    function Any_Reduce(Input: Boolean_Tensor_4D; Axes: Tiny_Positive_Vector) return Boolean_Tensor_4D;

end Boolean_Arrays;
