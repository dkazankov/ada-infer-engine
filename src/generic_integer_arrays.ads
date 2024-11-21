pragma Ada_95;

generic
    type Integer_Type is range <>;
package Generic_Integer_Arrays is

    pragma Pure (Generic_Integer_Arrays);

    type Vector is array (Positive range <>) of aliased Integer_Type'Base;
    pragma Pack(Vector);
    type Matrix is array (Positive range <>, Positive range <>) of aliased Integer_Type'Base;
    pragma Pack(Matrix);
    type Tensor_3D is array (Positive range <>, Positive range <>, Positive range <>) of aliased Integer_Type'Base;
    pragma Pack(Tensor_3D);
    type Tensor_4D is array (Positive range <>, Positive range <>, Positive range <>, Positive range <>) of aliased Integer_Type'Base;
    pragma Pack(Tensor_4D);

    type Tiny_Vector is array (Positive range <>) of Integer_Type;

end Generic_Integer_Arrays;
