pragma Ada_95;

package Boolean_Arrays is

    pragma Pure (Boolean_Arrays);
    pragma Remote_Types (Boolean_Arrays);

    type Boolean_Vector is array (Positive range <>) of Boolean;
    pragma Pack(Boolean_Vector);
    type Boolean_Matrix is array (Positive range <>, Positive range <>) of Boolean;
    pragma Pack(Boolean_Matrix);
    type Boolean_Tensor_3D is array (Positive range <>, Positive range <>, Positive range <>) of Boolean;
    pragma Pack(Boolean_Tensor_3D);
    type Boolean_Tensor_4D is array (Positive range <>, Positive range <>, Positive range <>, Positive range <>) of Boolean;
    pragma Pack(Boolean_Tensor_4D);

end Boolean_Arrays;
