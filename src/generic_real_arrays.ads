pragma Ada_95;

generic
    type Real is digits <>;
package Generic_Real_Arrays is

    pragma Pure (Generic_Real_Arrays);

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
    
end Generic_Real_Arrays;
