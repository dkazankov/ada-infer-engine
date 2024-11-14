pragma Ada_95;
pragma Profile (Ravenscar);

package body Generic_Real_Arrays.Operators is

    function Shape_Of (X: Real_Vector) return Tiny_Positive_Vector_1 is
    begin
        return (1 => X'Length);
    end Shape_Of;

    function Shape_Of (X: Real_Matrix) return Tiny_Positive_Vector_2 is
    begin
        return (X'Length(1), X'Length(2));
    end Shape_Of;

    function Shape_Of (X: Real_Tensor_3D) return Tiny_Positive_Vector_3 is
    begin
        return (X'Length(1), X'Length(2), X'Length(3));
    end Shape_Of;

    function Shape_Of (X: Real_Tensor_4D) return Tiny_Positive_Vector_4 is
    begin
        return (X'Length(1), X'Length(2), X'Length(3), X'Length(4));
    end Shape_Of;

    procedure Copy (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Copy_Function, X, Y);
    end Copy;
    procedure Copy (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Copy_Function, X, Y);
    end Copy;
    procedure Copy (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Copy_Function, X, Y);
    end Copy;
    procedure Copy (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Copy_Function, X, Y);
    end Copy;

    procedure Neg (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Neg_Function, X, Y);
    end Neg;
    procedure Neg (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Neg_Function, X, Y);
    end Neg;
    procedure Neg (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Neg_Function, X, Y);
    end Neg;
    procedure Neg (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Neg_Function, X, Y);
    end Neg;

    procedure Rcp (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Rcp_Function, X, Y);
    end Rcp;
    procedure Rcp (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Rcp_Function, X, Y);
    end Rcp;
    procedure Rcp (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Rcp_Function, X, Y);
    end Rcp;
    procedure Rcp (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Rcp_Function, X, Y);
    end Rcp;

    procedure Exp (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Exp_Function, X, Y);
    end Exp;
    procedure Exp (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Exp_Function, X, Y);
    end Exp;
    procedure Exp (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Exp_Function, X, Y);
    end Exp;
    procedure Exp (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Exp_Function, X, Y);
    end Exp;

    procedure Log (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Log_Function, X, Y);
    end Log;
    procedure Log (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Log_Function, X, Y);
    end Log;
    procedure Log (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Log_Function, X, Y);
    end Log;
    procedure Log (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Log_Function, X, Y);
    end Log;

    procedure Sin (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Sin_Function, X, Y);
    end Sin;
    procedure Sin (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Sin_Function, X, Y);
    end Sin;
    procedure Sin (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Sin_Function, X, Y);
    end Sin;
    procedure Sin (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Sin_Function, X, Y);
    end Sin;

    procedure Cos (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Cos_Function, X, Y);
    end Cos;
    procedure Cos (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Cos_Function, X, Y);
    end Cos;
    procedure Cos (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Cos_Function, X, Y);
    end Cos;
    procedure Cos (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Cos_Function, X, Y);
    end Cos;

    procedure Tan (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Tan_Function, X, Y);
    end Tan;
    procedure Tan (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Tan_Function, X, Y);
    end Tan;
    procedure Tan (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Tan_Function, X, Y);
    end Tan;
    procedure Tan (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Tan_Function, X, Y);
    end Tan;

    procedure Cot (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Cot_Function, X, Y);
    end Cot;
    procedure Cot (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Cot_Function, X, Y);
    end Cot;
    procedure Cot (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Cot_Function, X, Y);
    end Cot;
    procedure Cot (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Cot_Function, X, Y);
    end Cot;

    procedure Sinh (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Sinh_Function, X, Y);
    end Sinh;
    procedure Sinh (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Sinh_Function, X, Y);
    end Sinh;
    procedure Sinh (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Sinh_Function, X, Y);
    end Sinh;
    procedure Sinh (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Sinh_Function, X, Y);
    end Sinh;

    procedure Cosh (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Cosh_Function, X, Y);
    end Cosh;
    procedure Cosh (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Cosh_Function, X, Y);
    end Cosh;
    procedure Cosh (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Cosh_Function, X, Y);
    end Cosh;
    procedure Cosh (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Cosh_Function, X, Y);
    end Cosh;

    procedure Tanh (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Tanh_Function, X, Y);
    end Tanh;
    procedure Tanh (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Tanh_Function, X, Y);
    end Tanh;
    procedure Tanh (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Tanh_Function, X, Y);
    end Tanh;
    procedure Tanh (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Tanh_Function, X, Y);
    end Tanh;

    procedure Coth (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Coth_Function, X, Y);
    end Coth;
    procedure Coth (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Coth_Function, X, Y);
    end Coth;
    procedure Coth (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Coth_Function, X, Y);
    end Coth;
    procedure Coth (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Coth_Function, X, Y);
    end Coth;

    procedure Arcsin (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Arcsin_Function, X, Y);
    end Arcsin;
    procedure Arcsin (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Arcsin_Function, X, Y);
    end Arcsin;
    procedure Arcsin (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Arcsin_Function, X, Y);
    end Arcsin;
    procedure Arcsin (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Arcsin_Function, X, Y);
    end Arcsin;

    procedure Arccos (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Arccos_Function, X, Y);
    end Arccos;
    procedure Arccos (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Arccos_Function, X, Y);
    end Arccos;
    procedure Arccos (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Arccos_Function, X, Y);
    end Arccos;
    procedure Arccos (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Arccos_Function, X, Y);
    end Arccos;

    procedure Arctan (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Arctan_Function, X, Y);
    end Arctan;
    procedure Arctan (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Arctan_Function, X, Y);
    end Arctan;
    procedure Arctan (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Arctan_Function, X, Y);
    end Arctan;
    procedure Arctan (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Arctan_Function, X, Y);
    end Arctan;

    procedure Arccot (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Arccot_Function, X, Y);
    end Arccot;
    procedure Arccot (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Arccot_Function, X, Y);
    end Arccot;
    procedure Arccot (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Arccot_Function, X, Y);
    end Arccot;
    procedure Arccot (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Arccot_Function, X, Y);
    end Arccot;

    procedure Arcsinh (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Arcsinh_Function, X, Y);
    end Arcsinh;
    procedure Arcsinh (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Arcsinh_Function, X, Y);
    end Arcsinh;
    procedure Arcsinh (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Arcsinh_Function, X, Y);
    end Arcsinh;
    procedure Arcsinh (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Arcsinh_Function, X, Y);
    end Arcsinh;

    procedure Arccosh (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Arccosh_Function, X, Y);
    end Arccosh;
    procedure Arccosh (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Arccosh_Function, X, Y);
    end Arccosh;
    procedure Arccosh (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Arccosh_Function, X, Y);
    end Arccosh;
    procedure Arccosh (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Arccosh_Function, X, Y);
    end Arccosh;

    procedure Arctanh (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Arctanh_Function, X, Y);
    end Arctanh;
    procedure Arctanh (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Arctanh_Function, X, Y);
    end Arctanh;
    procedure Arctanh (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Arctanh_Function, X, Y);
    end Arctanh;
    procedure Arctanh (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Arctanh_Function, X, Y);
    end Arctanh;

    procedure Arccoth (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Arccoth_Function, X, Y);
    end Arccoth;
    procedure Arccoth (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Arccoth_Function, X, Y);
    end Arccoth;
    procedure Arccoth (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Arccoth_Function, X, Y);
    end Arccoth;
    procedure Arccoth (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Arccoth_Function, X, Y);
    end Arccoth;

    procedure Absval (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Abs_Function, X, Y);
    end Absval;
    procedure Absval (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Abs_Function, X, Y);
    end Absval;
    procedure Absval (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Abs_Function, X, Y);
    end Absval;
    procedure Absval (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Abs_Function, X, Y);
    end Absval;

    procedure Sign (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Sign_Function, X, Y);
    end Sign;
    procedure Sign (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Sign_Function, X, Y);
    end Sign;
    procedure Sign (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Sign_Function, X, Y);
    end Sign;
    procedure Sign (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Sign_Function, X, Y);
    end Sign;

    procedure Floor (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Floor_Function, X, Y);
    end Floor;
    procedure Floor (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Floor_Function, X, Y);
    end Floor;
    procedure Floor (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Floor_Function, X, Y);
    end Floor;
    procedure Floor (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Floor_Function, X, Y);
    end Floor;

    procedure Ceil (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Ceil_Function, X, Y);
    end Ceil;
    procedure Ceil (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Ceil_Function, X, Y);
    end Ceil;
    procedure Ceil (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Ceil_Function, X, Y);
    end Ceil;
    procedure Ceil (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Ceil_Function, X, Y);
    end Ceil;

    procedure Round (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Round_Function, X, Y);
    end Round;
    procedure Round (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Round_Function, X, Y);
    end Round;
    procedure Round (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Round_Function, X, Y);
    end Round;
    procedure Round (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Round_Function, X, Y);
    end Round;

    procedure Add (X, Y : Real_Vector; Z: out Real_Vector) is
    begin
        For_Each (Add_Function, X, Y, Z);
    end Add;
    procedure Add (X, Y : Real_Matrix; Z: out Real_Matrix) is
    begin
        For_Each (Add_Function, X, Y, Z);
    end Add;
    procedure Add (X, Y : Real_Tensor_3D; Z: out Real_Tensor_3D) is
    begin
        For_Each (Add_Function, X, Y, Z);
    end Add;
    procedure Add (X, Y : Real_Tensor_4D; Z: out Real_Tensor_4D) is
    begin
        For_Each (Add_Function, X, Y, Z);
    end Add;

    procedure Add (X: Real_Vector; Y : Real; Z: out Real_Vector) is
    begin
        For_Each (Add_Function, X, Y, Z);
    end Add;
    procedure Add (X: Real_Matrix; Y : Real; Z: out Real_Matrix) is
    begin
        For_Each (Add_Function, X, Y, Z);
    end Add;
    procedure Add (X: Real_Tensor_3D; Y : Real; Z: out Real_Tensor_3D) is
    begin
        For_Each (Add_Function, X, Y, Z);
    end Add;
    procedure Add (X: Real_Tensor_4D; Y : Real; Z: out Real_Tensor_4D) is
    begin
        For_Each (Add_Function, X, Y, Z);
    end Add;

    procedure Add (X: Real_Vector; Y : Integer_Vector; Z: out Real_Vector) is
    begin
        For_Each (Add_Function, X, Y, Z);
    end Add;
    procedure Add (X: Real_Matrix; Y : Integer_Matrix; Z: out Real_Matrix) is
    begin
        For_Each (Add_Function, X, Y, Z);
    end Add;
    procedure Add (X: Real_Tensor_3D; Y : Integer_Tensor_3D; Z: out Real_Tensor_3D) is
    begin
        For_Each (Add_Function, X, Y, Z);
    end Add;
    procedure Add (X: Real_Tensor_4D; Y : Integer_Tensor_4D; Z: out Real_Tensor_4D) is
    begin
        For_Each (Add_Function, X, Y, Z);
    end Add;

    procedure Sub (X, Y : Real_Vector; Z: out Real_Vector) is
    begin
        For_Each (Sub_Function, X, Y, Z);
    end Sub;
    procedure Sub (X, Y : Real_Matrix; Z: out Real_Matrix) is
    begin
        For_Each (Sub_Function, X, Y, Z);
    end Sub;
    procedure Sub (X, Y : Real_Tensor_3D; Z: out Real_Tensor_3D) is
    begin
        For_Each (Sub_Function, X, Y, Z);
    end Sub;
    procedure Sub (X, Y : Real_Tensor_4D; Z: out Real_Tensor_4D) is
    begin
        For_Each (Sub_Function, X, Y, Z);
    end Sub;

    procedure Sub (X: Real_Vector; Y : Real; Z: out Real_Vector) is
    begin
        For_Each (Sub_Function, X, Y, Z);
    end Sub;
    procedure Sub (X: Real_Matrix; Y : Real; Z: out Real_Matrix) is
    begin
        For_Each (Sub_Function, X, Y, Z);
    end Sub;
    procedure Sub (X: Real_Tensor_3D; Y : Real; Z: out Real_Tensor_3D) is
    begin
        For_Each (Sub_Function, X, Y, Z);
    end Sub;
    procedure Sub (X: Real_Tensor_4D; Y : Real; Z: out Real_Tensor_4D) is
    begin
        For_Each (Sub_Function, X, Y, Z);
    end Sub;

    procedure Sub (X: Real_Vector; Y : Integer_Vector; Z: out Real_Vector) is
    begin
        For_Each (Sub_Function, X, Y, Z);
    end Sub;
    procedure Sub (X: Real_Matrix; Y : Integer_Matrix; Z: out Real_Matrix) is
    begin
        For_Each (Sub_Function, X, Y, Z);
    end Sub;
    procedure Sub (X: Real_Tensor_3D; Y : Integer_Tensor_3D; Z: out Real_Tensor_3D) is
    begin
        For_Each (Sub_Function, X, Y, Z);
    end Sub;
    procedure Sub (X: Real_Tensor_4D; Y : Integer_Tensor_4D; Z: out Real_Tensor_4D) is
    begin
        For_Each (Sub_Function, X, Y, Z);
    end Sub;

    procedure Mul (X, Y : Real_Vector; Z: out Real_Vector) is
    begin
        For_Each (Mul_Function, X, Y, Z);
    end Mul;
    procedure Mul (X, Y : Real_Matrix; Z: out Real_Matrix) is
    begin
        For_Each (Mul_Function, X, Y, Z);
    end Mul;
    procedure Mul (X, Y : Real_Tensor_3D; Z: out Real_Tensor_3D) is
    begin
        For_Each (Mul_Function, X, Y, Z);
    end Mul;
    procedure Mul (X, Y : Real_Tensor_4D; Z: out Real_Tensor_4D) is
    begin
        For_Each (Mul_Function, X, Y, Z);
    end Mul;

    procedure Mul (X: Real_Vector; Y : Real; Z: out Real_Vector) is
    begin
        For_Each (Mul_Function, X, Y, Z);
    end Mul;
    procedure Mul (X: Real_Matrix; Y : Real; Z: out Real_Matrix) is
    begin
        For_Each (Mul_Function, X, Y, Z);
    end Mul;
    procedure Mul (X: Real_Tensor_3D; Y : Real; Z: out Real_Tensor_3D) is
    begin
        For_Each (Mul_Function, X, Y, Z);
    end Mul;
    procedure Mul (X: Real_Tensor_4D; Y : Real; Z: out Real_Tensor_4D) is
    begin
        For_Each (Mul_Function, X, Y, Z);
    end Mul;

    procedure Div (X, Y : Real_Vector; Z: out Real_Vector) is
    begin
        For_Each (Div_Function, X, Y, Z);
    end Div;
    procedure Div (X, Y : Real_Matrix; Z: out Real_Matrix) is
    begin
        For_Each (Div_Function, X, Y, Z);
    end Div;
    procedure Div (X, Y : Real_Tensor_3D; Z: out Real_Tensor_3D) is
    begin
        For_Each (Div_Function, X, Y, Z);
    end Div;
    procedure Div (X, Y : Real_Tensor_4D; Z: out Real_Tensor_4D) is
    begin
        For_Each (Div_Function, X, Y, Z);
    end Div;

    procedure Div (X: Real_Vector; Y : Real; Z: out Real_Vector) is
    begin
        For_Each (Div_Function, X, Y, Z);
    end Div;
    procedure Div (X: Real_Matrix; Y : Real; Z: out Real_Matrix) is
    begin
        For_Each (Div_Function, X, Y, Z);
    end Div;
    procedure Div (X: Real_Tensor_3D; Y : Real; Z: out Real_Tensor_3D) is
    begin
        For_Each (Div_Function, X, Y, Z);
    end Div;
    procedure Div (X: Real_Tensor_4D; Y : Real; Z: out Real_Tensor_4D) is
    begin
        For_Each (Div_Function, X, Y, Z);
    end Div;

    procedure Pow (X, Y : Real_Vector; Z: out Real_Vector) is
    begin
        For_Each (Pow_Function, X, Y, Z);
    end Pow;
    procedure Pow (X, Y : Real_Matrix; Z: out Real_Matrix) is
    begin
        For_Each (Pow_Function, X, Y, Z);
    end Pow;
    procedure Pow (X, Y : Real_Tensor_3D; Z: out Real_Tensor_3D) is
    begin
        For_Each (Pow_Function, X, Y, Z);
    end Pow;
    procedure Pow (X, Y : Real_Tensor_4D; Z: out Real_Tensor_4D) is
    begin
        For_Each (Pow_Function, X, Y, Z);
    end Pow;

    procedure Pow (X: Real_Vector; Y : Real; Z: out Real_Vector) is
    begin
        For_Each (Pow_Function, X, Y, Z);
    end Pow;
    procedure Pow (X: Real_Matrix; Y : Real; Z: out Real_Matrix) is
    begin
        For_Each (Pow_Function, X, Y, Z);
    end Pow;
    procedure Pow (X: Real_Tensor_3D; Y : Real; Z: out Real_Tensor_3D) is
    begin
        For_Each (Pow_Function, X, Y, Z);
    end Pow;
    procedure Pow (X: Real_Tensor_4D; Y : Real; Z: out Real_Tensor_4D) is
    begin
        For_Each (Pow_Function, X, Y, Z);
    end Pow;

    procedure Lt (X, Y : Real_Vector; Z: out Boolean_Vector) is
    begin
        For_Each (Lt_Function, X, Y, Z);
    end Lt;
    procedure Lt (X, Y : Real_Matrix; Z: out Boolean_Matrix) is
    begin
        For_Each (Lt_Function, X, Y, Z);
    end Lt;
    procedure Lt (X, Y : Real_Tensor_3D; Z: out Boolean_Tensor_3D) is
    begin
        For_Each (Lt_Function, X, Y, Z);
    end Lt;
    procedure Lt (X, Y : Real_Tensor_4D; Z: out Boolean_Tensor_4D) is
    begin
        For_Each (Lt_Function, X, Y, Z);
    end Lt;

    procedure Lt (X: Real_Vector; Y: Real; Z: out Boolean_Vector) is
    begin
        For_Each (Lt_Function, X, Y, Z);
    end Lt;
    procedure Lt (X: Real_Matrix; Y: Real; Z: out Boolean_Matrix) is
    begin
        For_Each (Lt_Function, X, Y, Z);
    end Lt;
    procedure Lt (X: Real_Tensor_3D; Y: Real; Z: out Boolean_Tensor_3D) is
    begin
        For_Each (Lt_Function, X, Y, Z);
    end Lt;
    procedure Lt (X: Real_Tensor_4D; Y: Real; Z: out Boolean_Tensor_4D) is
    begin
        For_Each (Lt_Function, X, Y, Z);
    end Lt;

    procedure Gt (X, Y : Real_Vector; Z: out Boolean_Vector) is
    begin
        For_Each (Gt_Function, X, Y, Z);
    end Gt;
    procedure Gt (X, Y : Real_Matrix; Z: out Boolean_Matrix) is
    begin
        For_Each (Gt_Function, X, Y, Z);
    end Gt;
    procedure Gt (X, Y : Real_Tensor_3D; Z: out Boolean_Tensor_3D) is
    begin
        For_Each (Gt_Function, X, Y, Z);
    end Gt;
    procedure Gt (X, Y : Real_Tensor_4D; Z: out Boolean_Tensor_4D) is
    begin
        For_Each (Gt_Function, X, Y, Z);
    end Gt;

    procedure Gt (X: Real_Vector; Y: Real; Z: out Boolean_Vector) is
    begin
        For_Each (Gt_Function, X, Y, Z);
    end Gt;
    procedure Gt (X: Real_Matrix; Y: Real; Z: out Boolean_Matrix) is
    begin
        For_Each (Gt_Function, X, Y, Z);
    end Gt;
    procedure Gt (X: Real_Tensor_3D; Y: Real; Z: out Boolean_Tensor_3D) is
    begin
        For_Each (Gt_Function, X, Y, Z);
    end Gt;
    procedure Gt (X: Real_Tensor_4D; Y: Real; Z: out Boolean_Tensor_4D) is
    begin
        For_Each (Gt_Function, X, Y, Z);
    end Gt;

    procedure Le (X, Y : Real_Vector; Z: out Boolean_Vector) is
    begin
        For_Each (Le_Function, X, Y, Z);
    end Le;
    procedure Le (X, Y : Real_Matrix; Z: out Boolean_Matrix) is
    begin
        For_Each (Le_Function, X, Y, Z);
    end Le;
    procedure Le (X, Y : Real_Tensor_3D; Z: out Boolean_Tensor_3D) is
    begin
        For_Each (Le_Function, X, Y, Z);
    end Le;
    procedure Le (X, Y : Real_Tensor_4D; Z: out Boolean_Tensor_4D) is
    begin
        For_Each (Le_Function, X, Y, Z);
    end Le;

    procedure Ge (X, Y : Real_Vector; Z: out Boolean_Vector) is
    begin
        For_Each (Ge_Function, X, Y, Z);
    end Ge;
    procedure Ge (X, Y : Real_Matrix; Z: out Boolean_Matrix) is
    begin
        For_Each (Ge_Function, X, Y, Z);
    end Ge;
    procedure Ge (X, Y : Real_Tensor_3D; Z: out Boolean_Tensor_3D) is
    begin
        For_Each (Ge_Function, X, Y, Z);
    end Ge;
    procedure Ge (X, Y : Real_Tensor_4D; Z: out Boolean_Tensor_4D) is
    begin
        For_Each (Ge_Function, X, Y, Z);
    end Ge;

    procedure Eq (X, Y : Real_Vector; Z: out Boolean_Vector) is
    begin
        For_Each (Eq_Function, X, Y, Z);
    end Eq;
    procedure Eq (X, Y : Real_Matrix; Z: out Boolean_Matrix) is
    begin
        For_Each (Eq_Function, X, Y, Z);
    end Eq;
    procedure Eq (X, Y : Real_Tensor_3D; Z: out Boolean_Tensor_3D) is
    begin
        For_Each (Eq_Function, X, Y, Z);
    end Eq;
    procedure Eq (X, Y : Real_Tensor_4D; Z: out Boolean_Tensor_4D) is
    begin
        For_Each (Eq_Function, X, Y, Z);
    end Eq;

    procedure Ne (X, Y : Real_Vector; Z: out Boolean_Vector) is
    begin
        For_Each (Ne_Function, X, Y, Z);
    end Ne;
    procedure Ne (X, Y : Real_Matrix; Z: out Boolean_Matrix) is
    begin
        For_Each (Ne_Function, X, Y, Z);
    end Ne;
    procedure Ne (X, Y : Real_Tensor_3D; Z: out Boolean_Tensor_3D) is
    begin
        For_Each (Ne_Function, X, Y, Z);
    end Ne;
    procedure Ne (X, Y : Real_Tensor_4D; Z: out Boolean_Tensor_4D) is
    begin
        For_Each (Ne_Function, X, Y, Z);
    end Ne;

    function Selection (Condition: Boolean; True_Value, False_Value: Padding_Type) return Padding_Type is
    begin
        if Condition then
            return True_Value;
        else
            return False_Value;
        end if;
    end Selection;

    procedure Selection(Condition : Boolean_Vector; True_Value, False_Value : Real_Vector; Z : out Real_Vector) is
    begin
        For_Each(Selection_Function, Condition, True_Value, False_Value, Z);
    end Selection;

    procedure Selection
       (Condition : Boolean_Matrix; True_Value, False_Value : Real_Matrix; Z : out Real_Matrix)
    is
    begin
        For_Each(Selection_Function, Condition, True_Value, False_Value, Z);
    end Selection;

    procedure Selection
       (Condition               : Boolean_Tensor_3D;
        True_Value, False_Value : Real_Tensor_3D; Z : out Real_Tensor_3D)
    is
    begin
        For_Each(Selection_Function, Condition, True_Value, False_Value, Z);
    end Selection;

    procedure Selection
       (Condition               : Boolean_Tensor_4D;
        True_Value, False_Value : Real_Tensor_4D; Z : out Real_Tensor_4D)
    is
    begin
        For_Each(Selection_Function, Condition, True_Value, False_Value, Z);
    end Selection;

    procedure Selection
       (Condition   : Boolean_Vector; True_Value : Real_Vector;
        False_Value : Real; Z : out Real_Vector)
    is
    begin
        For_Each(Selection_Function, Condition, True_Value, False_Value, Z);
    end Selection;

    procedure Selection
       (Condition   : Boolean_Matrix; True_Value : Real_Matrix;
        False_Value : Real; Z : out Real_Matrix)
    is
    begin
        For_Each(Selection_Function, Condition, True_Value, False_Value, Z);
    end Selection;

    procedure Selection
       (Condition   : Boolean_Tensor_3D; True_Value : Real_Tensor_3D;
        False_Value : Real; Z : out Real_Tensor_3D)
    is
    begin
        For_Each(Selection_Function, Condition, True_Value, False_Value, Z);
    end Selection;

    procedure Selection
       (Condition   : Boolean_Tensor_4D; True_Value : Real_Tensor_4D;
        False_Value : Real; Z : out Real_Tensor_4D)
    is
    begin
        For_Each(Selection_Function, Condition, True_Value, False_Value, Z);
    end Selection;

    procedure Sqr (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Sqr_Function, X, Y);
    end Sqr;
    procedure Sqr (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Sqr_Function, X, Y);
    end Sqr;
    procedure Sqr (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Sqr_Function, X, Y);
    end Sqr;
    procedure Sqr (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Sqr_Function, X, Y);
    end Sqr;

    procedure Sqrt (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Sqrt_Function, X, Y);
    end Sqrt;
    procedure Sqrt (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Sqrt_Function, X, Y);
    end Sqrt;
    procedure Sqrt (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Sqrt_Function, X, Y);
    end Sqrt;
    procedure Sqrt (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Sqrt_Function, X, Y);
    end Sqrt;

    procedure RSqr (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (RSqr_Function, X, Y);
    end RSqr;
    procedure RSqr (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (RSqr_Function, X, Y);
    end RSqr;
    procedure RSqr (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (RSqr_Function, X, Y);
    end RSqr;
    procedure RSqr (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (RSqr_Function, X, Y);
    end RSqr;

    procedure RSqrt (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (RSqrt_Function, X, Y);
    end RSqrt;
    procedure RSqrt (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (RSqrt_Function, X, Y);
    end RSqrt;
    procedure RSqrt (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (RSqrt_Function, X, Y);
    end RSqrt;
    procedure RSqrt (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (RSqrt_Function, X, Y);
    end RSqrt;

    procedure Log2 (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Log2_Function, X, Y);
    end Log2;
    procedure Log2 (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Log2_Function, X, Y);
    end Log2;
    procedure Log2 (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Log2_Function, X, Y);
    end Log2;
    procedure Log2 (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Log2_Function, X, Y);
    end Log2;

    procedure Min (X, Y: Real_Vector; Z: out Real_Vector) is
    begin
        For_Each (Min_Function, X, Y, Z);
    end Min;
    procedure Min (X, Y : Real_Matrix; Z: out Real_Matrix) is
    begin
        For_Each (Min_Function, X, Y, Z);
    end Min;
    procedure Min (X, Y : Real_Tensor_3D; Z: out Real_Tensor_3D) is
    begin
        For_Each (Min_Function, X, Y, Z);
    end Min;
    procedure Min (X, Y : Real_Tensor_4D; Z: out Real_Tensor_4D) is
    begin
        For_Each (Min_Function, X, Y, Z);
    end Min;

    procedure Min (X: Real_Vector; Y: Real; Z: out Real_Vector) is
    begin
        For_Each (Min_Function, X, Y, Z);
    end Min;
    procedure Min (X: Real_Matrix; Y: Real; Z: out Real_Matrix) is
    begin
        For_Each (Min_Function, X, Y, Z);
    end Min;
    procedure Min (X: Real_Tensor_3D; Y: Real; Z: out Real_Tensor_3D) is
    begin
        For_Each (Min_Function, X, Y, Z);
    end Min;
    procedure Min (X: Real_Tensor_4D; Y: Real; Z: out Real_Tensor_4D) is
    begin
        For_Each (Min_Function, X, Y, Z);
    end Min;

    procedure Max (X, Y: Real_Vector; Z: out Real_Vector) is
    begin
        For_Each (Max_Function, X, Y, Z);
    end Max;
    procedure Max (X, Y : Real_Matrix; Z: out Real_Matrix) is
    begin
        For_Each (Max_Function, X, Y, Z);
    end Max;
    procedure Max (X, Y : Real_Tensor_3D; Z: out Real_Tensor_3D) is
    begin
        For_Each (Max_Function, X, Y, Z);
    end Max;
    procedure Max (X, Y : Real_Tensor_4D; Z: out Real_Tensor_4D) is
    begin
        For_Each (Max_Function, X, Y, Z);
    end Max;

    procedure Max (X: Real_Vector; Y: Real; Z: out Real_Vector) is
    begin
        For_Each (Max_Function, X, Y, Z);
    end Max;
    procedure Max (X: Real_Matrix; Y: Real; Z: out Real_Matrix) is
    begin
        For_Each (Max_Function, X, Y, Z);
    end Max;
    procedure Max (X: Real_Tensor_3D; Y: Real; Z: out Real_Tensor_3D) is
    begin
        For_Each (Max_Function, X, Y, Z);
    end Max;
    procedure Max (X: Real_Tensor_4D; Y: Real; Z: out Real_Tensor_4D) is
    begin
        For_Each (Max_Function, X, Y, Z);
    end Max;

    procedure Clamp (X, A, B : Real_Vector; Z: out Real_Vector) is
    begin
        For_Each (Clamp_Function, X, A, B, Z);
    end Clamp;
    procedure Clamp (X, A, B : Real_Matrix; Z: out Real_Matrix) is
    begin
        For_Each (Clamp_Function, X, A, B, Z);
    end Clamp;
    procedure Clamp (X, A, B : Real_Tensor_3D; Z: out Real_Tensor_3D) is
    begin
        For_Each (Clamp_Function, X, A, B, Z);
    end Clamp;
    procedure Clamp (X, A, B : Real_Tensor_4D; Z: out Real_Tensor_4D) is
    begin
        For_Each (Clamp_Function, X, A, B, Z);
    end Clamp;

    procedure Clamp (X: Real_Tensor_4D; A, B: Real; Z: out Real_Tensor_4D) is
    begin
        For_Each (Clamp_Function, X, A, B, Z);
    end Clamp;

    function Downscaled_Extent (X, F: Positive; P, Q: Integer; S, D: Positive) return Positive is
        Fd: constant Integer := (F - 1) * D + 1;
    begin
        return (P + X + Q - Fd) / S + 1;
    end Downscaled_Extent;

    function Downscaled_Output_Shape
       (Input_Shape, Size : Tiny_Positive_Vector; Padding: Padding_Type; Stride, Dilation : Tiny_Positive_Vector) return Tiny_Positive_Vector is
        Output_Shape: Tiny_Positive_Vector(Input_Shape'Range);
    begin
        for I in Input_Shape'Range loop
            Output_Shape(I) := Downscaled_Extent(Input_Shape(I),
                Size (I - Input_Shape'First + Size'First),
                Padding (I - Input_Shape'First + Padding'First)(1), Padding (I - Input_Shape'First + Padding'First)(2),
                Stride (I - Input_Shape'First + Stride'First),
                Dilation (I - Input_Shape'First + Dilation'First));
        end loop;
        return Output_Shape;
    end Downscaled_Output_Shape;

    function Downscaled_Output_Shape_2
       (Input_Shape, Size : Tiny_Positive_Vector_2; Padding: Padding_Type_2; Stride, Dilation : Tiny_Positive_Vector_2) return Tiny_Positive_Vector_2 is
        First: constant Positive := Input_Shape'First;
        Last: constant Positive := Input_Shape'Last;
    begin
        return ( First => Downscaled_Extent (Input_Shape(First), Size (First), Padding (First)(1), Padding (First)(2), Stride (First), Dilation (First)),
            Last => Downscaled_Extent (Input_Shape(Last), Size (Last), Padding (Last)(1), Padding (Last)(2), Stride (Last), Dilation (Last)) );
    end Downscaled_Output_Shape_2;

    function Downscaled_Output_Shape_3
       (Input_Shape, Size : Tiny_Positive_Vector_3; Padding: Padding_Type_3; Stride, Dilation : Tiny_Positive_Vector_3) return Tiny_Positive_Vector_3 is
    begin
        return ( Downscaled_Extent (Input_Shape(1), Size (1), Padding (1)(1), Padding (1)(2), Stride (1), Dilation (1)),
            Downscaled_Extent (Input_Shape(2), Size (2), Padding (2)(1), Padding (2)(2), Stride (2), Dilation (2)),
            Downscaled_Extent (Input_Shape(3), Size (3), Padding (3)(1), Padding (3)(2), Stride (3), Dilation (3)) );
    end Downscaled_Output_Shape_3;

    function Downscaled_Output_Shape_4
       (Input_Shape, Size : Tiny_Positive_Vector_4; Padding: Padding_Type_4; Stride, Dilation : Tiny_Positive_Vector_4) return Tiny_Positive_Vector_4 is
    begin
        return ( Downscaled_Extent (Input_Shape(1), Size (1), Padding (1)(1), Padding (1)(2), Stride (1), Dilation (1)),
            Downscaled_Extent (Input_Shape(2), Size (2), Padding (2)(1), Padding (2)(2), Stride (2), Dilation (2)),
            Downscaled_Extent (Input_Shape(3), Size (3), Padding (3)(1), Padding (3)(2), Stride (3), Dilation (3)),
            Downscaled_Extent (Input_Shape(4), Size (4), Padding (4)(1), Padding (4)(2), Stride (4), Dilation (4)) );
    end Downscaled_Output_Shape_4;

    function Upscaled_Extent (X, F: Positive; P, Q: Integer; S, D: Positive) return Positive is
        Fd: constant Integer := (F - 1) * D + 1;
    begin
        return (X - 1) * S + Fd - (P + Q);
    end Upscaled_Extent;

    function Upscaled_Output_Shape
       (Input_Shape, Size : Tiny_Positive_Vector; Padding: Padding_Type; Stride, Dilation: Tiny_Positive_Vector) return Tiny_Positive_Vector is
        Output_Shape: Tiny_Positive_Vector(Input_Shape'Range);
    begin
        for I in Input_Shape'Range loop
            Output_Shape(I) := Upscaled_Extent(Input_Shape(I),
                Size(I - Input_Shape'First + Size'First),
                Padding(I - Input_Shape'First + Padding'First)(1), Padding(I - Input_Shape'First + Padding'First)(2),
                Stride(I - Input_Shape'First + Stride'First),
                Dilation(I - Input_Shape'First + Dilation'First));
        end loop;
        return Output_Shape;
    end Upscaled_Output_Shape;

    function Upscaled_Output_Shape_2
       (Input_Shape, Size : Tiny_Positive_Vector_2; Padding: Padding_Type_2; Stride, Dilation : Tiny_Positive_Vector_2) return Tiny_Positive_Vector_2 is
    begin
        return ( Upscaled_Extent (Input_Shape(1), Size (1), Padding (1)(1), Padding (1)(2), Stride (1), Dilation (1)),
            Upscaled_Extent (Input_Shape(2), Size (2), Padding (2)(1), Padding (2)(2), Stride (2), Dilation (2)) );
    end Upscaled_Output_Shape_2;

    function Upscaled_Output_Shape_3
       (Input_Shape, Size : Tiny_Positive_Vector_3; Padding: Padding_Type_3; Stride, Dilation : Tiny_Positive_Vector_3) return Tiny_Positive_Vector_3 is
    begin
        return ( Upscaled_Extent (Input_Shape(1), Size (1), Padding (1)(1), Padding (1)(2), Stride (1), Dilation (1)),
            Upscaled_Extent (Input_Shape(2), Size (2), Padding (2)(1), Padding (2)(2), Stride (2), Dilation (2)),
            Upscaled_Extent (Input_Shape(3), Size (3), Padding (3)(1), Padding (3)(2), Stride (3), Dilation (3)) );
    end Upscaled_Output_Shape_3;

    function Upscaled_Output_Shape_4
       (Input_Shape, Size : Tiny_Positive_Vector_4; Padding: Padding_Type_4; Stride, Dilation : Tiny_Positive_Vector_4) return Tiny_Positive_Vector_4 is
    begin
        return ( Upscaled_Extent (Input_Shape(1), Size (1), Padding (1)(1), Padding (1)(2), Stride (1), Dilation (1)),
            Upscaled_Extent (Input_Shape(2), Size (2), Padding (2)(1), Padding (2)(2), Stride (2), Dilation (2)),
            Upscaled_Extent (Input_Shape(3), Size (3), Padding (3)(1), Padding (3)(2), Stride (3), Dilation (3)),
            Upscaled_Extent (Input_Shape(4), Size (4), Padding (4)(1), Padding (4)(2), Stride (4), Dilation (4)) );
    end Upscaled_Output_Shape_4;

    function Auto_Padding_Extent (X, F, S, D: Positive) return Padding_Extent is
        Xd: Integer := (X + (S-1)) / S; -- Ceil
        Fd: Integer := (F - 1) * D + 1;
        T: Integer := Integer'Max((Xd - 1) * S + Fd - X, 0);
    begin
        return (T/2, (T+1)/2);
    end Auto_Padding_Extent;

    function Auto_Padding (Input_Shape, Size, Stride, Dilation: Tiny_Positive_Vector) return Padding_Type is
        Padding: Padding_Type(Input_Shape'Range);
    begin
        for I in Input_Shape'Range loop
            Padding(I) := Auto_Padding_Extent (Input_Shape(I), Size(I), Stride(I), Dilation(I));
        end loop;
        return Padding;
    end Auto_Padding;

    function Auto_Padding_1 (Input_Shape, Size, Stride, Dilation: Tiny_Positive_Vector_1) return Padding_Type_1 is
    begin
        return ( 1 => Auto_Padding_Extent (Input_Shape(1), Size (1), Stride (1), Dilation (1)) );
    end Auto_Padding_1;

    function Auto_Padding_2 (Input_Shape, Size, Stride, Dilation: Tiny_Positive_Vector_2) return Padding_Type_2 is
    begin
        return ( Auto_Padding_Extent (Input_Shape(1), Size (1), Stride (1), Dilation (1)),
            Auto_Padding_Extent (Input_Shape(2), Size (2), Stride (2), Dilation (2)) );
    end Auto_Padding_2;

    function Auto_Padding_3 (Input_Shape, Size, Stride, Dilation: Tiny_Positive_Vector_3) return Padding_Type_3 is
    begin
        return ( Auto_Padding_Extent (Input_Shape(1), Size (1), Stride (1), Dilation (1)),
            Auto_Padding_Extent (Input_Shape(2), Size (2), Stride (2), Dilation (2)),
            Auto_Padding_Extent (Input_Shape(3), Size (3), Stride (3), Dilation (3)) );
    end Auto_Padding_3;

    function Auto_Padding_4 (Input_Shape, Size, Stride, Dilation: Tiny_Positive_Vector_4) return Padding_Type_4 is
    begin
        return ( Auto_Padding_Extent (Input_Shape(1), Size (1), Stride (1), Dilation (1)),
            Auto_Padding_Extent (Input_Shape(2), Size (2), Stride (2), Dilation (2)),
            Auto_Padding_Extent (Input_Shape(3), Size (3), Stride (3), Dilation (3)),
            Auto_Padding_Extent (Input_Shape(4), Size (4), Stride (4), Dilation (4)) );
    end Auto_Padding_4;

    procedure Conv
       (Input, Filter    : Real_Tensor_3D; Bias : Real_Matrix := Scalar_2D_0;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Groups           : Natural         := 1;
        Output: out Real_Tensor_3D)
    is
        --  Input_Shape: Positive_Vector := (1 => Input'Length(3));
        --  Size: Positive_Vector := (1 => Filter'Length(3));
        --  Stride1: Positive_Vector := Selection(Stride'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Stride);
        --  Dilation1: Positive_Vector := Selection(Dilation'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Dilation);
        --  Padding1: Padding_Type := Selection(Padding'Length = 0, Auto_Padding (Input_Shape, Size, Stride1, Dilation1), Padding);
        --  Output_Shape: Positive_Vector := Downscaled_Output_Shape(Input_Shape, Size, Padding1, Stride1, Dilation1);
        --  Output: Real_Tensor_3D (Input'Range(1), Filter'Range(1), 1..Output_Shape(1));
        Stride1: Tiny_Positive_Vector (1..1);
        Dilation1: Tiny_Positive_Vector (1..1);
        Padding1: Padding_Type (1..1);
    begin
        if Stride'Length = 0 then
            Stride1 := (1 => 1);
        else
            Stride1 := Stride;
        end if;
        if Dilation'Length = 0 then
            Dilation1 := (1 => 1);
        else
            Dilation1 := Dilation;
        end if;
        if Padding'Length = 0 then
            Padding1 := Auto_Padding_1 ((1 => Input'Length(3)), (1 => Filter'Length(3)), Stride1, Dilation1);
        else
            Padding1 := Padding;
        end if;
        Set_Bias(Bias, Output);
        -- Convolution
        if Groups = 1 then
            Conv_1D (Input, Filter, Border, Padding1(1), Stride1(1), Dilation1(1), Output);
        elsif Groups = 0 OR else Groups = Input'Length(2) then
            -- Depth-wise separable
            Depthwise_Conv_1D (Input, Filter, Border, Padding1(1), Stride1(1), Dilation1(1), Output);
        else
            -- Groupped
            Groupped_Conv_1D (Input, Filter, Border, Padding1(1), Stride1(1), Dilation1(1), Groups, Output);
        end if;
    end Conv;

    procedure Conv
       (Input, Filter    : Real_Tensor_4D; Bias : Real_Matrix := Scalar_2D_0;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Groups           : Natural         := 1;
        Output: out Real_Tensor_4D)
    is
        --  Input_Shape: Positive_Vector := (Input'Length(3), Input'Length(4));
        --  Size: Positive_Vector(1..2) := (Filter'Length(3), Filter'Length(4));
        --  Stride1: Positive_Vector := Selection(Stride'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Stride);
        --  Dilation1: Positive_Vector := Selection(Dilation'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Dilation);
        --  Padding1: Padding_Type := Selection(Padding'Length = 0, Auto_Padding (Input_Shape, Size, Stride1, Dilation1), Padding);
        --  Output_Shape: Positive_Vector := Downscaled_Output_Shape(Input_Shape, Size, Padding1, Stride1, Dilation1);
        --  Output: Real_Tensor_4D (Input'Range(1), Filter'Range(1), 1..Output_Shape(1), 1..Output_Shape(2));
        Stride1: Tiny_Positive_Vector (1..2);
        Dilation1: Tiny_Positive_Vector (1..2);
        Padding1: Padding_Type(1..2);
    begin
        if Stride'Length = 0 then
            Stride1 := (1, 1);
        else
            Stride1 := Stride;
        end if;
        if Dilation'Length = 0 then
            Dilation1 := (1, 1);
        else
            Dilation1 := Dilation;
        end if;
        if Padding'Length = 0 then
            Padding1 := Auto_Padding_2 ((Input'Length(3), Input'Length(4)), (Filter'Length(3), Filter'Length(4)), Stride1, Dilation1);
        else
            Padding1 := Padding;
        end if;
        Set_Bias(Bias, Output);
        -- Convolution
        if Groups = 1 then
            Conv_2D (Input, Filter, Border, Padding1, Stride1, Dilation1, Output);
        elsif Groups = 0 OR else Groups = Input'Length(2) then
            -- Depth-wise separable
            Depthwise_Conv_2D (Input, Filter, Border, Padding1, Stride1, Dilation1, Output);
        else
            -- Groupped
            Groupped_Conv_2D (Input, Filter, Border, Padding1, Stride1, Dilation1, Groups, Output);
        end if;
    end Conv;

    procedure Deconv
       (Input, Filter    : Real_Tensor_3D; Bias : Real_Matrix := Scalar_2D_0;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        --  Output_Shape     : Positive_Vector := Empty_Positive_Vector;
        Groups           : Natural         := 1;
        Output: out Real_Tensor_3D)
    is
        --  Input_Shape: Positive_Vector := (1 => Input'Length(3));
        --  Size: Positive_Vector := (1 => Filter'Length(3));
        --  Stride1: Positive_Vector := Selection(Stride'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Stride);
        --  Dilation1: Positive_Vector := Selection(Dilation'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Dilation);
        --  Padding1: Padding_Type := Selection(Padding'Length = 0, Auto_Padding (Input_Shape, Size, Stride1, Dilation1), Padding);
        --  Output_Shape1: Positive_Vector := Selection(Output_Shape'Length = 0, Upscaled_Output_Shape(Input_Shape, Size, Padding1, Stride1, Dilation1), Output_Shape);
        --  Output: Real_Tensor_3D (Input'Range(1), Filter'Range(2), 1..Output_Shape1(1));
        Stride1: Tiny_Positive_Vector (1..1);
        Dilation1: Tiny_Positive_Vector (1..1);
        Padding1: Padding_Type (1..1);
    begin
        if Stride'Length = 0 then
            Stride1 := (1 => 1);
        else
            Stride1 := Stride;
        end if;
        if Dilation'Length = 0 then
            Dilation1 := (1 => 1);
        else
            Dilation1 := Dilation;
        end if;
        if Padding'Length = 0 then
            Padding1 := Auto_Padding_1 ((1 => Output'Length(3)), (1 => Filter'Length(3)), Stride1, Dilation1);
        else
            Padding1 := Padding;
        end if;
        Set_Bias(Bias, Output);
        -- Convolution
        if Groups = 1 then
            Conv_Transposed_1D (Input, Filter, Border, Padding1(1), Stride1(1), Dilation1(1), Output);
        elsif Groups = 0 OR else Groups = Input'Length(2) then
            -- Depth-wise separable
            Depthwise_Conv_Transposed_1D (Input, Filter, Border, Padding1(1), Stride1(1), Dilation1(1), Output);
        else
            -- Groupped
            Groupped_Conv_Transposed_1D (Input, Filter, Border, Padding1(1), Stride1(1), Dilation1(1), Groups, Output);
        end if;
    end Deconv;

    procedure Deconv
       (Input, Filter    : Real_Tensor_4D; Bias : Real_Matrix := Scalar_2D_0;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        --  Output_Shape     : Positive_Vector := Empty_Positive_Vector;
        Groups           : Natural         := 1;
        Output: out Real_Tensor_4D)
    is
        --  Input_Shape: Positive_Vector := (Input'Length(3), Input'Length(4));
        --  Size: Positive_Vector := (Filter'Length(3), Filter'Length(4));
        --  Stride1: Positive_Vector := Selection(Stride'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Stride);
        --  Dilation1: Positive_Vector := Selection(Dilation'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Dilation);
        --  Padding1: Padding_Type := Selection(Padding'Length = 0, Auto_Padding (Input_Shape, Size, Stride1, Dilation1), Padding);
        --  Output_Shape1: Positive_Vector := Selection(Output_Shape'Length = 0, Upscaled_Output_Shape(Input_Shape, Size, Padding1, Stride1, Dilation1), Output_Shape);
        --  Output: Real_Tensor_4D (Input'Range(1), Filter'Range(2), 1..Output_Shape1(1), 1..Output_Shape1(2));
        Stride1: Tiny_Positive_Vector (1..2);
        Dilation1: Tiny_Positive_Vector (1..2);
        Padding1: Padding_Type(1..2);
    begin
        if Stride'Length = 0 then
            Stride1 := (1, 1);
        else
            Stride1 := Stride;
        end if;
        if Dilation'Length = 0 then
            Dilation1 := (1, 1);
        else
            Dilation1 := Dilation;
        end if;
        if Padding'Length = 0 then
            Padding1 := Auto_Padding_2 ((Output'Length(3), Output'Length(4)), (Filter'Length(3), Filter'Length(4)), Stride1, Dilation1);
        else
            Padding1 := Padding;
        end if;
        Set_Bias(Bias, Output);
        -- Convolution
        if Groups = 1 then
            Conv_Transposed_2D (Input, Filter, Border, Padding, Stride1, Dilation1, Output);
        elsif Groups = 0 OR else Groups = Input'Length(2) then
            -- Depth-wise separable
            Depthwise_Conv_Transposed_2D (Input, Filter, Border, Padding, Stride1, Dilation1, Output);
        else
            -- Groupped
            Groupped_Conv_Transposed_2D (Input, Filter, Border, Padding, Stride1, Dilation1, Groups, Output);
        end if;
    end Deconv;

    procedure Box
       (Input            : Real_Tensor_3D;
        Size : Tiny_Positive_Vector;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Normalize        : Boolean         := False;
        Output: out Real_Tensor_3D)
    is
        --  Input_Shape: Positive_Vector := Shape_Of(Input);
        Kernel_Size: constant Real := Real(Size(1) * Size(2) * Size(3));
        --  Stride1: Positive_Vector := Selection(Stride'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Stride);
        --  Dilation1: Positive_Vector := Selection(Dilation'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Dilation);
        --  Padding1: Padding_Type := Selection(Padding'Length = 0, Auto_Padding (Input_Shape, Size, Stride1, Dilation1), Padding);
        --  Output_Shape: Positive_Vector := Downscaled_Output_Shape(Input_Shape, Size, Padding1, Stride1, Dilation1);
        --  Output: Real_Tensor_3D (1..Output_Shape(1), 1..Output_Shape(2), 1..Output_Shape(3));
        Stride1: Tiny_Positive_Vector (1..3);
        Dilation1: Tiny_Positive_Vector (1..3);
        Padding1: Padding_Type(1..3);
    begin
        if Stride'Length = 0 then
            Stride1 := (1, 1, 1);
        else
            Stride1 := Stride;
        end if;
        if Dilation'Length = 0 then
            Dilation1 := (1, 1, 1);
        else
            Dilation1 := Dilation;
        end if;
        if Padding'Length = 0 then
            Padding1 := Auto_Padding_3 ((Input'Length(1), Input'Length(2), Input'Length(3)), Size, Stride1, Dilation1);
        else
            Padding1 := Padding;
        end if;
        Output := (others => (others => (others => 0.0)));
        Pool (Input, Size, Border, Padding1, Stride1, Dilation1, Add_Function, Output);
        if Normalize then
            if Border = Border_Mode_Constant then
                For_Each(Div_Function, Output, Kernel_Size, Output);
            elsif Border = Border_Mode_Ignore then
                declare
                    Tensor: Real_Tensor_3D(Output'Range(1), Output'Range(2), Output'Range(3)) := (others => (others => (others => 0.0)));
                begin
                    Pool_Area (Shape_Of(Input), Size, Padding1, Stride1, Dilation1, Tensor);
                    For_Each(Div_Function, Output, Tensor, Output);
                end;
            end if;
        end if;
    end Box;

    procedure Box
       (Input            : Real_Tensor_4D;
        Size : Tiny_Positive_Vector;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Normalize        : Boolean         := False;
        Output: out Real_Tensor_4D)
    is
        --  Input_Shape: Positive_Vector := Shape_Of(Input);
        Kernel_Size: constant Real := Real(Size(1) * Size(2) * Size(3) * Size(4));
        --  Stride1: Positive_Vector := Selection(Stride'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Stride);
        --  Dilation1: Positive_Vector := Selection(Dilation'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Dilation);
        --  Padding1: Padding_Type := Selection(Padding'Length = 0, Auto_Padding (Input_Shape, Size, Stride1, Dilation1), Padding);
        --  Output_Shape: Positive_Vector := Downscaled_Output_Shape(Input_Shape, Size, Padding1, Stride1, Dilation1);
        --  Output: Real_Tensor_4D (1..Output_Shape(1), 1..Output_Shape(2), 1..Output_Shape(3), 1..Output_Shape(4));
        Stride1: Tiny_Positive_Vector (1..4);
        Dilation1: Tiny_Positive_Vector (1..4);
        Padding1: Padding_Type(1..4);
    begin
        if Stride'Length = 0 then
            Stride1 := (1, 1, 1, 1);
        else
            Stride1 := Stride;
        end if;
        if Dilation'Length = 0 then
            Dilation1 := (1, 1, 1, 1);
        else
            Dilation1 := Dilation;
        end if;
        if Padding'Length = 0 then
            Padding1 := Auto_Padding_4 ((Input'Length(1), Input'Length(2), Input'Length(3), Input'Length(4)), Size, Stride1, Dilation1);
        else
            Padding1 := Padding;
        end if;
        Output := (others => (others => (others => (others => 0.0))));
        Pool (Input, Size, Border, Padding1, Stride1, Dilation1, Add_Function, Output);
        if Normalize then
            if Border = Border_Mode_Constant then
                For_Each(Div_Function, Output, Kernel_Size, Output);
            elsif Border = Border_Mode_Ignore then
                declare
                    Tensor: Real_Tensor_4D(Output'Range(1), Output'Range(2), Output'Range(3), Output'Range(4)) := (others => (others => (others => (others => 0.0))));
                begin
                    Pool_Area (Shape_Of(Input), Size, Padding1, Stride1, Dilation1, Tensor);
                    For_Each(Div_Function, Output, Tensor, Output);
                end;
            end if;
        end if;
    end Box;

    procedure Debox
       (Input            : Real_Tensor_3D;
        Size : Tiny_Positive_Vector;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        --  Output_Shape     : Positive_Vector := Empty_Positive_Vector;
        Normalize        : Boolean         := False;
        Output: out Real_Tensor_3D)
    is
        --  Input_Shape: Positive_Vector := Shape_Of(Input);
        Kernel_Size: constant Real := Real(Size(1) * Size(2) * Size(3));
        --  Stride1: Positive_Vector := Selection(Stride'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Stride);
        --  Dilation1: Positive_Vector := Selection(Dilation'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Dilation);
        --  Padding1: Padding_Type := Selection(Padding'Length = 0, Auto_Padding (Input_Shape, Size, Stride1, Dilation1), Padding);
        --  Output_Shape1: Positive_Vector := Selection(Output_Shape'Length = 0, Upscaled_Output_Shape(Input_Shape, Size, Padding1, Stride1, Dilation1), Output_Shape);
        --  Output: Real_Tensor_3D (1..Output_Shape1(1), 1..Output_Shape1(2), 1..Output_Shape1(3));
        Stride1: Tiny_Positive_Vector (1..3);
        Dilation1: Tiny_Positive_Vector (1..3);
        Padding1: Padding_Type(1..3);
    begin
        if Stride'Length = 0 then
            Stride1 := (1, 1, 1);
        else
            Stride1 := Stride;
        end if;
        if Dilation'Length = 0 then
            Dilation1 := (1, 1, 1);
        else
            Dilation1 := Dilation;
        end if;
        if Padding'Length = 0 then
            Padding1 := Auto_Padding_3 ((Output'Length(1), Output'Length(2), Output'Length(3)), Size, Stride1, Dilation1);
        else
            Padding1 := Padding;
        end if;
        Output := (others => (others => (others => 0.0)));
        Pool_Transposed (Input, Size, Border, Padding1, Stride1, Dilation1, Add_Function, Output);
        if Normalize then
            if Border = Border_Mode_Constant then
                For_Each(Div_Function, Output, Kernel_Size, Output);
            elsif Border = Border_Mode_Ignore then
                declare
                    Tensor: Real_Tensor_3D(Output'Range(1), Output'Range(2), Output'Range(3)) := (others => (others => (others => 0.0)));
                begin
                    Pool_Area_Transposed (Shape_Of(Input), Size, Padding1, Stride1, Dilation1, Tensor);
                    For_Each(Div_Function, Output, Tensor, Output);
                end;
            end if;
        end if;
    end Debox;

    procedure Debox
       (Input            : Real_Tensor_4D;
        Size : Tiny_Positive_Vector;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        --  Output_Shape     : Positive_Vector := Empty_Positive_Vector;
        Normalize        : Boolean         := False;
        Output: out Real_Tensor_4D)
    is
        --  Input_Shape: Positive_Vector := Shape_Of(Input);
        Kernel_Size: constant Real := Real(Size(1) * Size(2) * Size(3) * Size(4));
        --  Stride1: Positive_Vector := Selection(Stride'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Stride);
        --  Dilation1: Positive_Vector := Selection(Dilation'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Dilation);
        --  Padding1: Padding_Type := Selection(Padding'Length = 0, Auto_Padding (Input_Shape, Size, Stride1, Dilation1), Padding);
        --  Output_Shape1: Positive_Vector := Selection(Output_Shape'Length = 0, Upscaled_Output_Shape(Input_Shape, Size, Padding1, Stride1, Dilation1), Output_Shape);
        --  Output: Real_Tensor_4D (1..Output_Shape1(1), 1..Output_Shape1(2), 1..Output_Shape1(3), 1..Output_Shape1(4));
        Stride1: Tiny_Positive_Vector (1..4);
        Dilation1: Tiny_Positive_Vector (1..4);
        Padding1: Padding_Type(1..4);
    begin
        if Stride'Length = 0 then
            Stride1 := (1, 1, 1, 1);
        else
            Stride1 := Stride;
        end if;
        if Dilation'Length = 0 then
            Dilation1 := (1, 1, 1, 1);
        else
            Dilation1 := Dilation;
        end if;
        if Padding'Length = 0 then
            Padding1 := Auto_Padding_4 ((Output'Length(1), Output'Length(2), Output'Length(3), Output'Length(4)), Size, Stride1, Dilation1);
        else
            Padding1 := Padding;
        end if;
        Output := (others => (others => (others => (others => 0.0))));
        Pool_Transposed (Input, Size, Border, Padding1, Stride1, Dilation1, Add_Function, Output);
        if Normalize then
            if Border = Border_Mode_Constant then
                For_Each(Div_Function, Output, Kernel_Size, Output);
            elsif Border = Border_Mode_Ignore then
                declare
                    Tensor: Real_Tensor_4D(Output'Range(1), Output'Range(2), Output'Range(3), Output'Range(4)) := (others => (others => (others => (others => 0.0))));
                begin
                    Pool_Area_Transposed (Shape_Of(Input), Size, Padding1, Stride1, Dilation1, Tensor);
                    For_Each(Div_Function, Output, Tensor, Output);
                end;
            end if;
        end if;
    end Debox;

    procedure Argmax_Pool
       (Input            : Real_Tensor_3D;
        Size : Tiny_Positive_Vector;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Output: out Natural_Tensor_3D)
    is
        --  Input_Shape: Positive_Vector := Shape_Of(Input);
        --  Stride1: Positive_Vector := Selection(Stride'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Stride);
        --  Dilation1: Positive_Vector := Selection(Dilation'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Dilation);
        --  Padding1: Padding_Type := Selection(Padding'Length = 0, Auto_Padding (Input_Shape, Size, Stride1, Dilation1), Padding);
        --  Output_Shape: Positive_Vector := Downscaled_Output_Shape(Input_Shape, Size, Padding1, Stride1, Dilation1);
        --  Output: Natural_Tensor_3D (1..Output_Shape(1), 1..Output_Shape(2), 1..Output_Shape(3));
        Stride1: Tiny_Positive_Vector (1..3);
        Dilation1: Tiny_Positive_Vector (1..3);
        Padding1: Padding_Type(1..3);
    begin
        if Stride'Length = 0 then
            Stride1 := (1, 1, 1);
        else
            Stride1 := Stride;
        end if;
        if Dilation'Length = 0 then
            Dilation1 := (1, 1, 1);
        else
            Dilation1 := Dilation;
        end if;
        if Padding'Length = 0 then
            Padding1 := Auto_Padding_3 ((Input'Length(1), Input'Length(2), Input'Length(3)), Size, Stride1, Dilation1);
        else
            Padding1 := Padding;
        end if;
        Arg_Pool (Input, Size, Border, Padding1, Stride1, Dilation1, Gt_Function, Output);
    end Argmax_Pool;

    procedure Argmax_Pool
       (Input            : Real_Tensor_4D;
        Size : Tiny_Positive_Vector;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Output: out Natural_Tensor_4D)
    is
        --  Input_Shape: Positive_Vector := Shape_Of(Input);
        --  Stride1: Positive_Vector := Selection(Stride'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Stride);
        --  Dilation1: Positive_Vector := Selection(Dilation'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Dilation);
        --  Padding1: Padding_Type := Selection(Padding'Length = 0, Auto_Padding (Input_Shape, Size, Stride1, Dilation1), Padding);
        --  Output_Shape: Positive_Vector := Downscaled_Output_Shape(Input_Shape, Size, Padding1, Stride1, Dilation1);
        --  Output: Natural_Tensor_4D (1..Output_Shape(1), 1..Output_Shape(2), 1..Output_Shape(3), 1..Output_Shape(4));
        Stride1: Tiny_Positive_Vector (1..4);
        Dilation1: Tiny_Positive_Vector (1..4);
        Padding1: Padding_Type(1..4);
    begin
        if Stride'Length = 0 then
            Stride1 := (1, 1, 1, 1);
        else
            Stride1 := Stride;
        end if;
        if Dilation'Length = 0 then
            Dilation1 := (1, 1, 1, 1);
        else
            Dilation1 := Dilation;
        end if;
        if Padding'Length = 0 then
            Padding1 := Auto_Padding_4 ((Input'Length(1), Input'Length(2), Input'Length(3), Input'Length(4)), Size, Stride1, Dilation1);
        else
            Padding1 := Padding;
        end if;
        Arg_Pool (Input, Size, Border, Padding1, Stride1, Dilation1, Gt_Function, Output);
    end Argmax_Pool;

    procedure Sample
       (Input            : Real_Tensor_3D; Index : Natural_Tensor_3D;
        Size : Tiny_Positive_Vector; Border : Border_Modes := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Output: out Real_Tensor_3D)
    is
        --  Input_Shape: Positive_Vector := Shape_Of(Input);
        --  Stride1: Positive_Vector := Selection(Stride'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Stride);
        --  Dilation1: Positive_Vector := Selection(Dilation'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Dilation);
        --  Padding1: Padding_Type := Selection(Padding'Length = 0, Auto_Padding (Input_Shape, Size, Stride1, Dilation1), Padding);
        --  Output_Shape: Positive_Vector := Downscaled_Output_Shape(Input_Shape, Size, Padding1, Stride1, Dilation1);
        --  Output: Real_Tensor_3D (1..Output_Shape(1), 1..Output_Shape(2), 1..Output_Shape(3));
        Stride1: Tiny_Positive_Vector (1..3);
        Dilation1: Tiny_Positive_Vector (1..3);
        Padding1: Padding_Type(1..3);
    begin
        if Stride'Length = 0 then
            Stride1 := (1, 1, 1);
        else
            Stride1 := Stride;
        end if;
        if Dilation'Length = 0 then
            Dilation1 := (1, 1, 1);
        else
            Dilation1 := Dilation;
        end if;
        if Padding'Length = 0 then
            Padding1 := Auto_Padding_3 ((Input'Length(1), Input'Length(2), Input'Length(3)), Size, Stride1, Dilation1);
        else
            Padding1 := Padding;
        end if;
        Sample_Core (Input, Index, Size, Border, Padding1, Stride1, Dilation1, Output);
    end Sample;

    procedure Sample
       (Input            : Real_Tensor_4D; Index : Natural_Tensor_4D;
        Size : Tiny_Positive_Vector; Border : Border_Modes := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Output: out Real_Tensor_4D)
    is
        --  Input_Shape: Positive_Vector := Shape_Of(Input);
        --  Kernel_Size: Real := Real(Size(1) * Size(2) * Size(3) * Size(4));
        --  Stride1: Positive_Vector := Selection(Stride'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Stride);
        --  Dilation1: Positive_Vector := Selection(Dilation'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Dilation);
        --  Padding1: Padding_Type := Selection(Padding'Length = 0, Auto_Padding (Input_Shape, Size, Stride1, Dilation1), Padding);
        --  Output_Shape: Positive_Vector := Downscaled_Output_Shape(Input_Shape, Size, Padding1, Stride1, Dilation1);
        --  Output: Real_Tensor_4D (1..Output_Shape(1), 1..Output_Shape(2), 1..Output_Shape(3), 1..Output_Shape(4));
        Stride1: Tiny_Positive_Vector (1..4);
        Dilation1: Tiny_Positive_Vector (1..4);
        Padding1: Padding_Type(1..4);
    begin
        if Stride'Length = 0 then
            Stride1 := (1, 1, 1, 1);
        else
            Stride1 := Stride;
        end if;
        if Dilation'Length = 0 then
            Dilation1 := (1, 1, 1, 1);
        else
            Dilation1 := Dilation;
        end if;
        if Padding'Length = 0 then
            Padding1 := Auto_Padding_4 ((Input'Length(1), Input'Length(2), Input'Length(3), Input'Length(4)), Size, Stride1, Dilation1);
        else
            Padding1 := Padding;
        end if;
        Sample_Core (Input, Index, Size, Border, Padding1, Stride1, Dilation1, Output);
    end Sample;

    procedure Desample
       (Input            : Real_Tensor_3D; Index : Natural_Tensor_3D;
        Size : Tiny_Positive_Vector; Border : Border_Modes := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        --  Output_Shape     : Positive_Vector := Empty_Positive_Vector;
        Output: out Real_Tensor_3D)
    is
        --  Input_Shape: Positive_Vector := Shape_Of(Input);
        --  Stride1: Positive_Vector := Selection(Stride'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Stride);
        --  Dilation1: Positive_Vector := Selection(Dilation'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Dilation);
        --  Padding1: Padding_Type := Selection(Padding'Length = 0, Auto_Padding (Input_Shape, Size, Stride1, Dilation1), Padding);
        --  Output_Shape1: Positive_Vector := Selection(Output_Shape'Length = 0, Upscaled_Output_Shape(Input_Shape, Size, Padding1, Stride1, Dilation1), Output_Shape);
        --  Output: Real_Tensor_3D (1..Output_Shape1(1), 1..Output_Shape1(2), 1..Output_Shape1(3));
        Stride1: Tiny_Positive_Vector (1..3);
        Dilation1: Tiny_Positive_Vector (1..3);
        Padding1: Padding_Type(1..3);
    begin
        if Stride'Length = 0 then
            Stride1 := (1, 1, 1);
        else
            Stride1 := Stride;
        end if;
        if Dilation'Length = 0 then
            Dilation1 := (1, 1, 1);
        else
            Dilation1 := Dilation;
        end if;
        if Padding'Length = 0 then
            Padding1 := Auto_Padding_3 ((Output'Length(1), Output'Length(2), Output'Length(3)), Size, Stride1, Dilation1);
        else
            Padding1 := Padding;
        end if;
        Desample_Core (Input, Index, Size, Border, Padding1, Stride1, Dilation1, Output);
    end Desample;

    procedure Desample
       (Input            : Real_Tensor_4D; Index : Natural_Tensor_4D;
        Size : Tiny_Positive_Vector; Border : Border_Modes := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        --  Output_Shape     : Positive_Vector := Empty_Positive_Vector;
        Output: out Real_Tensor_4D)
    is
        --  Input_Shape: Positive_Vector := Shape_Of(Input);
        --  Kernel_Size: Real := Real(Size(1) * Size(2) * Size(3) * Size(4));
        --  Stride1: Positive_Vector := Selection(Stride'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Stride);
        --  Dilation1: Positive_Vector := Selection(Dilation'Length = 0, Positive_Vector'(Input_Shape'Range => 1), Dilation);
        --  Padding1: Padding_Type := Selection(Padding'Length = 0, Auto_Padding (Input_Shape, Size, Stride1, Dilation1), Padding);
        --  Output_Shape1: Positive_Vector := Selection(Output_Shape'Length = 0, Upscaled_Output_Shape(Input_Shape, Size, Padding1, Stride1, Dilation1), Output_Shape);
        --  Output: Real_Tensor_4D (1..Output_Shape1(1), 1..Output_Shape1(2), 1..Output_Shape1(3), 1..Output_Shape1(4));
        Stride1: Tiny_Positive_Vector (1..4);
        Dilation1: Tiny_Positive_Vector (1..4);
        Padding1: Padding_Type(1..4);
    begin
        if Stride'Length = 0 then
            Stride1 := (1, 1, 1, 1);
        else
            Stride1 := Stride;
        end if;
        if Dilation'Length = 0 then
            Dilation1 := (1, 1, 1, 1);
        else
            Dilation1 := Dilation;
        end if;
        if Padding'Length = 0 then
            Padding1 := Auto_Padding_4 ((Output'Length(1), Output'Length(2), Output'Length(3), Output'Length(4)), Size, Stride1, Dilation1);
        else
            Padding1 := Padding;
        end if;
        Desample_Core (Input, Index, Size, Border, Padding1, Stride1, Dilation1, Output);
    end Desample;

    procedure Nearest_Downsample
       (Input : Real_Tensor_4D; Factor : Tiny_Positive_Vector; Output: out Real_Tensor_4D)
    is
        use Positive_Arrays;
        Dims: constant Positive := 2 + Factor'Length;
    begin
        Box(Input, Size => (1..Dims => 1), Stride => (1, 1) & Factor, Padding => (1..Dims => (0, 0)), Dilation => (1..Dims => 1),
            Output => Output);
    end Nearest_Downsample;

    procedure Area_Downsample
       (Input : Real_Tensor_4D; Factor : Tiny_Positive_Vector; Output: out Real_Tensor_4D)
    is
        use Positive_Arrays;
        Dims: constant Positive := 2 + Factor'Length;
    begin
        Box(Input, Size => (1, 1) & Factor, Stride => (1, 1) & Factor, Padding => (1..Dims => (0, 0)), Dilation => (1..Dims => 1), Normalize => true,
            Output => Output);
    end Area_Downsample;

    procedure Nearest_Upsample
       (Input : Real_Tensor_4D; Factor : Tiny_Positive_Vector; Output: out Real_Tensor_4D)
    is
        use Positive_Arrays;
        Dims: constant Positive := 2 + Factor'Length;
    begin
        Debox(Input, Size => (1, 1) & Factor, Stride => (1, 1) & Factor, Padding => (1..Dims => (0, 0)), Dilation => (1..Dims => 1),
            Output => Output);
    end Nearest_Upsample;

    function Upsample_Weights_1D (Factor: Positive; Symmetric: Boolean) return Real_Vector is
        Weights: Real_Vector(1..Factor*2);
    begin
        if Symmetric then
            for I in 0..Factor-1 loop
                Weights(Factor+I) := 1.0 - (Real(I) + 0.5) / Real(Factor);
                Weights(Factor-I+1) := Weights(Factor+I);
            end loop;
        else
            declare
                J: Positive := 1;
            begin
                for I in -Factor+1..Factor loop
                    Weights(J) := 1.0 - Real(Abs(I)) / Real(Factor);
                    J := J + 1;
                end loop;
            end;
        end if;
        return Weights;
    end Upsample_Weights_1D;

    function Upsample_Weights_2D (Factor: Tiny_Positive_Vector; Symmetric: Boolean) return Real_Matrix is
        W1: Real_Vector := Upsample_Weights_1D(Factor(1), Symmetric);
        W2: Real_Vector := Upsample_Weights_1D(Factor(2), Symmetric);
    begin
        return Outer_Product(W1, W2);
    end Upsample_Weights_2D;

    function Upsample_Weights_4D (Factor: Tiny_Positive_Vector; Symmetric: Boolean) return Real_Tensor_4D is
        W: Real_Matrix := Upsample_Weights_2D(Factor, Symmetric);
        Shape: Tiny_Positive_Vector := Shape_Of(W);
        Output: Real_Tensor_4D(1..1, 1..1, 1..Shape(1), 1..Shape(2));
    begin
        Reshape(W, Output);
        return Output;
    end Upsample_Weights_4D;

    procedure Multilinear_Upsample
       (Input  : Real_Tensor_4D; Factor : Tiny_Positive_Vector;
        Method : Interpolation_Method :=
           Interpolation_Method_Symmetric;
        Border : Border_Modes := Border_Mode_Replicate;
        Output: out Real_Tensor_4D)
    is
        use Positive_Arrays;
        --  Output_Shape: Positive_Vector := (Input'Length(3) * Factor(1), Input'Length(4) * Factor(2));
        Rank: constant Positive := Factor'Length;
        N: constant Positive := Input'Length(1);
        Channels: constant Positive := Input'Length(2);
    begin
        if Method = Interpolation_Method_Aligned then
            -- Interpolation_Mode_Bilinear
            Debox(Input, Size => (1, 1) & Factor, Stride => (1, 1) & Factor, Padding => (1..Rank+2 => (0, 0)), Dilation => (1..Rank+2 => 1),
                Output => Output);
            return;
        end if;
        declare
            --  Filter: Real_Tensor_4D := Reshape(Upsample_Weights_2D(Factor, Method = Interpolation_Method_Symmetric), (1, 1, 0, 0));
            Filter: Real_Tensor_4D := Upsample_Weights_4D(Factor, Method = Interpolation_Method_Symmetric);
            Bias: Real_Matrix := Scalar_2D_0;
        begin
            if Method = Interpolation_Method_Symmetric then
                if Border = Border_Mode_Replicate then
                    -- Interpolation_Mode_Bilinear
                    declare
                        Padding: Padding_Type := ((0, 0), (0, 0), (1, 1), (1, 1));
                        Padded_Shape: Tiny_Positive_Vector := Pad_Shape(Shape_Of(Input), Padding);
                        Padded: Real_Tensor_4D(1..Padded_Shape(1), 1..Padded_Shape(2), 1..Padded_Shape(3), 1..Padded_Shape(4));
                    begin
                        Pad(Input, Padding => Padding, Border => Border, Output => Padded);
                        Deconv(
                            Padded,
                            Filter, Bias, Stride => Factor,
                            Padding => ((Factor(1)-1, Factor(1)-1), (Factor(2)-1, Factor(2)-1)), Dilation => (1, 1, 1, 1),
                            Border => Border_Mode_Constant, Groups => Channels,
                            Output => Output);
                    end;
                else
                    Deconv(Input, Filter, Bias, Stride => Factor,
                        Padding => ((Factor(1)-1, Factor(1)-1), (Factor(2)-1, Factor(2)-1)), Dilation => (1, 1, 1, 1),
                        Border => Border_Mode_Constant, Groups => Channels,
                        Output => Output);
                end if;
            else
                if Border = Border_Mode_Replicate then
                    declare
                        Padding: Padding_Type := ((0, 0), (0, 0), (1, 0), (1, 0));
                        Padded_Shape: Tiny_Positive_Vector := Pad_Shape(Shape_Of(Input), Padding);
                        Padded: Real_Tensor_4D(1..Padded_Shape(1), 1..Padded_Shape(2), 1..Padded_Shape(3), 1..Padded_Shape(4));
                    begin
                        Pad(Input, Padding => Padding, Border => Border, Output => Padded);
                        Deconv(
                            Padded,
                            Filter, Bias, Stride => Factor,
                            Padding => ((Factor(1), Factor(1)), (Factor(2), Factor(2))), Dilation => (1, 1, 1, 1),
                            Border => Border_Mode_Constant, Groups => Channels,
                            Output => Output);
                    end;
                else
                    Deconv(Input, Filter, Bias, Stride => Factor,
                        Padding => ((Factor(1)/2, Factor(1)/2), (Factor(2)/2, Factor(2)/2)), Dilation => (1, 1, 1, 1),
                        Border => Border_Mode_Constant, Groups => Channels, Output => Output);
                end if;
            end if;
        end;
    end Multilinear_Upsample;

    procedure Linear_Upsample2x_Symmetric
       (Input : Real_Tensor_3D; Border : Border_Modes; Output: out Real_Tensor_3D)
    is
        Channels: constant Integer := Input'Length (2);
        Filter: Real_Tensor_3D(1..Channels, 1..1, 1..4) := (others => (1 => (0.25, 0.75, 0.75, 0.25)));
    begin
        Deconv(Input, Filter, Stride => (1 => 2), Padding => (1 => (1, 1)), Dilation => (1 => 1), Border => Border, Groups => Channels,
            Output => Output);
    end Linear_Upsample2x_Symmetric;

    procedure Linear_Upsample2x_Asymmetric
       (Input : Real_Tensor_3D; Border : Border_Modes; Output: out Real_Tensor_3D)
    is
        Channels: constant Integer := Input'Length (2);
        Filter: Real_Tensor_3D(1..Channels, 1..1, 1..3) := (others => (1 => (0.5, 1.0, 0.5)));
    begin
        Deconv(Input, Filter, Stride => (1 => 2), Padding => (1 => (0, 1)), Dilation => (1 => 1), Border => Border, Groups => Channels,
            Output => Output);
    end Linear_Upsample2x_Asymmetric;

    procedure Bilinear_Upsample2x_Symmetric
       (Input : Real_Tensor_4D; Border : Border_Modes; Output: out Real_Tensor_4D)
    is
        Channels: constant Integer := Input'Length (2);
        Filter: Real_Tensor_4D(1..Channels, 1..1, 1..4, 1..4) := (others => (others => (
            (0.0625, 0.1875, 0.1875, 0.0625), -- Weights
            (0.1875, 0.5625, 0.5625, 0.1875),
            (0.1875, 0.5625, 0.5625, 0.1875),
            (0.0625, 0.1875, 0.1875, 0.0625)
        )));
    begin
        Deconv(Input, Filter, Stride => (2, 2), Padding => ((1, 1), (1, 1)), Dilation => (1, 1), Border => Border, Groups => Channels,
            Output => Output);
    end Bilinear_Upsample2x_Symmetric;

    procedure Bilinear_Upsample2x_Asymmetric
       (Input : Real_Tensor_4D; Border : Border_Modes; Output: out Real_Tensor_4D)
    is
        Channels: constant Integer := Input'Length (2);
        Filter: Real_Tensor_4D(1..Channels, 1..1, 1..3, 1..3) := (others => (others => (
            (0.25, 0.5, 0.25), -- Weights
            (0.50, 1.0, 0.50),
            (0.25, 0.5, 0.25)
        )));
    begin
        Deconv(Input, Filter, Stride => (2, 2), Padding => ((0, 1), (0, 1)), Dilation => (1, 1), Border => Border, Groups => Channels,
            Output => Output);
    end Bilinear_Upsample2x_Asymmetric;

    function Reduce_Shape (X: Tiny_Positive_Vector; Axes: Tiny_Positive_Vector) return Tiny_Positive_Vector is
        Reduced_Shape: Tiny_Positive_Vector := X;
    begin
        for I in Axes'Range loop
            Reduced_Shape(Axes(I)) := 1;
        end loop;
        return Reduced_Shape;
    end Reduce_Shape;

    procedure Sum_Reduce (Input: Real_Vector; Normalize : Boolean := False; Output: out Real_Vector) is
    begin
        Output := (others => 0.0);
        Reduce(Add_Function, Input, Output => Output);
        if Normalize then
            For_Each(Div_Function, Output, Real(Input'Length), Output);
        end if;
    end Sum_Reduce;

    procedure Sum_Reduce (Input : Real_Matrix; Axes: Tiny_Positive_Vector; Normalize : Boolean := False; Output: out Real_Matrix) is
    begin
        Output := (others => (others => 0.0));
        Reduce(Add_Function, Input, Axes, Output => Output);
        if Normalize then
            declare
                Input_Shape: Tiny_Positive_Vector_2 := Shape_Of(Input);
                P: Positive := 1;
            begin
                for I in Axes'Range loop
                    P := P * Input_Shape(Axes(I));
                end loop;
                For_Each(Div_Function, Output, Real(P), Output);
            end;
        end if;
    end Sum_Reduce;

    procedure Sum_Reduce (Input     : Real_Tensor_3D; Axes : Tiny_Positive_Vector; Normalize : Boolean := False; Output: out Real_Tensor_3D) is
    begin
        Output := (others => (others => (others => 0.0)));
        Reduce(Add_Function, Input, Axes, Output => Output);
        if Normalize then
            declare
                Input_Shape: Tiny_Positive_Vector_3 := Shape_Of(Input);
                P: Positive := 1;
            begin
                for I in Axes'Range loop
                    P := P * Input_Shape(Axes(I));
                end loop;
                For_Each(Div_Function, Output, Real(P), Output);
            end;
        end if;
    end Sum_Reduce;

    procedure Sum_Reduce (Input     : Real_Tensor_4D; Axes : Tiny_Positive_Vector; Normalize : Boolean := False; Output: out Real_Tensor_4D) is
    begin
        Output := (others => (others => (others => (others => 0.0))));
        Reduce(Add_Function, Input, Axes, Output => Output);
        if Normalize then
            declare
                Input_Shape: Tiny_Positive_Vector_4 := Shape_Of(Input);
                P: Positive := 1;
            begin
                for I in Axes'Range loop
                    P := P * Input_Shape(Axes(I));
                end loop;
                For_Each(Div_Function, Output, Real(P), Output);
            end;
        end if;
    end Sum_Reduce;

    procedure Max_Reduce (Input : Real_Vector; Output: out Real_Vector) is
    begin
        Output := (others => Real'Safe_First);
        Reduce(Max_Function, Input, Output => Output);
    end Max_Reduce;

    procedure Max_Reduce (Input : Real_Matrix; Axes : Tiny_Positive_Vector; Output: out Real_Matrix) is
    begin
        Output := (others => (others => Real'Safe_First));
        Reduce(Max_Function, Input, Axes, Output => Output);
    end Max_Reduce;

    procedure Max_Reduce (Input : Real_Tensor_3D; Axes : Tiny_Positive_Vector; Output: out Real_Tensor_3D) is
    begin
        Output := (others => (others => (others => Real'Safe_First)));
        Reduce(Max_Function, Input, Axes, Output => Output);
    end Max_Reduce;

    procedure Max_Reduce (Input : Real_Tensor_4D; Axes : Tiny_Positive_Vector; Output: out Real_Tensor_4D) is
    begin
        Output := (others => (others => (others => (others => Real'Safe_First))));
        Reduce(Max_Function, Input, Axes, Output => Output);
    end Max_Reduce;

    procedure Min_Reduce (Input : Real_Vector; Output: out Real_Vector) is
    begin
        Output := (others => Real'Safe_Last);
        Reduce(Min_Function, Input, Output => Output);
    end Min_Reduce;

    procedure Min_Reduce (Input : Real_Matrix; Axes : Tiny_Positive_Vector; Output: out Real_Matrix) is
    begin
        Output := (others => (others => Real'Safe_Last));
        Reduce(Min_Function, Input, Axes, Output => Output);
    end Min_Reduce;

    procedure Min_Reduce (Input : Real_Tensor_3D; Axes : Tiny_Positive_Vector; Output: out Real_Tensor_3D) is
    begin
        Output := (others => (others => (others => Real'Safe_Last)));
        Reduce(Min_Function, Input, Axes, Output => Output);
    end Min_Reduce;

    procedure Min_Reduce (Input : Real_Tensor_4D; Axes : Tiny_Positive_Vector; Output: out Real_Tensor_4D) is
    begin
        Output := (others => (others => (others => (others => Real'Safe_Last))));
        Reduce(Min_Function, Input, Axes, Output => Output);
    end Min_Reduce;

    procedure Argmax_Reduce (Input : Real_Vector; Output: out Natural_Vector) is
    begin
        Output := (others => 0);
        Arg_Reduce (Gt_Function, Input, Output);
    end Argmax_Reduce;

    procedure Argmax_Reduce
       (Input : Real_Matrix; Axes : Tiny_Positive_Vector; Output: out Natural_Matrix)
    is
    begin
        Output := (others => (others => 0));
        Arg_Reduce (Gt_Function, Input, Axes, Output);
    end Argmax_Reduce;

    procedure Argmax_Reduce
       (Input : Real_Tensor_3D; Axes : Tiny_Positive_Vector; Output: out Natural_Tensor_3D)
    is
    begin
        Output := (others => (others => (others => 0)));
        Arg_Reduce (Gt_Function, Input, Axes, Output);
    end Argmax_Reduce;

    procedure Argmax_Reduce
       (Input : Real_Tensor_4D; Axes : Tiny_Positive_Vector; Output: out Natural_Tensor_4D)
    is
    begin
        Output := (others => (others => (others => (others => 0))));
        Arg_Reduce (Gt_Function, Input, Axes, Output);
    end Argmax_Reduce;

    procedure Argmin_Reduce (Input : Real_Vector; Output: out Natural_Vector) is
        --  Output : Natural_Vector (Input'First .. Input'First);
    begin
        Output := (others => 0);
        Arg_Reduce (Lt_Function, Input, Output);
    end Argmin_Reduce;

    procedure Argmin_Reduce
       (Input : Real_Matrix; Axes : Tiny_Positive_Vector; Output: out Natural_Matrix)
    is
    begin
        Output := (others => (others => 0));
        Arg_Reduce (Lt_Function, Input, Axes, Output);
    end Argmin_Reduce;

    procedure Argmin_Reduce
       (Input : Real_Tensor_3D; Axes : Tiny_Positive_Vector; Output: out Natural_Tensor_3D)
    is
    begin
        Output := (others => (others => (others => 0)));
        Arg_Reduce (Lt_Function, Input, Axes, Output);
    end Argmin_Reduce;

    procedure Argmin_Reduce
       (Input : Real_Tensor_4D; Axes : Tiny_Positive_Vector; Output: out Natural_Tensor_4D)
    is
    begin
        Output := (others => (others => (others => (others => 0))));
        Arg_Reduce (Lt_Function, Input, Axes, Output);
    end Argmin_Reduce;

    procedure Mean_Reduce (Input : Real_Vector; Output: out Real_Vector) is
    begin
        Sum_Reduce (Input, Normalize => true, Output => Output);
    end Mean_Reduce;
    procedure Mean_Reduce
       (Input : Real_Matrix; Axes : Tiny_Positive_Vector; Output: out Real_Matrix) is
    begin
        Sum_Reduce (Input, Axes => Axes, Normalize => true, Output => Output);
    end Mean_Reduce;
    procedure Mean_Reduce
       (Input : Real_Tensor_3D; Axes : Tiny_Positive_Vector; Output: out Real_Tensor_3D) is
    begin
        Sum_Reduce (Input, Axes => Axes, Normalize => true, Output => Output);
    end Mean_Reduce;
    procedure Mean_Reduce
       (Input : Real_Tensor_4D; Axes : Tiny_Positive_Vector; Output: out Real_Tensor_4D) is
    begin
        Sum_Reduce (Input, Axes => Axes, Normalize => true, Output => Output);
    end Mean_Reduce;

    function Reshape_Shape(Input_Shape: Tiny_Positive_Vector; Shape: Integer_Vector; Axis_Start: Positive := 1; Axis_Count: Integer := -1)
        return Tiny_Positive_Vector
    is
        Calculated_Axis: Natural := 0;
        Input_Product, Product: Positive := 1;
        Output_Shape: Tiny_Positive_Vector(Shape'Range);
        Axis_End: Positive := Shape'Last;
    begin
        if Axis_Count /= -1 then
            Axis_End := Axis_Start + Axis_Count - 1;
        end if;
        for I in Input_Shape'Range loop
            Input_Product := Input_Product * Input_Shape(I);
        end loop;
        for I in Shape'Range loop
            if Shape(I) = -1 then
                Calculated_Axis := I;
            else
                if Shape(I) = 0 then
                    Output_Shape(I) := Input_Shape(Axis_Start + I - Shape'First);
                else
                    Output_Shape(I) := Shape(I);
                end if;
                Product := Product * Output_Shape(I);
            end if;
        end loop;
        if Calculated_Axis /= 0 then
            Output_Shape(Calculated_Axis) := Input_Product / Product;
        end if;
        return Output_Shape;
    end Reshape_Shape;

    function Remove_Axes (Input_Shape, Axes: Tiny_Positive_Vector) return Tiny_Positive_Vector is
        I1: Positive := Input_Shape'First;
        Temp_Shape: Tiny_Natural_Vector(Input_Shape'Range);
        Output_Shape: Tiny_Positive_Vector(Input_Shape'First..Input_Shape'Last-Axes'Length);
    begin
        for I in Input_Shape'Range loop
            Temp_Shape(I) := Input_Shape(I);
        end loop;
        for I in Axes'Range loop
            Temp_Shape(Axes(I)) := 0;
        end loop;
        for I in Temp_Shape'Range loop
            if Temp_Shape(I) /= 0 then
                Output_Shape(I1) := Temp_Shape(I);
                I1 := I1 + 1;
            end if;
        end loop;
        return Output_Shape;
    end Remove_Axes;

    function Add_Axes (Input_Shape, Axes: Tiny_Positive_Vector) return Tiny_Positive_Vector is
        I1: Positive := Input_Shape'First;
        Output_Shape: Tiny_Positive_Vector(Input_Shape'First..Input_Shape'Last+Axes'Length);
        Temp_Shape: Tiny_Natural_Vector(Output_Shape'Range) := (others => 0);
    begin
        for I in Axes'Range loop
            Temp_Shape(Axes(I)) := 1;
        end loop;
        for I in Output_Shape'Range loop
            if Temp_Shape(I) = 0 then
                Output_Shape(I) := Input_Shape(I1);
                I1 := I1 + 1;
            else
                Output_Shape(I) := Temp_Shape(I);
            end if;
        end loop;
        return Output_Shape;
    end Add_Axes;

    --  function Split (Value: Real_Tensor_4D; Axis: Positive; Ratios: Positive_Vector) return Real_Tensor_4D_List is
    --      Shape: Positive_Vector := Shape_Of(Value);
    --      Shapes: array(Ratios'Range) of Positive_Vector(1..4);
    --      R: Natural := 0;
    --      S: Positive := Shape(Axis);
    --      Mu: Positive;
    --  begin
    --      for I in Ratios'Range loop
    --          Shapes(I) := Shape;
    --          R := R + Ratios(I);
    --      end loop;
    --      Mu := S / R;
    --      for I in Ratios'Range loop
    --          Shapes(I)(Axis) := Ratios(I) * Mu;
    --      end loop;
    --      declare
    --          Values: Real_Tensor_4D_List(Ratios'Range);
    --          S: Natural_Vector := (1..4 => 0);
    --      begin
    --          for N in Ratios'Range loop
    --              Values(N) := new Real_Tensor_4D(1..Shapes(N)(1), 1..Shapes(N)(2), 1..Shapes(N)(3), 1..Shapes(N)(4));
    --              for I in Values(N)'Range(1) loop
    --                  for J in Values(N)'Range(2) loop
    --                      for K in Values(N)'Range(3) loop
    --                          for L in Values(N)'Range(4) loop
    --                              Values(N) (I, J, K, L) := Value (I+S(1), J+S(2), K+S(3), L+S(4));
    --                          end loop;
    --                      end loop;
    --                  end loop;
    --              end loop;
    --              S(Axis) := S(Axis) + Shapes(N)(Axis);
    --          end loop;
    --          return Values;
    --      end;
    --  end Split;
    
    --  procedure Split (Value: Real_Tensor_4D; Axis: Positive; Ratios: Positive_Vector; Values: in out Real_Tensor_4D_List) is
    --      Shape: Positive_Vector := Shape_Of(Value);
    --      R: Natural := 0;
    --      Mu: Positive;
    --      S: Natural_Vector := (1..4 => 0);
    --  begin
    --      for I in Ratios'Range loop
    --          R := R + Ratios(I);
    --      end loop;
    --      Mu := Shape(Axis) / R;
    --      for N in Ratios'Range loop
    --          for I in Values(N)'Range(1) loop
    --              for J in Values(N)'Range(2) loop
    --                  for K in Values(N)'Range(3) loop
    --                      for L in Values(N)'Range(4) loop
    --                          Values(N) (I, J, K, L) := Value (I+S(1), J+S(2), K+S(3), L+S(4));
    --                      end loop;
    --                  end loop;
    --              end loop;
    --          end loop;
    --          S(Axis) := S(Axis) + Ratios(N) * Mu;
    --      end loop;
    --  end Split;
    
    --  function Concat (Values: Real_Tensor_4D_List; Axis: Positive) return Real_Tensor_4D is
    --      Shapes: array(Values'Range) of Positive_Vector(1..4);
    --      Shape: Natural_Vector := (1..4 => 0);
    --  begin
    --      for I in Values'Range loop
    --          Shapes(I) := Shape_Of(Values(I).all);
    --          for J in Shapes(I)'Range loop
    --              if Axis = J then
    --                  Shape(J) := Shape(J) + Shapes(I)(J);
    --              else
    --                  Shape(J) := Shapes(I)(J);
    --              end if;
    --          end loop;
    --      end loop;
    --      declare
    --          Value: Real_Tensor_4D(1..Shape(1), 1..Shape(2), 1..Shape(3), 1..Shape(4));
    --          S: Natural_Vector := (1..4 => 0);
    --      begin
    --          for N in Values'Range loop
    --              for I in Values(N)'Range(1) loop
    --                  for J in Values(N)'Range(2) loop
    --                      for K in Values(N)'Range(3) loop
    --                          for L in Values(N)'Range(4) loop
    --                              Value (I+S(1), J+S(2), K+S(3), L+S(4)) := Values (N) (I, J, K, L);
    --                          end loop;
    --                      end loop;
    --                  end loop;
    --              end loop;
    --              S(Axis) := S(Axis) + Shapes(N)(Axis);
    --          end loop;
    --          return Value;
    --      end;
    --  end Concat;

    function Slice_Shape (Input_Shape: Tiny_Positive_Vector; Axes: Tiny_Positive_Vector; Slice_Begin, Slice_End: Integer_Vector; Stride: Integer_Vector)
        return Tiny_Positive_Vector is
        Output_Shape: Tiny_Positive_Vector := Input_Shape;
    begin
        for I in Axes'Range loop
            Output_Shape(Axes(I)) := (Slice_End(I) - Slice_Begin(I) + 1) / Stride(I);
        end loop;
        return Output_Shape;
    end Slice_Shape;

    function Pad_Shape (Input_Shape: Tiny_Positive_Vector; Padding: Padding_Type) return Tiny_Positive_Vector is
        Output_Shape: Tiny_Positive_Vector := Input_Shape;
    begin
        for I in Padding'Range loop
            Output_Shape(I) := Output_Shape(I) + Padding(I)(1) + Padding(I)(2);
        end loop;
        return Output_Shape;
    end Pad_Shape;

    function Tile_Shape (Input_Shape: Tiny_Positive_Vector; Repeats: Tiny_Positive_Vector) return Tiny_Positive_Vector is
        Output_Shape: Tiny_Positive_Vector := Input_Shape;
    begin
        for I in Repeats'Range loop
            Output_Shape(I) := Output_Shape(I) * Repeats(I);
        end loop;
        return Output_Shape;
    end Tile_Shape;

    function Gather_Shape (Input_Shape: Tiny_Positive_Vector; Indices: Positive_Matrix; Axis: Positive := 1) return Tiny_Positive_Vector is
        Output_Shape: Tiny_Positive_Vector := (Input_Shape(1), Input_Shape(2), Input_Shape(3), 1);
    begin
        for I in reverse Axis+1..3 loop
            Output_Shape(Axis+I-1) := Output_Shape(I);
        end loop;
        Output_Shape(Axis) := Indices'Length(1);
        Output_Shape(Axis+1) := Indices'Length(2);
        return Output_Shape;
    end Gather_Shape;

    function Roi_Pool_Shape (Input_Shape, Rois_Shape, Output_Size: Tiny_Positive_Vector) return Tiny_Positive_Vector is
        Output_Shape: Tiny_Positive_Vector := (Rois_Shape (1), Input_Shape (1), Output_Size(1), Output_Size(2));
    begin
        return Output_Shape;
    end Roi_Pool_Shape;

    procedure Avg_Roi_Pool (Input: Real_Tensor_4D; Rois: Real_Matrix; Batch_Index: Integer_Matrix; Output: out Real_Tensor_4D) is
    begin
        -- FIXME
        null;
    end Avg_Roi_Pool;
   
    procedure Max_Roi_Pool (Input: Real_Tensor_4D; Rois: Real_Matrix; Batch_Index: Integer_Matrix; Output: out Real_Tensor_4D) is
    begin
        -- FIXME
        null;
    end Max_Roi_Pool;

    procedure Roi_Resample (Input: Real_Tensor_4D; Rois: Real_Matrix; Batch_Index: Integer_Matrix;
      Method: Interpolation_Method := Interpolation_Method_Symmetric; Output: out Real_Tensor_4D) is
    begin
        -- FIXME
        null;
    end Roi_Resample;

    procedure Avg_Roi_Align (Input: Real_Tensor_4D; Rois: Real_Matrix; Batch_Index: Integer_Matrix; Sampling_Rate: Tiny_Positive_Vector_4;
      Resize_Method: Interpolation_Method := Interpolation_Method_Symmetric; Output: out Real_Tensor_4D) is
        Output_Size: Tiny_Positive_Vector_4 := (Output'Length(1), Output'Length(2), Output'Length(3), Output'Length(4));
        Size: Tiny_Positive_Vector_4;
    begin
        for I in Output_Size'Range loop
            Size(I) := Output_Size(I) * Sampling_Rate(I);
        end loop;
        declare
            Resized: Real_Tensor_4D (1..Size(1), 1..Size(2), 1..Size(3), 1..Size(4));
        begin
            Roi_Resample(Input, Rois, Batch_Index, Method => Resize_Method, Output => Resized);
            Avg_Pool(Resized, Size => Sampling_Rate, Stride => Sampling_Rate, Output => Output);
        end;
    end Avg_Roi_Align;
   
    procedure Max_Roi_Align (Input: Real_Tensor_4D; Rois: Real_Matrix; Batch_Index: Integer_Matrix; Sampling_Rate: Tiny_Positive_Vector_4;
      Resize_Method: Interpolation_Method := Interpolation_Method_Symmetric; Output: out Real_Tensor_4D) is
        Output_Size: Tiny_Positive_Vector_4 := (Output'Length(1), Output'Length(2), Output'Length(3), Output'Length(4));
        Size: Tiny_Positive_Vector_4;
    begin
        for I in Output_Size'Range loop
            Size(I) := Output_Size(I) * Sampling_Rate(I);
        end loop;
        declare
            Resized: Real_Tensor_4D (1..Size(1), 1..Size(2), 1..Size(3), 1..Size(4));
        begin
            Roi_Resample(Input, Rois, Batch_Index, Method => Resize_Method, Output => Resized);
            Max_Pool(Resized, Size => Sampling_Rate, Stride => Sampling_Rate, Output => Output);
        end;
    end Max_Roi_Align;

    procedure Sigmoid (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Logistic_Function, X, Y);
    end Sigmoid;
    procedure Sigmoid (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Logistic_Function, X, Y);
    end Sigmoid;
    procedure Sigmoid (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Logistic_Function, X, Y);
    end Sigmoid;
    procedure Sigmoid (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Logistic_Function, X, Y);
    end Sigmoid;

    procedure Relu (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Relu_Function, X, Y);
    end Relu;
    procedure Relu (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Relu_Function, X, Y);
    end Relu;
    procedure Relu (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Relu_Function, X, Y);
    end Relu;
    procedure Relu (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Relu_Function, X, Y);
    end Relu;

    procedure Prelu (X : Real_Vector; Alpha : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Prelu_Function, X, Alpha, Y);
    end Prelu;
    procedure Prelu (X : Real_Matrix; Alpha : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Prelu_Function, X, Alpha, Y);
    end Prelu;
    procedure Prelu
       (X : Real_Tensor_3D; Alpha : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Prelu_Function, X, Alpha, Y);
    end Prelu;
    procedure Prelu
       (X : Real_Tensor_4D; Alpha : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Prelu_Function, X, Alpha, Y);
    end Prelu;

    procedure Leaky_Relu (X : Real_Vector; Alpha : Real; Y: out Real_Vector) is
    begin
        For_Each (Leaky_Relu_Function, X, Alpha, Y);
    end Leaky_Relu;
    procedure Leaky_Relu (X : Real_Matrix; Alpha : Real; Y: out Real_Matrix) is
    begin
        For_Each (Leaky_Relu_Function, X, Alpha, Y);
    end Leaky_Relu;
    procedure Leaky_Relu
       (X : Real_Tensor_3D; Alpha : Real; Y: out Real_Tensor_3D) is
    begin
        For_Each (Leaky_Relu_Function, X, Alpha, Y);
    end Leaky_Relu;
    procedure Leaky_Relu
       (X : Real_Tensor_4D; Alpha : Real; Y: out Real_Tensor_4D) is
    begin
        For_Each (Leaky_Relu_Function, X, Alpha, Y);
    end Leaky_Relu;

    procedure Elu (X : Real_Vector; Alpha : Real := 1.0; Y: out Real_Vector) is
    begin
        For_Each (Elu_Function, X, Alpha, Y);
    end Elu;
    procedure Elu (X : Real_Matrix; Alpha : Real := 1.0; Y: out Real_Matrix) is
    begin
        For_Each (Elu_Function, X, Alpha, Y);
    end Elu;
    procedure Elu
       (X : Real_Tensor_3D; Alpha : Real := 1.0; Y: out Real_Tensor_3D) is
    begin
        For_Each (Elu_Function, X, Alpha, Y);
    end Elu;
    procedure Elu
       (X : Real_Tensor_4D; Alpha : Real := 1.0; Y: out Real_Tensor_4D) is
    begin
        For_Each (Elu_Function, X, Alpha, Y);
    end Elu;

    procedure Selu
       (X      : Real_Vector; Alpha : Real := 1.673_263_19;
        Lambda : Real := 1.050_701_02; Y: out Real_Vector) is
    begin
        For_Each (Selu_Function, X, Alpha, Lambda, Y);
    end Selu;
    procedure Selu
       (X      : Real_Matrix; Alpha : Real := 1.673_263_19;
        Lambda : Real := 1.050_701_02; Y: out Real_Matrix) is
    begin
        For_Each (Selu_Function, X, Alpha, Lambda, Y);
    end Selu;
    procedure Selu
       (X      : Real_Tensor_3D; Alpha : Real := 1.673_263_19;
        Lambda : Real := 1.050_701_02; Y: out Real_Tensor_3D) is
    begin
        For_Each (Selu_Function, X, Alpha, Lambda, Y);
    end Selu;
    procedure Selu
       (X      : Real_Tensor_4D; Alpha : Real := 1.673_263_19;
        Lambda : Real := 1.050_701_02; Y: out Real_Tensor_4D) is
    begin
        For_Each (Selu_Function, X, Alpha, Lambda, Y);
    end Selu;

    procedure Gelu (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Gelu_Function, X, Y);
    end Gelu;
    procedure Gelu (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Gelu_Function, X, Y);
    end Gelu;
    procedure Gelu (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Gelu_Function, X, Y);
    end Gelu;
    procedure Gelu (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Gelu_Function, X, Y);
    end Gelu;

    procedure Silu (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Silu_Function, X, Y);
    end Silu;
    procedure Silu (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Silu_Function, X, Y);
    end Silu;
    procedure Silu (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Silu_Function, X, Y);
    end Silu;
    procedure Silu (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Silu_Function, X, Y);
    end Silu;

    procedure Softmax (X : Real_Vector; Y: out Real_Vector) is
        Reduced_Shape: Tiny_Positive_Vector_1 := Reduce_Shape(Shape_Of(X), (1 => 1));
        M, S: Real_Vector(1..Reduced_Shape(1));
        E: Real_Vector(X'Range);
    begin
        Max_Reduce (X, Output => M);
        --  Sub (X, M, E);
        For_Reduced (Sub_Function, X, M, E);
        Exp (E, E);
        Sum_Reduce (E, Output => S);
        --  Div (E, S, Y);
        For_Reduced (Div_Function, E, S, Y);
    end Softmax;
    procedure Softmax (X : Real_Matrix; Axes : Tiny_Positive_Vector := (1 => 2); Y: out Real_Matrix)
    is
        Reduced_Shape: Tiny_Positive_Vector_2 := Reduce_Shape(Shape_Of(X), Axes);
        M, S: Real_Matrix(1..Reduced_Shape(1), 1..Reduced_Shape(2));
        E: Real_Matrix(X'Range(1), X'Range(2));
    begin
        Max_Reduce (X, Axes, Output => M);
        --  Sub (X, M, E);
        For_Reduced (Sub_Function, X, M, E);
        Exp (E, E);
        Sum_Reduce (E, Axes, Output => S);
        --  Div (E, S, Y);
        For_Reduced (Div_Function, E, S, Y);
    end Softmax;
    procedure Softmax
       (X : Real_Tensor_3D; Axes : Tiny_Positive_Vector := (1 => 2); Y: out Real_Tensor_3D)
    is
        Reduced_Shape: Tiny_Positive_Vector_3 := Reduce_Shape(Shape_Of(X), Axes);
        M, S: Real_Tensor_3D(1..Reduced_Shape(1), 1..Reduced_Shape(2), 1..Reduced_Shape(3));
        E: Real_Tensor_3D(X'Range(1), X'Range(2), X'Range(3));
    begin
        Max_Reduce (X, Axes, Output => M);
        --  Sub (X, M, E);
        For_Reduced (Sub_Function, X, M, E);
        Exp (E, E);
        Sum_Reduce (E, Axes, Output => S);
        --  Div (E, S, Y);
        For_Reduced (Div_Function, E, S, Y);
    end Softmax;
    procedure Softmax
       (X : Real_Tensor_4D; Axes : Tiny_Positive_Vector := (1 => 2); Y: out Real_Tensor_4D)
    is
        Reduced_Shape: Tiny_Positive_Vector_4 := Reduce_Shape(Shape_Of(X), Axes);
        M, S: Real_Tensor_4D(1..Reduced_Shape(1), 1..Reduced_Shape(2), 1..Reduced_Shape(3), 1..Reduced_Shape(4));
        E: Real_Tensor_4D(X'Range(1), X'Range(2), X'Range(3), X'Range(4));
    begin
        Max_Reduce (X, Axes, Output => M);
        --  Sub (X, M, E);
        For_Reduced (Sub_Function, X, M, E);
        Exp (E, E);
        Sum_Reduce (E, Axes, Output => S);
        --  Div (E, S, Y);
        For_Reduced (Div_Function, E, S, Y);
    end Softmax;

    procedure Softplus (X : Real_Vector; Y: out Real_Vector) is
    begin
        For_Each (Softplus_Function, X, Y);
    end Softplus;
    procedure Softplus (X : Real_Matrix; Y: out Real_Matrix) is
    begin
        For_Each (Softplus_Function, X, Y);
    end Softplus;
    procedure Softplus (X : Real_Tensor_3D; Y: out Real_Tensor_3D) is
    begin
        For_Each (Softplus_Function, X, Y);
    end Softplus;
    procedure Softplus (X : Real_Tensor_4D; Y: out Real_Tensor_4D) is
    begin
        For_Each (Softplus_Function, X, Y);
    end Softplus;

    procedure Linear
       (Input: Real_Vector; Filter : Real_Matrix; Bias : Real_Vector; Output: out Real_Vector) is
    begin
        MatMult_TransposeB (Input, Filter, C => Output);
        Add (Output, Bias, Output);
    end Linear;

    procedure Linear
       (Input, Filter : Real_Matrix; Bias : Real_Matrix; Output: out Real_Matrix) is
    begin
        MatMult_TransposeB (Input, Filter, C => Output);
        Add (Output, Bias, Output);
    end Linear;

    procedure Separable_Conv
       (Input, Plane_Filter, Point_Filter : Real_Tensor_4D;
        Bias                              : Real_Matrix := Scalar_2D_0;
        Border : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Groups                            : Natural := 1;
        Output: out Real_Tensor_4D)
    is
        Shape: Tiny_Positive_Vector := Downscaled_Output_Shape(Shape_Of(Input), Size => Shape_Of(Plane_Filter), Padding => Padding, Stride => Stride, Dilation => Dilation);
        Filtered: Real_Tensor_4D(1..Shape(1), 1..Shape(2), 1..Shape(3), 1..Shape(4));
        --  Stride1: Tiny_Positive_Vector := (1, 1);
        --  Dilation1: Tiny_Positive_Vector := (1, 1);
        --  Padding1: Padding_Type := Auto_Padding (Shape_Of(Input), Shape_Of(Point_Filter), Stride1, Dilation1);
    begin
        Conv (Input, Plane_Filter, Border => Border, Padding => Padding, Stride => Stride, Dilation => Dilation, Groups => 0,
            Output => Filtered);
        Conv (Filtered, Point_Filter, Bias, Padding => Padding_Auto, Stride => Default_Stride, Dilation => Default_Dilation, Groups => Groups,
            Output => Output);
    end Separable_Conv;

    procedure Separable_Deconv
       (Input, Plane_Filter, Point_Filter : Real_Tensor_4D;
        Bias                              : Real_Matrix := Scalar_2D_0;
        Border : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        --  Output_Shape : Positive_Vector := Empty_Positive_Vector;
        Groups                            : Natural := 1;
        Output: out Real_Tensor_4D)
    is
        Stride1: Tiny_Positive_Vector := (1, 1);
        Dilation1: Tiny_Positive_Vector := (1, 1);
        Padding1: Padding_Type := Auto_Padding (Shape_Of(Input), Shape_Of(Point_Filter), Stride1, Dilation1);
        Shape: Tiny_Positive_Vector := Upscaled_Output_Shape(Shape_Of(Input), Size => Shape_Of(Point_Filter), Padding => Padding1, Stride => Stride1, Dilation => Dilation1);
        Filtered: Real_Tensor_4D(1..Shape(1), 1..Shape(2), 1..Shape(3), 1..Shape(4));
    begin
        Deconv (Input, Point_Filter, Padding => Padding1, Stride => Stride1, Dilation => Dilation1, Groups => Groups,
            Output => Filtered);
        Deconv (Filtered, Plane_Filter, Bias, Border => Border, Padding => Padding, Stride => Stride, Dilation => Dilation, Groups => 0,
               Output => Output);
    end Separable_Deconv;

    procedure Max_Pool
     (Input : Real_Tensor_4D;
      Size : Tiny_Positive_Vector;
      Border                            : Border_Modes := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
      Output: out Real_Tensor_4D) is
        --  Shape: Positive_Vector := Downscaled_Output_Shape(Shape_Of(Input), Size => Size, Padding => Padding, Stride => Stride, Dilation => Dilation);
        --  Index: Natural_Tensor_4D(1..Shape(1), 1..Shape(2), 1..Shape(3), 1..Shape(4));
        --  Index: Natural_Tensor_4D(Output'Range(1), Output'Range(2), Output'Range(3), Output'Range(4));
        Stride1: Tiny_Positive_Vector (1..4);
        Dilation1: Tiny_Positive_Vector (1..4);
        Padding1: Padding_Type(1..4);
    begin
        if Stride'Length = 0 then
            Stride1 := (1, 1, 1, 1);
        else
            Stride1 := Stride;
        end if;
        if Dilation'Length = 0 then
            Dilation1 := (1, 1, 1, 1);
        else
            Dilation1 := Dilation;
        end if;
        if Padding'Length = 0 then
            Padding1 := Auto_Padding_4 ((Input'Length(1), Input'Length(2), Input'Length(3), Input'Length(4)), Size, Stride1, Dilation1);
        else
            Padding1 := Padding;
        end if;
        --  Argmax_Pool (Input, Size => Size, Border => Border, Padding => Padding, Stride => Stride, Dilation => Dilation,
        --      Output => Index);
        --  Sample (Input, Index, Size => Size, Border => Border, Padding => Padding, Stride => Stride, Dilation => Dilation,
        --      Output => Output);
        Output := (others => (others => (others => (others => Real'Safe_First))));
        Pool (Input, Size => Size, Border => Border, Padding => Padding1, Stride => Stride1, Dilation => Dilation1,
            F => Max_Function, Output => Output);
    end Max_Pool;

    procedure Avg_Pool
     (Input : Real_Tensor_4D;
      Size : Tiny_Positive_Vector;
      Border                            : Border_Modes := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
      Output: out Real_Tensor_4D) is
    begin
        Box (Input, Size => Size, Border => Border, Padding => Padding, Stride => Stride, Dilation => Dilation, Normalize => true,
            Output => Output);
    end Avg_Pool;

    procedure Rms_Pool
     (Input : in out Real_Tensor_4D;
      Size : Tiny_Positive_Vector;
      Border                            : Border_Modes := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
      Output: out Real_Tensor_4D) is
        T: Real_Tensor_4D(Input'Range(1), Input'Range(2), Input'Range(3), Input'Range(4));
    begin
        Sqr (Input, T);
        Avg_Pool (T, Size => Size, Border => Border, Padding => Padding, Stride => Stride, Dilation => Dilation,
            Output => Output);
        Sqrt (Output, Output);
    end Rms_Pool;

    procedure Min_Pool
     (Input : Real_Tensor_4D;
      Size : Tiny_Positive_Vector;
      Border                            : Border_Modes := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
      Output: out Real_Tensor_4D) is
        Stride1: Tiny_Positive_Vector (1..4);
        Dilation1: Tiny_Positive_Vector (1..4);
        Padding1: Padding_Type(1..4);
    begin
        if Stride'Length = 0 then
            Stride1 := (1, 1, 1, 1);
        else
            Stride1 := Stride;
        end if;
        if Dilation'Length = 0 then
            Dilation1 := (1, 1, 1, 1);
        else
            Dilation1 := Dilation;
        end if;
        if Padding'Length = 0 then
            Padding1 := Auto_Padding_4 ((Input'Length(1), Input'Length(2), Input'Length(3), Input'Length(4)), Size, Stride1, Dilation1);
        else
            Padding1 := Padding;
        end if;
        Output := (others => (others => (others => (others => Real'Safe_Last))));
        Pool (Input, Size => Size, Border => Border, Padding => Padding1, Stride => Stride1, Dilation => Dilation1,
            F => Min_Function, Output => Output);
    end Min_Pool;

    procedure Local_Response_Normalization
       (Input : Real_Tensor_4D; Size : Tiny_Positive_Vector; Alpha : Real := 1.0;
        Beta  : Real := 0.5; Bias : Real := 1.0; Output: out Real_Tensor_4D)
    is
        --  Padding: Padding_Type := Auto_Padding (Shape_Of(Input), Size, Stride, Dilation);
        --  Shape: Positive_Vector := Downscaled_Output_Shape(Shape_Of(Input), Size => Size, Padding => Padding, Stride => Stride, Dilation => Dilation);
        --  Sigma: Real_Tensor_4D(1..Shape(1), 1..Shape(2), 1..Shape(3), 1..Shape(4));
        Sigma: Real_Tensor_4D(Output'Range(1), Output'Range(2), Output'Range(3), Output'Range(4)) := (others => (others => (others => (others => 0.0))));
        T: Real_Tensor_4D(Input'Range(1), Input'Range(2), Input'Range(3), Input'Range(4));
    begin
        Sqr (Input, T);
        Box (T, Size => Size, Padding => Padding_Auto, Stride => Default_Stride, Dilation => Default_Dilation, Normalize => True,
            Output => Sigma);
        Mul (Sigma, Alpha, Sigma);
        Add (Sigma, Bias, Sigma);
        Pow (Sigma, Beta, Sigma);
        Div (Input, Sigma, Output);
    end Local_Response_Normalization;

    procedure Local_Mean_Normalization (Input: Real_Tensor_4D; Size: Tiny_Positive_Vector; Output: out Real_Tensor_4D) is
        --  Stride: constant Tiny_Positive_Vector := (1, 1, 1, 1);
        --  Dilation: constant Tiny_Positive_Vector := (1, 1, 1, 1);
        --  Padding: Padding_Type := Auto_Padding (Shape_Of(Input), Size, Stride, Dilation);
        --  Shape: Positive_Vector := Downscaled_Output_Shape(Shape_Of(Input), Size => Size, Padding => Padding, Stride => Stride, Dilation => Dilation);
        --  Mean: Real_Tensor_4D(1..Shape(1), 1..Shape(2), 1..Shape(3), 1..Shape(4));
        Mean: Real_Tensor_4D(Output'Range(1), Output'Range(2), Output'Range(3), Output'Range(4)) := (others => (others => (others => (others => 0.0))));
    begin
        Box (Input, Size => Size, Padding => Padding_Auto, Stride => Default_Stride, Dilation => Default_Dilation, Normalize => true, Output => Mean);
        Sub(Input, Mean, Output);
    end Local_Mean_Normalization;

    procedure Local_Variance_Normalization (Input : Real_Tensor_4D; Size : Tiny_Positive_Vector;
      Bias : Real := 1.0; Epsilon : Real := 1.0; Output: out Real_Tensor_4D) is
        --  Stride: constant Tiny_Positive_Vector := (1, 1, 1, 1);
        --  Dilation: constant Tiny_Positive_Vector := (1, 1, 1, 1);
        --  Padding: Padding_Type := Auto_Padding (Shape_Of(Input), Size, Stride, Dilation);
        --  Shape: Positive_Vector := Downscaled_Output_Shape(Shape_Of(Input), Size => Size, Padding => Padding, Stride => Stride, Dilation => Dilation);
        --  Sigma: Real_Tensor_4D(1..Shape(1), 1..Shape(2), 1..Shape(3), 1..Shape(4));
        Sigma: Real_Tensor_4D(Output'Range(1), Output'Range(2), Output'Range(3), Output'Range(4)) := (others => (others => (others => (others => 0.0))));
    begin
        Sqr (Input, Output);
        Box (Output, Size => Size, Padding => Padding_Auto, Stride => Default_Stride, Dilation => Default_Dilation, Normalize => true, Output => Sigma);
        Sqrt (Sigma, Sigma);
        Add (Sigma, Bias, Sigma);
        Max (Sigma, Epsilon, Sigma);
        Div (Input, Sigma, Output);
    end Local_Variance_Normalization;

    procedure Local_Contrast_Normalization (Input : Real_Tensor_4D; Size : Tiny_Positive_Vector;
      Bias : Real := 1.0; Epsilon : Real := 1.0; Output: out Real_Tensor_4D) is
    begin
        Local_Mean_Normalization (Input, Size => Size, Output => Output);
        Local_Variance_Normalization (Output, Size => Size, Bias => Bias, Epsilon => Epsilon, Output => Output);
    end Local_Contrast_Normalization;

    procedure L1_Normalization (Input : Real_Tensor_4D; Axes : Tiny_Positive_Vector;
      Bias : Real := 1.0; Epsilon : Real := 1.0; Output: out Real_Tensor_4D) is
        --  Shape: Positive_Vector := Reduce_Shape(Shape_Of(Input), Axes => Axes);
        --  Sigma: Real_Tensor_4D(1..Shape(1), 1..Shape(2), 1..Shape(3), 1..Shape(4));
        Sigma: Real_Tensor_4D(Output'Range(1), Output'Range(2), Output'Range(3), Output'Range(4));
    begin
        Absval (Input, Output);
        Sum_Reduce (Output, Axes => Axes, Output => Sigma);
        Add (Sigma, Bias, Sigma);
        Max (Sigma, Epsilon, Sigma);
        --  Div (Input, Sigma, Output);
        For_Reduced (Div_Function, Input, Sigma, Output);
    end L1_Normalization;

    procedure L2_Normalization (Input : Real_Tensor_4D; Axes : Tiny_Positive_Vector;
      Bias : Real := 1.0; Epsilon : Real := 1.0; Output: out Real_Tensor_4D) is
        --  Shape: Positive_Vector := Reduce_Shape(Shape_Of(Input), Axes => Axes);
        --  Sigma: Real_Tensor_4D(1..Shape(1), 1..Shape(2), 1..Shape(3), 1..Shape(4));
        Sigma: Real_Tensor_4D(Output'Range(1), Output'Range(2), Output'Range(3), Output'Range(4));
    begin
        Sqr (Input, Output);
        Sum_Reduce (Output, Axes => Axes, Output => Sigma);
        Sqrt (Sigma, Sigma);
        Add (Sigma, Bias, Sigma);
        Max (Sigma, Epsilon, Sigma);
        --  Div (Input, Sigma, Output);
        For_Reduced (Div_Function, Input, Sigma, Output);
    end L2_Normalization;

    procedure Batch_Normalization (Input, Mean, Variance, Offset, Scale: Real_Tensor_4D; Epsilon : Real := 1.0;
        Output: out Real_Tensor_4D) is
        T: Real_Tensor_4D(Input'Range(1), Input'Range(2), Input'Range(3), Input'Range(4));
    begin
        -- output = offset + scale * (input - mean) / sqrt(variance + epsilon)
        Sub (Input, Mean, Output);
        Mul (Scale, Output, Output);
        Add (Variance, Epsilon, T);
        Sqrt (T, T);
        Div (Output, T, Output);
        Add (Output, Offset, Output);
    end Batch_Normalization;

    procedure Min_Max_Linear_Quantize (X: Real_Tensor_4D; Min, Max: Real_Tensor_4D; Bits: Positive; Signed, Symmetric: Boolean; Y: out Real_Tensor_4D) is
        R: Real := Real (2**Bits - 1 - Selection (Signed AND Symmetric, 1, 0));
        P: Real := Real (Selection (Signed, 2**(Bits - 1) - Selection (Symmetric, 1, 0), 0));
        Z, Q: Real_Tensor_4D(X'Range(1), X'Range(2), X'Range(3), X'Range(4));
    begin
        -- z = clamp(x, min, max)
        Clamp (X, Min, Max, Z);
        -- q = round((z - min) / (max - min) * r) - p
        Sub (Z, Min, Q);
        Sub (Max, Min, Z);
        Div (Q, Z, Q);
        Mul (Q, R, Q);
        Round (Q, Q);
        Sub (Q, P, Q); -- ???
        -- y = (q + p) / r * (max - min) + min
        Add (Q, P, Y); -- ???
        Div (Y, R, Y);
        Mul (Y, Z, Y);
        Add (Y, Min, Y);
    end Min_Max_Linear_Quantize;

    procedure Zero_Point_Linear_Quantize (X: Real_Tensor_4D; Zero_Point: Integer_Tensor_4D; Scale: Real_Tensor_4D; Bits: Positive; Signed, Symmetric: Boolean;
            Y: out Real_Tensor_4D) is
        R: Real := Real (Selection (Signed, 2**(Bits - 1) - 1, 2**Bits - 1));
        S: Real_Tensor_4D(X'Range(1), X'Range(2), X'Range(3), X'Range(4));
    begin
        -- z = cast(zero_point);
        -- s = round(x / scale) + z
        Div (X, Scale, S);
        Round (S, S);
        Add (S, Zero_Point, S);
        -- q = clamp(s, !signed? 0.0: symmetric? -r: -r-1.0, r)
        Clamp(S, Selection(NOT Signed, 0.0, Selection(Symmetric, -R, -R-1.0)), R, S);
        -- y = (q - z) * scale
        Sub (S, Zero_Point, Y);
        Mul (Y, Scale, Y);
    end Zero_Point_Linear_Quantize;

    procedure Linear_Quantize (X, Min, Max: Real_Tensor_4D; Bits: Positive; Y: out Real_Tensor_4D) is
    begin
        Min_Max_Linear_Quantize (X, Min => Min, Max => Max, Bits => Bits, Signed => false, Symmetric => false, Y => Y);
    end Linear_Quantize;

    procedure Logarithmic_Quantize (X, Max: Real_Tensor_4D; Bits: Positive; Y: out Real_Tensor_4D) is
        R: Real := Real(2**Bits - 1);
        M, MR: Real_Tensor_4D(Max'Range(1), Max'Range(2), Max'Range(3), Max'Range(4));
        Q: Real_Tensor_4D(X'Range(1), X'Range(2), X'Range(3), X'Range(4));
    begin
        -- m = ceil(log2(max))
        Log2(Max, M);
        Ceil(M, M);
        Sub(M, R, MR);
        -- q = round(clamp(log2(abs(x)), m-r, m))
        Absval (X, Q);
        Log2 (Q, Q);
        Clamp (Q, MR, M, Q);
        Round(Q, Q);
        -- y= sign(x) * 2.0 ^ q
        Sign(X, Y);
        Mul(Y, 2.0, Y);
        Pow(Y, Q, Y);
    end Logarithmic_Quantize;

    procedure Moments (Input: Real_Tensor_4D; Axes: Tiny_Positive_Vector; Mean, Variance: out Real_Tensor_4D) is
        T: Real_Tensor_4D(Input'Range(1), Input'Range(2), Input'Range(3), Input'Range(4));
    begin
        Mean_Reduce(Input, Axes => Axes, Output => Mean);
        Sub(Input, Mean, T);
        Pow(T, 2.0, T);
        Mean_Reduce(T, Axes => Axes, Output => Variance);
    end Moments;

end Generic_Real_Arrays.Operators;
