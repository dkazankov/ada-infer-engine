pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

generic
package Generic_Real_Arrays.Operators is
    pragma Preelaborate;

    function Shape_Of (X: Real_Vector) return Tiny_Positive_Vector_1;
    pragma Inline (Shape_Of);
    function Shape_Of (X: Real_Matrix) return Tiny_Positive_Vector_2;
    pragma Inline (Shape_Of);
    function Shape_Of (X: Real_Tensor_3D) return Tiny_Positive_Vector_3;
    pragma Inline (Shape_Of);
    function Shape_Of (X: Real_Tensor_4D) return Tiny_Positive_Vector_4;
    pragma Inline (Shape_Of);

   -- 4.2 Element-wise operations
   -- 4.2.1 Unary operations

    procedure Copy (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Copy);
    procedure Copy (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Copy);
    procedure Copy (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Copy);
    procedure Copy (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Copy);

    procedure Neg (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Neg);
    procedure Neg (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Neg);
    procedure Neg (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Neg);
    procedure Neg (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Neg);

    procedure Rcp (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Rcp);
    procedure Rcp (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Rcp);
    procedure Rcp (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Rcp);
    procedure Rcp (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Rcp);

    procedure Exp (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Exp);
    procedure Exp (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Exp);
    procedure Exp (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Exp);
    procedure Exp (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Exp);

    procedure Log (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Log);
    procedure Log (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Log);
    procedure Log (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Log);
    procedure Log (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Log);

    procedure Sin (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Sin);
    procedure Sin (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Sin);
    procedure Sin (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Sin);
    procedure Sin (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Sin);

    procedure Cos (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Cos);
    procedure Cos (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Cos);
    procedure Cos (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Cos);
    procedure Cos (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Cos);

    procedure Tan (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Tan);
    procedure Tan (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Tan);
    procedure Tan (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Tan);
    procedure Tan (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Tan);

    procedure Cot (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Cot);
    procedure Cot (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Cot);
    procedure Cot (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Cot);
    procedure Cot (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Cot);

    procedure Sinh (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Sinh);
    procedure Sinh (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Sinh);
    procedure Sinh (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Sinh);
    procedure Sinh (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Sinh);

    procedure Cosh (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Cosh);
    procedure Cosh (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Cosh);
    procedure Cosh (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Cosh);
    procedure Cosh (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Cosh);

    procedure Tanh (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Tanh);
    procedure Tanh (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Tanh);
    procedure Tanh (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Tanh);
    procedure Tanh (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Tanh);

    procedure Coth (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Coth);
    procedure Coth (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Coth);
    procedure Coth (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Coth);
    procedure Coth (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Coth);

    procedure Arcsin (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Arcsin);
    procedure Arcsin (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Arcsin);
    procedure Arcsin (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Arcsin);
    procedure Arcsin (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Arcsin);

    procedure Arccos (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Arccos);
    procedure Arccos (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Arccos);
    procedure Arccos (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Arccos);
    procedure Arccos (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Arccos);

    procedure Arctan (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Arctan);
    procedure Arctan (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Arctan);
    procedure Arctan (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Arctan);
    procedure Arctan (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Arctan);

    procedure Arccot (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Arccot);
    procedure Arccot (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Arccot);
    procedure Arccot (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Arccot);
    procedure Arccot (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Arccot);

    procedure Arcsinh (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Arcsinh);
    procedure Arcsinh (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Arcsinh);
    procedure Arcsinh (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Arcsinh);
    procedure Arcsinh (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Arcsinh);

    procedure Arccosh (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Arccosh);
    procedure Arccosh (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Arccosh);
    procedure Arccosh (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Arccosh);
    procedure Arccosh (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Arccosh);

    procedure Arctanh (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Arctanh);
    procedure Arctanh (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Arctanh);
    procedure Arctanh (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Arctanh);
    procedure Arctanh (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Arctanh);

    procedure Arccoth (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Arccoth);
    procedure Arccoth (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Arccoth);
    procedure Arccoth (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Arccoth);
    procedure Arccoth (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Arccoth);

    procedure Absval (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Absval);
    procedure Absval (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Absval);
    procedure Absval (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Absval);
    procedure Absval (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Absval);

    procedure Sign (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Sign);
    procedure Sign (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Sign);
    procedure Sign (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Sign);
    procedure Sign (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Sign);

    procedure Floor (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Floor);
    procedure Floor (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Floor);
    procedure Floor (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Floor);
    procedure Floor (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Floor);

    procedure Ceil (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Ceil);
    procedure Ceil (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Ceil);
    procedure Ceil (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Ceil);
    procedure Ceil (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Ceil);

    procedure Round (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Round);
    procedure Round (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Round);
    procedure Round (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Round);
    procedure Round (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Round);

   -- 4.2.2 Binary operations
   -- Arithmetic operations

    procedure Add (X, Y : Real_Vector; Z: out Real_Vector);
    pragma Inline (Add);
    procedure Add (X, Y : Real_Matrix; Z: out Real_Matrix);
    pragma Inline (Add);
    procedure Add (X, Y : Real_Tensor_3D; Z: out Real_Tensor_3D);
    pragma Inline (Add);
    procedure Add (X, Y : Real_Tensor_4D; Z: out Real_Tensor_4D);
    pragma Inline (Add);

    procedure Add (X: Real_Vector; Y : Real; Z: out Real_Vector);
    pragma Inline (Add);
    procedure Add (X: Real_Matrix; Y : Real; Z: out Real_Matrix);
    pragma Inline (Add);
    procedure Add (X: Real_Tensor_3D; Y : Real; Z: out Real_Tensor_3D);
    pragma Inline (Add);
    procedure Add (X: Real_Tensor_4D; Y : Real; Z: out Real_Tensor_4D);
    pragma Inline (Add);

    procedure Add (X: Real_Vector; Y : Integer_Vector; Z: out Real_Vector);
    pragma Inline (Add);
    procedure Add (X: Real_Matrix; Y : Integer_Matrix; Z: out Real_Matrix);
    pragma Inline (Add);
    procedure Add (X: Real_Tensor_3D; Y : Integer_Tensor_3D; Z: out Real_Tensor_3D);
    pragma Inline (Add);
    procedure Add (X: Real_Tensor_4D; Y : Integer_Tensor_4D; Z: out Real_Tensor_4D);
    pragma Inline (Add);

    procedure Sub (X, Y : Real_Vector; Z: out Real_Vector);
    pragma Inline (Sub);
    procedure Sub (X, Y : Real_Matrix; Z: out Real_Matrix);
    pragma Inline (Sub);
    procedure Sub (X, Y : Real_Tensor_3D; Z: out Real_Tensor_3D);
    pragma Inline (Sub);
    procedure Sub (X, Y : Real_Tensor_4D; Z: out Real_Tensor_4D);
    pragma Inline (Sub);

    procedure Sub (X: Real_Vector; Y : Real; Z: out Real_Vector);
    pragma Inline (Sub);
    procedure Sub (X: Real_Matrix; Y : Real; Z: out Real_Matrix);
    pragma Inline (Sub);
    procedure Sub (X: Real_Tensor_3D; Y : Real; Z: out Real_Tensor_3D);
    pragma Inline (Sub);
    procedure Sub (X: Real_Tensor_4D; Y : Real; Z: out Real_Tensor_4D);
    pragma Inline (Sub);

    procedure Sub (X: Real_Vector; Y : Integer_Vector; Z: out Real_Vector);
    pragma Inline (Sub);
    procedure Sub (X: Real_Matrix; Y : Integer_Matrix; Z: out Real_Matrix);
    pragma Inline (Sub);
    procedure Sub (X: Real_Tensor_3D; Y : Integer_Tensor_3D; Z: out Real_Tensor_3D);
    pragma Inline (Sub);
    procedure Sub (X: Real_Tensor_4D; Y : Integer_Tensor_4D; Z: out Real_Tensor_4D);
    pragma Inline (Sub);

    procedure Mul (X, Y : Real_Vector; Z: out Real_Vector);
    pragma Inline (Mul);
    procedure Mul (X, Y : Real_Matrix; Z: out Real_Matrix);
    pragma Inline (Mul);
    procedure Mul (X, Y : Real_Tensor_3D; Z: out Real_Tensor_3D);
    pragma Inline (Mul);
    procedure Mul (X, Y : Real_Tensor_4D; Z: out Real_Tensor_4D);
    pragma Inline (Mul);

    procedure Mul (X: Real_Vector; Y : Real; Z: out Real_Vector);
    pragma Inline (Mul);
    procedure Mul (X: Real_Matrix; Y : Real; Z: out Real_Matrix);
    pragma Inline (Mul);
    procedure Mul (X: Real_Tensor_3D; Y : Real; Z: out Real_Tensor_3D);
    pragma Inline (Mul);
    procedure Mul (X: Real_Tensor_4D; Y : Real; Z: out Real_Tensor_4D);
    pragma Inline (Mul);

    procedure Div (X, Y : Real_Vector; Z: out Real_Vector);
    pragma Inline (Div);
    procedure Div (X, Y : Real_Matrix; Z: out Real_Matrix);
    pragma Inline (Div);
    procedure Div (X, Y : Real_Tensor_3D; Z: out Real_Tensor_3D);
    pragma Inline (Div);
    procedure Div (X, Y : Real_Tensor_4D; Z: out Real_Tensor_4D);
    pragma Inline (Div);

    procedure Div (X: Real_Vector; Y : Real; Z: out Real_Vector);
    pragma Inline (Div);
    procedure Div (X: Real_Matrix; Y : Real; Z: out Real_Matrix);
    pragma Inline (Div);
    procedure Div (X: Real_Tensor_3D; Y : Real; Z: out Real_Tensor_3D);
    pragma Inline (Div);
    procedure Div (X: Real_Tensor_4D; Y : Real; Z: out Real_Tensor_4D);
    pragma Inline (Div);

    procedure Pow (X, Y : Real_Vector; Z: out Real_Vector);
    pragma Inline (Pow);
    procedure Pow (X, Y : Real_Matrix; Z: out Real_Matrix);
    pragma Inline (Pow);
    procedure Pow (X, Y : Real_Tensor_3D; Z: out Real_Tensor_3D);
    pragma Inline (Pow);
    procedure Pow (X, Y : Real_Tensor_4D; Z: out Real_Tensor_4D);
    pragma Inline (Pow);

    procedure Pow (X: Real_Vector; Y : Real; Z: out Real_Vector);
    pragma Inline (Pow);
    procedure Pow (X: Real_Matrix; Y : Real; Z: out Real_Matrix);
    pragma Inline (Pow);
    procedure Pow (X: Real_Tensor_3D; Y : Real; Z: out Real_Tensor_3D);
    pragma Inline (Pow);
    procedure Pow (X: Real_Tensor_4D; Y : Real; Z: out Real_Tensor_4D);
    pragma Inline (Pow);

    procedure Lt (X, Y : Real_Vector; Z: out Boolean_Vector);
    pragma Inline (Lt);
    procedure Lt (X, Y : Real_Matrix; Z: out Boolean_Matrix);
    pragma Inline (Lt);
    procedure Lt (X, Y : Real_Tensor_3D; Z: out Boolean_Tensor_3D);
    pragma Inline (Lt);
    procedure Lt (X, Y : Real_Tensor_4D; Z: out Boolean_Tensor_4D);
    pragma Inline (Lt);

    procedure Lt (X: Real_Vector; Y: Real; Z: out Boolean_Vector);
    pragma Inline (Lt);
    procedure Lt (X: Real_Matrix; Y: Real; Z: out Boolean_Matrix);
    pragma Inline (Lt);
    procedure Lt (X: Real_Tensor_3D; Y: Real; Z: out Boolean_Tensor_3D);
    pragma Inline (Lt);
    procedure Lt (X: Real_Tensor_4D; Y: Real; Z: out Boolean_Tensor_4D);
    pragma Inline (Lt);

    procedure Gt (X, Y : Real_Vector; Z: out Boolean_Vector);
    pragma Inline (Gt);
    procedure Gt (X, Y : Real_Matrix; Z: out Boolean_Matrix);
    pragma Inline (Gt);
    procedure Gt (X, Y : Real_Tensor_3D; Z: out Boolean_Tensor_3D);
    pragma Inline (Gt);
    procedure Gt (X, Y : Real_Tensor_4D; Z: out Boolean_Tensor_4D);
    pragma Inline (Gt);

    procedure Gt (X: Real_Vector; Y: Real; Z: out Boolean_Vector);
    pragma Inline (Gt);
    procedure Gt (X: Real_Matrix; Y: Real; Z: out Boolean_Matrix);
    pragma Inline (Gt);
    procedure Gt (X: Real_Tensor_3D; Y: Real; Z: out Boolean_Tensor_3D);
    pragma Inline (Gt);
    procedure Gt (X: Real_Tensor_4D; Y: Real; Z: out Boolean_Tensor_4D);
    pragma Inline (Gt);

    procedure Le (X, Y : Real_Vector; Z: out Boolean_Vector);
    pragma Inline (Le);
    procedure Le (X, Y : Real_Matrix; Z: out Boolean_Matrix);
    pragma Inline (Le);
    procedure Le (X, Y : Real_Tensor_3D; Z: out Boolean_Tensor_3D);
    pragma Inline (Le);
    procedure Le (X, Y : Real_Tensor_4D; Z: out Boolean_Tensor_4D);
    pragma Inline (Le);

    procedure Ge (X, Y : Real_Vector; Z: out Boolean_Vector);
    pragma Inline (Ge);
    procedure Ge (X, Y : Real_Matrix; Z: out Boolean_Matrix);
    pragma Inline (Ge);
    procedure Ge (X, Y : Real_Tensor_3D; Z: out Boolean_Tensor_3D);
    pragma Inline (Ge);
    procedure Ge (X, Y : Real_Tensor_4D; Z: out Boolean_Tensor_4D);
    pragma Inline (Ge);

    procedure Eq (X, Y : Real_Vector; Z: out Boolean_Vector);
    pragma Inline (Eq);
    procedure Eq (X, Y : Real_Matrix; Z: out Boolean_Matrix);
    pragma Inline (Eq);
    procedure Eq (X, Y : Real_Tensor_3D; Z: out Boolean_Tensor_3D);
    pragma Inline (Eq);
    procedure Eq (X, Y : Real_Tensor_4D; Z: out Boolean_Tensor_4D);
    pragma Inline (Eq);

    procedure Ne (X, Y : Real_Vector; Z: out Boolean_Vector);
    pragma Inline (Ne);
    procedure Ne (X, Y : Real_Matrix; Z: out Boolean_Matrix);
    pragma Inline (Ne);
    procedure Ne (X, Y : Real_Tensor_3D; Z: out Boolean_Tensor_3D);
    pragma Inline (Ne);
    procedure Ne (X, Y : Real_Tensor_4D; Z: out Boolean_Tensor_4D);
    pragma Inline (Ne);

   -- 4.2.3 Select operation

    function Selection (Condition: Boolean; True_Value, False_Value: Padding_Type) return Padding_Type;
    pragma Inline (Selection);

    procedure Selection (Condition : Boolean_Vector; True_Value, False_Value : Real_Vector; Z : out Real_Vector);
    pragma Inline (Selection);
    procedure Selection (Condition : Boolean_Matrix; True_Value, False_Value : Real_Matrix; Z : out Real_Matrix);
    pragma Inline (Selection);
    procedure Selection (Condition: Boolean_Tensor_3D; True_Value, False_Value : Real_Tensor_3D; Z : out Real_Tensor_3D);
    pragma Inline (Selection);
    procedure Selection (Condition: Boolean_Tensor_4D; True_Value, False_Value : Real_Tensor_4D; Z : out Real_Tensor_4D);
    pragma Inline (Selection);

    procedure Selection (Condition: Boolean_Vector; True_Value : Real_Vector; False_Value : Real; Z : out Real_Vector);
    pragma Inline (Selection);
    procedure Selection (Condition: Boolean_Matrix; True_Value : Real_Matrix; False_Value : Real; Z : out Real_Matrix);
    pragma Inline (Selection);
    procedure Selection (Condition   : Boolean_Tensor_3D; True_Value : Real_Tensor_3D; False_Value : Real; Z : out Real_Tensor_3D);
    pragma Inline (Selection);
    procedure Selection (Condition   : Boolean_Tensor_4D; True_Value : Real_Tensor_4D; False_Value : Real; Z : out Real_Tensor_4D);
    pragma Inline (Selection);

   -- 4.2.4 Simplifier operations

    procedure Sqr (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Sqr);
    procedure Sqr (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Sqr);
    procedure Sqr (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Sqr);
    procedure Sqr (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Sqr);

    procedure Sqrt (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Sqrt);
    procedure Sqrt (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Sqrt);
    procedure Sqrt (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Sqrt);
    procedure Sqrt (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Sqrt);

    procedure RSqr (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (RSqr);
    procedure RSqr (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (RSqr);
    procedure RSqr (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (RSqr);
    procedure RSqr (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (RSqr);

    procedure RSqrt (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (RSqrt);
    procedure RSqrt (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (RSqrt);
    procedure RSqrt (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (RSqrt);
    procedure RSqrt (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (RSqrt);

    procedure Log2 (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Log2);
    procedure Log2 (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Log2);
    procedure Log2 (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Log2);
    procedure Log2 (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Log2);

    procedure Min (X, Y: Real_Vector; Z: out Real_Vector);
    pragma Inline (Min);
    procedure Min (X, Y : Real_Matrix; Z: out Real_Matrix);
    pragma Inline (Min);
    procedure Min (X, Y : Real_Tensor_3D; Z: out Real_Tensor_3D);
    pragma Inline (Min);
    procedure Min (X, Y : Real_Tensor_4D; Z: out Real_Tensor_4D);
    pragma Inline (Min);

    procedure Min (X: Real_Vector; Y: Real; Z: out Real_Vector);
    pragma Inline (Min);
    procedure Min (X: Real_Matrix; Y: Real; Z: out Real_Matrix);
    pragma Inline (Min);
    procedure Min (X: Real_Tensor_3D; Y: Real; Z: out Real_Tensor_3D);
    pragma Inline (Min);
    procedure Min (X: Real_Tensor_4D; Y: Real; Z: out Real_Tensor_4D);
    pragma Inline (Min);

    procedure Max (X, Y: Real_Vector; Z: out Real_Vector);
    pragma Inline (Max);
    procedure Max (X, Y : Real_Matrix; Z: out Real_Matrix);
    pragma Inline (Max);
    procedure Max (X, Y : Real_Tensor_3D; Z: out Real_Tensor_3D);
    pragma Inline (Max);
    procedure Max (X, Y : Real_Tensor_4D; Z: out Real_Tensor_4D);
    pragma Inline (Max);

    procedure Max (X: Real_Vector; Y: Real; Z: out Real_Vector);
    pragma Inline (Max);
    procedure Max (X: Real_Matrix; Y: Real; Z: out Real_Matrix);
    pragma Inline (Max);
    procedure Max (X: Real_Tensor_3D; Y: Real; Z: out Real_Tensor_3D);
    pragma Inline (Max);
    procedure Max (X: Real_Tensor_4D; Y: Real; Z: out Real_Tensor_4D);
    pragma Inline (Max);

    procedure Clamp (X, A, B : Real_Vector; Z: out Real_Vector);
    pragma Inline (Clamp);
    procedure Clamp (X, A, B : Real_Matrix; Z: out Real_Matrix);
    pragma Inline (Clamp);
    procedure Clamp (X, A, B : Real_Tensor_3D; Z: out Real_Tensor_3D);
    pragma Inline (Clamp);
    procedure Clamp (X, A, B : Real_Tensor_4D; Z: out Real_Tensor_4D);
    pragma Inline (Clamp);

    procedure Clamp (X: Real_Tensor_4D; A, B: Real; Z: out Real_Tensor_4D);
    pragma Inline (Clamp);

   -- 4.3 Sliding window operations

    Scalar_2D_0: constant Real_Matrix := (1 => (1 => (0.0)));

    function Downscaled_Extent (X, F: Positive; P, Q: Integer; S, D: Positive) return Positive;
    function Downscaled_Output_Shape
       (Input_Shape, Size: Tiny_Positive_Vector; Padding: Padding_Type; Stride, Dilation : Tiny_Positive_Vector) return Tiny_Positive_Vector;
    function Downscaled_Output_Shape_2
       (Input_Shape, Size: Tiny_Positive_Vector_2; Padding: Padding_Type_2; Stride, Dilation : Tiny_Positive_Vector_2) return Tiny_Positive_Vector_2;
    pragma Inline (Downscaled_Output_Shape_2);
    function Downscaled_Output_Shape_3
       (Input_Shape, Size: Tiny_Positive_Vector_3; Padding: Padding_Type_3; Stride, Dilation : Tiny_Positive_Vector_3) return Tiny_Positive_Vector_3;
    pragma Inline (Downscaled_Output_Shape_3);
    function Downscaled_Output_Shape_4
       (Input_Shape, Size: Tiny_Positive_Vector_4; Padding: Padding_Type_4; Stride, Dilation : Tiny_Positive_Vector_4) return Tiny_Positive_Vector_4;
    pragma Inline (Downscaled_Output_Shape_4);

    function Upscaled_Extent (X, F: Positive; P, Q: Integer; S, D: Positive) return Positive;
    function Upscaled_Output_Shape
       (Input_Shape, Size: Tiny_Positive_Vector; Padding: Padding_Type; Stride, Dilation: Tiny_Positive_Vector) return Tiny_Positive_Vector;
    function Upscaled_Output_Shape_2
       (Input_Shape, Size: Tiny_Positive_Vector_2; Padding: Padding_Type_2; Stride, Dilation: Tiny_Positive_Vector_2) return Tiny_Positive_Vector_2;
    pragma Inline (Upscaled_Output_Shape_2);
    function Upscaled_Output_Shape_3
       (Input_Shape, Size: Tiny_Positive_Vector_3; Padding: Padding_Type_3; Stride, Dilation: Tiny_Positive_Vector_3) return Tiny_Positive_Vector_3;
    pragma Inline (Upscaled_Output_Shape_3);
    function Upscaled_Output_Shape_4
       (Input_Shape, Size: Tiny_Positive_Vector_4; Padding: Padding_Type_4; Stride, Dilation: Tiny_Positive_Vector_4) return Tiny_Positive_Vector_4;
    pragma Inline (Upscaled_Output_Shape_4);

    function Auto_Padding_Extent (X, F, S, D: Positive) return Padding_Extent;
    function Auto_Padding (Input_Shape, Size, Stride, Dilation: Tiny_Positive_Vector) return Padding_Type;
    function Auto_Padding_1 (Input_Shape, Size, Stride, Dilation: Tiny_Positive_Vector_1) return Padding_Type_1;
    pragma Inline (Auto_Padding_1);
    function Auto_Padding_2 (Input_Shape, Size, Stride, Dilation: Tiny_Positive_Vector_2) return Padding_Type_2;
    pragma Inline (Auto_Padding_2);
    function Auto_Padding_3 (Input_Shape, Size, Stride, Dilation: Tiny_Positive_Vector_3) return Padding_Type_3;
    pragma Inline (Auto_Padding_3);
    function Auto_Padding_4 (Input_Shape, Size, Stride, Dilation: Tiny_Positive_Vector_4) return Padding_Type_4;
    pragma Inline (Auto_Padding_4);

    -- 4.3.1 Convolution and deconvolution

    procedure Conv
       (Input, Filter    : Real_Tensor_3D; Bias : Real_Matrix := Scalar_2D_0;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Groups           : Natural         := 1;
        Output: out Real_Tensor_3D);

    procedure Conv
       (Input, Filter    : Real_Tensor_4D; Bias : Real_Matrix := Scalar_2D_0;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Groups           : Natural         := 1;
        Output: out Real_Tensor_4D);

    procedure Deconv
       (Input, Filter    : Real_Tensor_3D; Bias : Real_Matrix := Scalar_2D_0;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Groups           : Natural         := 1;
        Output: out Real_Tensor_3D);

    procedure Deconv
       (Input, Filter    : Real_Tensor_4D; Bias : Real_Matrix := Scalar_2D_0;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Groups           : Natural         := 1;
        Output: out Real_Tensor_4D);

   -- 4.3.2 Box filter

    procedure Box
       (Input            : Real_Tensor_3D;
        Size : Tiny_Positive_Vector;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Normalize        : Boolean         := False;
        Output: out Real_Tensor_3D);

    procedure Box
       (Input            : Real_Tensor_4D;
        Size : Tiny_Positive_Vector;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Normalize        : Boolean         := False;
        Output: out Real_Tensor_4D);

    procedure Debox
       (Input            : Real_Tensor_3D;
        Size : Tiny_Positive_Vector;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Normalize        : Boolean         := False;
        Output: out Real_Tensor_3D);

    procedure Debox
       (Input            : Real_Tensor_4D;
        Size : Tiny_Positive_Vector;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Normalize        : Boolean         := False;
        Output: out Real_Tensor_4D);

    -- 4.3.3 Index based sampling

    procedure Argmax_Pool
       (Input            : Real_Tensor_3D;
        Size : Tiny_Positive_Vector;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Output: out Natural_Tensor_3D);
    pragma Inline (Argmax_Pool);

    procedure Argmax_Pool
       (Input            : Real_Tensor_4D;
        Size : Tiny_Positive_Vector;
        Border           : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Output: out Natural_Tensor_4D);
    pragma Inline (Argmax_Pool);

    procedure Sample
       (Input            : Real_Tensor_3D; Index : Natural_Tensor_3D;
        Size : Tiny_Positive_Vector; Border : Border_Modes := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Output: out Real_Tensor_3D);
    pragma Inline (Sample);

    procedure Sample
       (Input            : Real_Tensor_4D; Index : Natural_Tensor_4D;
        Size : Tiny_Positive_Vector; Border : Border_Modes := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Output: out Real_Tensor_4D);
    pragma Inline (Sample);

    procedure Desample
       (Input            : Real_Tensor_3D; Index : Natural_Tensor_3D;
        Size : Tiny_Positive_Vector; Border : Border_Modes := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Output: out Real_Tensor_3D);
    pragma Inline (Desample);

    procedure Desample
       (Input            : Real_Tensor_4D; Index : Natural_Tensor_4D;
        Size : Tiny_Positive_Vector; Border : Border_Modes := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Output: out Real_Tensor_4D);
    pragma Inline (Desample);

    -- 4.3.4 Up and down-sampling

    procedure Nearest_Downsample
       (Input : Real_Tensor_4D; Factor : Tiny_Positive_Vector; Output: out Real_Tensor_4D);

    procedure Area_Downsample
       (Input : Real_Tensor_4D; Factor : Tiny_Positive_Vector; Output: out Real_Tensor_4D);

    procedure Nearest_Upsample
       (Input : Real_Tensor_4D; Factor : Tiny_Positive_Vector; Output: out Real_Tensor_4D);

    type Interpolation_Method is
      (Interpolation_Method_Symmetric,
        Interpolation_Method_Asymmetric,
        Interpolation_Method_Aligned);

    type Interpolation_Mode is
      (Interpolation_Mode_Nearest,
        Interpolation_Mode_Linear,
        Interpolation_Mode_Bilinear,
        Interpolation_Mode_Bicubic,
        Interpolation_Mode_Trilinear,
        Interpolation_Mode_Area,
        Interpolation_Mode_Nearest_Exact);

    function Upsample_Weights_1D (Factor: Positive; Symmetric: Boolean) return Real_Vector;
    function Upsample_Weights_2D (Factor: Tiny_Positive_Vector; Symmetric: Boolean) return Real_Matrix;

    procedure Multilinear_Upsample
       (Input  : Real_Tensor_4D; Factor : Tiny_Positive_Vector;
        Method : Interpolation_Method :=
           Interpolation_Method_Symmetric;
        Border : Border_Modes := Border_Mode_Replicate;
        Output: out Real_Tensor_4D);

    procedure Linear_Upsample2x_Symmetric
       (Input : Real_Tensor_3D; Border : Border_Modes; Output: out Real_Tensor_3D);

    procedure Linear_Upsample2x_Asymmetric
       (Input : Real_Tensor_3D; Border : Border_Modes; Output: out Real_Tensor_3D);

    procedure Bilinear_Upsample2x_Symmetric
       (Input : Real_Tensor_4D; Border : Border_Modes; Output: out Real_Tensor_4D);

    procedure Bilinear_Upsample2x_Asymmetric
       (Input : Real_Tensor_4D; Border : Border_Modes; Output: out Real_Tensor_4D);

    -- 4.4 Reduce operations

    function Reduce_Shape (X: Tiny_Positive_Vector; Axes: Tiny_Positive_Vector) return Tiny_Positive_Vector;

    procedure Sum_Reduce (Input: Real_Vector; Normalize : Boolean := False; Output: out Real_Vector);
    procedure Sum_Reduce (Input : Real_Matrix; Axes: Tiny_Positive_Vector; Normalize : Boolean := False; Output: out Real_Matrix);
    procedure Sum_Reduce (Input     : Real_Tensor_3D; Axes : Tiny_Positive_Vector; Normalize : Boolean := False; Output: out Real_Tensor_3D);
    procedure Sum_Reduce (Input     : Real_Tensor_4D; Axes : Tiny_Positive_Vector; Normalize : Boolean := False; Output: out Real_Tensor_4D);

    procedure Max_Reduce (Input : Real_Vector; Output: out Real_Vector);
    pragma Inline (Max_Reduce);
    procedure Max_Reduce (Input : Real_Matrix; Axes : Tiny_Positive_Vector; Output: out Real_Matrix);
    pragma Inline (Max_Reduce);
    procedure Max_Reduce (Input : Real_Tensor_3D; Axes : Tiny_Positive_Vector; Output: out Real_Tensor_3D);
    pragma Inline (Max_Reduce);
    procedure Max_Reduce (Input : Real_Tensor_4D; Axes : Tiny_Positive_Vector; Output: out Real_Tensor_4D);
    pragma Inline (Max_Reduce);

    procedure Min_Reduce (Input : Real_Vector; Output: out Real_Vector);
    pragma Inline (Min_Reduce);
    procedure Min_Reduce (Input : Real_Matrix; Axes : Tiny_Positive_Vector; Output: out Real_Matrix);
    pragma Inline (Min_Reduce);
    procedure Min_Reduce (Input : Real_Tensor_3D; Axes : Tiny_Positive_Vector; Output: out Real_Tensor_3D);
    pragma Inline (Min_Reduce);
    procedure Min_Reduce (Input : Real_Tensor_4D; Axes : Tiny_Positive_Vector; Output: out Real_Tensor_4D);
    pragma Inline (Min_Reduce);

    procedure Argmax_Reduce (Input : Real_Vector; Output: out Natural_Vector);
    pragma Inline (Argmax_Reduce);
    procedure Argmax_Reduce
       (Input : Real_Matrix; Axes : Tiny_Positive_Vector; Output: out Natural_Matrix);
    pragma Inline (Argmax_Reduce);
    procedure Argmax_Reduce
       (Input : Real_Tensor_3D; Axes : Tiny_Positive_Vector; Output: out Natural_Tensor_3D);
    pragma Inline (Argmax_Reduce);
    procedure Argmax_Reduce
       (Input : Real_Tensor_4D; Axes : Tiny_Positive_Vector; Output: out Natural_Tensor_4D);
    pragma Inline (Argmax_Reduce);

    procedure Argmin_Reduce (Input : Real_Vector; Output: out Natural_Vector);
    pragma Inline (Argmin_Reduce);
    procedure Argmin_Reduce
       (Input : Real_Matrix; Axes : Tiny_Positive_Vector; Output: out Natural_Matrix);
    pragma Inline (Argmin_Reduce);
    procedure Argmin_Reduce
       (Input : Real_Tensor_3D; Axes : Tiny_Positive_Vector; Output: out Natural_Tensor_3D);
    pragma Inline (Argmin_Reduce);
    procedure Argmin_Reduce
       (Input : Real_Tensor_4D; Axes : Tiny_Positive_Vector; Output: out Natural_Tensor_4D);
    pragma Inline (Argmin_Reduce);

    procedure Mean_Reduce (Input : Real_Vector; Output: out Real_Vector);
    pragma Inline (Mean_Reduce);
    procedure Mean_Reduce
       (Input : Real_Matrix; Axes : Tiny_Positive_Vector; Output: out Real_Matrix);
    pragma Inline (Mean_Reduce);
    procedure Mean_Reduce
       (Input : Real_Tensor_3D; Axes : Tiny_Positive_Vector; Output: out Real_Tensor_3D);
    pragma Inline (Mean_Reduce);
    procedure Mean_Reduce
       (Input : Real_Tensor_4D; Axes : Tiny_Positive_Vector; Output: out Real_Tensor_4D);
    pragma Inline (Mean_Reduce);

    -- 4.5 Tensor Shape Operations
    -- 4.5.1 Reshaping

    function Reshape_Shape(Input_Shape: Tiny_Positive_Vector; Shape: Integer_Vector; Axis_Start: Positive := 1; Axis_Count: Integer := -1)
        return Tiny_Positive_Vector;
    function Remove_Axes (Input_Shape, Axes: Tiny_Positive_Vector) return Tiny_Positive_Vector;
    function Add_Axes (Input_Shape, Axes: Tiny_Positive_Vector) return Tiny_Positive_Vector;

    -- 4.5.2 Transposing

    -- 4.5.3 Splitting and Concatenation

    -- 4.5.4 Slicing

    function Slice_Shape (Input_Shape: Tiny_Positive_Vector; Axes: Tiny_Positive_Vector; Slice_Begin, Slice_End: Integer_Vector; Stride: Integer_Vector)
        return Tiny_Positive_Vector;

    -- 4.5.5 Padding

    function Pad_Shape (Input_Shape: Tiny_Positive_Vector; Padding: Padding_Type) return Tiny_Positive_Vector;

    -- 4.5.6 Tiling

    function Tile_Shape (Input_Shape: Tiny_Positive_Vector; Repeats: Tiny_Positive_Vector) return Tiny_Positive_Vector;

    -- 4.5.7 Gathering

    function Gather_Shape (Input_Shape: Tiny_Positive_Vector; Indices: Positive_Matrix; Axis: Positive := 1) return Tiny_Positive_Vector;

    -- 4.5.8 Casting

    -- 4.6 Region-of-Interest operations
    -- 4.6.1 RoI pooling

    function Roi_Pool_Shape (Input_Shape, Rois_Shape, Output_Size: Tiny_Positive_Vector) return Tiny_Positive_Vector;

    procedure Avg_Roi_Pool (Input: Real_Tensor_4D; Rois: Real_Matrix; Batch_Index: Integer_Matrix; Output: out Real_Tensor_4D);
    procedure Max_Roi_Pool (Input: Real_Tensor_4D; Rois: Real_Matrix; Batch_Index: Integer_Matrix; Output: out Real_Tensor_4D);

    -- 4.6.2 RoI align

    procedure Roi_Resample (Input: Real_Tensor_4D; Rois: Real_Matrix; Batch_Index: Integer_Matrix;
      Method: Interpolation_Method := Interpolation_Method_Symmetric; Output: out Real_Tensor_4D);

    procedure Avg_Roi_Align (Input: Real_Tensor_4D; Rois: Real_Matrix; Batch_Index: Integer_Matrix; Sampling_Rate: Tiny_Positive_Vector_4;
      Resize_Method: Interpolation_Method := Interpolation_Method_Symmetric; Output: out Real_Tensor_4D);
   
    procedure Max_Roi_Align (Input: Real_Tensor_4D; Rois: Real_Matrix; Batch_Index: Integer_Matrix; Sampling_Rate: Tiny_Positive_Vector_4;
      Resize_Method: Interpolation_Method := Interpolation_Method_Symmetric; Output: out Real_Tensor_4D);

    -- 4.7 Matrix multiplication

    -- 4.8 Variable updates

    -- 4.9 Compound operations
    -- 4.9.1 Activation functions

    procedure Sigmoid (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Sigmoid);
    procedure Sigmoid (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Sigmoid);
    procedure Sigmoid (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Sigmoid);
    procedure Sigmoid (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Sigmoid);

    procedure Relu (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Relu);
    procedure Relu (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Relu);
    procedure Relu (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Relu);
    procedure Relu (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Relu);

    procedure Prelu (X : Real_Vector; Alpha : Real_Vector; Y: out Real_Vector);
    pragma Inline (Prelu);
    procedure Prelu (X : Real_Matrix; Alpha : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Prelu);
    procedure Prelu (X : Real_Tensor_3D; Alpha : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Prelu);
    procedure Prelu (X : Real_Tensor_4D; Alpha : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Prelu);

    procedure Leaky_Relu (X : Real_Vector; Alpha : Real; Y: out Real_Vector);
    pragma Inline (Leaky_Relu);
    procedure Leaky_Relu (X : Real_Matrix; Alpha : Real; Y: out Real_Matrix);
    pragma Inline (Leaky_Relu);
    procedure Leaky_Relu (X : Real_Tensor_3D; Alpha : Real; Y: out Real_Tensor_3D);
    pragma Inline (Leaky_Relu);
    procedure Leaky_Relu (X : Real_Tensor_4D; Alpha : Real; Y: out Real_Tensor_4D);
    pragma Inline (Leaky_Relu);

    procedure Elu (X : Real_Vector; Alpha : Real := 1.0; Y: out Real_Vector);
    pragma Inline (Elu);
    procedure Elu (X : Real_Matrix; Alpha : Real := 1.0; Y: out Real_Matrix);
    pragma Inline (Elu);
    procedure Elu (X : Real_Tensor_3D; Alpha : Real := 1.0; Y: out Real_Tensor_3D);
    pragma Inline (Elu);
    procedure Elu (X : Real_Tensor_4D; Alpha : Real := 1.0; Y: out Real_Tensor_4D);
    pragma Inline (Elu);

    procedure Selu (X      : Real_Vector; Alpha : Real := 1.673_263_19;
        Lambda : Real := 1.050_701_02; Y: out Real_Vector);
    pragma Inline (Selu);
    procedure Selu (X      : Real_Matrix; Alpha : Real := 1.673_263_19;
        Lambda : Real := 1.050_701_02; Y: out Real_Matrix);
    pragma Inline (Selu);
    procedure Selu (X      : Real_Tensor_3D; Alpha : Real := 1.673_263_19;
        Lambda : Real := 1.050_701_02; Y: out Real_Tensor_3D);
    pragma Inline (Selu);
    procedure Selu (X      : Real_Tensor_4D; Alpha : Real := 1.673_263_19;
        Lambda : Real := 1.050_701_02; Y: out Real_Tensor_4D);
    pragma Inline (Selu);

    procedure Gelu (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Gelu);
    procedure Gelu (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Gelu);
    procedure Gelu (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Gelu);
    procedure Gelu (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Gelu);

    procedure Silu (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Silu);
    procedure Silu (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Silu);
    procedure Silu (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Silu);
    procedure Silu (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Silu);

    procedure Softmax (X : Real_Vector; Y: out Real_Vector);
    procedure Softmax (X : Real_Matrix; Axes : Tiny_Positive_Vector := (1 => 2); Y: out Real_Matrix);
    procedure Softmax
       (X : Real_Tensor_3D; Axes : Tiny_Positive_Vector := (1 => 2); Y: out Real_Tensor_3D);
    procedure Softmax
       (X : Real_Tensor_4D; Axes : Tiny_Positive_Vector := (1 => 2); Y: out Real_Tensor_4D);

    procedure Softplus (X : Real_Vector; Y: out Real_Vector);
    pragma Inline (Softplus);
    procedure Softplus (X : Real_Matrix; Y: out Real_Matrix);
    pragma Inline (Softplus);
    procedure Softplus (X : Real_Tensor_3D; Y: out Real_Tensor_3D);
    pragma Inline (Softplus);
    procedure Softplus (X : Real_Tensor_4D; Y: out Real_Tensor_4D);
    pragma Inline (Softplus);

    -- 4.9.2 Linear operations

    procedure Linear (Input: Real_Vector; Filter : Real_Matrix; Bias : Real_Vector; Output: out Real_Vector);
    procedure Linear (Input, Filter : Real_Matrix; Bias : Real_Matrix; Output: out Real_Matrix);
    pragma Inline (Linear);

    procedure Separable_Conv
       (Input, Plane_Filter, Point_Filter : Real_Tensor_4D;
        Bias                              : Real_Matrix := Scalar_2D_0;
        Border : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Groups                            : Natural := 1;
        Output: out Real_Tensor_4D);

    procedure Separable_Deconv
       (Input, Plane_Filter, Point_Filter : Real_Tensor_4D;
        Bias                              : Real_Matrix := Scalar_2D_0;
        Border : Border_Modes    := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
        Groups                            : Natural := 1;
        Output: out Real_Tensor_4D);

    -- 4.9.3 Pooling operations

    procedure Max_Pool
     (Input : Real_Tensor_4D;
      Size : Tiny_Positive_Vector;
      Border                            : Border_Modes := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
      Output: out Real_Tensor_4D);
    pragma Inline (Max_Pool);

    procedure Avg_Pool
     (Input : Real_Tensor_4D;
      Size : Tiny_Positive_Vector;
      Border                            : Border_Modes := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
      Output: out Real_Tensor_4D);
    pragma Inline (Avg_Pool);

    procedure Rms_Pool
     (Input : in out Real_Tensor_4D;
      Size : Tiny_Positive_Vector;
      Border                            : Border_Modes := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
      Output: out Real_Tensor_4D);

    procedure Min_Pool
     (Input : Real_Tensor_4D;
      Size : Tiny_Positive_Vector;
      Border                            : Border_Modes := Border_Mode_Constant;
        Padding          : Padding_Type := Padding_Auto;
        Stride : Tiny_Positive_Vector := Default_Stride;
        Dilation : Tiny_Positive_Vector := Default_Dilation;
      Output: out Real_Tensor_4D);
    pragma Inline (Min_Pool);

    -- 4.9.4 Normalization operations

    procedure Local_Response_Normalization
       (Input : Real_Tensor_4D; Size : Tiny_Positive_Vector; Alpha : Real := 1.0;
        Beta  : Real := 0.5; Bias : Real := 1.0; Output: out Real_Tensor_4D);

    procedure Local_Mean_Normalization (Input: Real_Tensor_4D; Size: Tiny_Positive_Vector; Output: out Real_Tensor_4D);

    procedure Local_Variance_Normalization (Input : Real_Tensor_4D; Size : Tiny_Positive_Vector;
      Bias : Real := 1.0; Epsilon : Real := 1.0; Output: out Real_Tensor_4D);

    procedure Local_Contrast_Normalization (Input : Real_Tensor_4D; Size : Tiny_Positive_Vector;
      Bias : Real := 1.0; Epsilon : Real := 1.0; Output: out Real_Tensor_4D);

    procedure L1_Normalization (Input : Real_Tensor_4D; Axes : Tiny_Positive_Vector;
      Bias : Real := 1.0; Epsilon : Real := 1.0; Output: out Real_Tensor_4D);

    procedure L2_Normalization (Input : Real_Tensor_4D; Axes : Tiny_Positive_Vector;
      Bias : Real := 1.0; Epsilon : Real := 1.0; Output: out Real_Tensor_4D);

    procedure Batch_Normalization (Input, Mean, Variance, Offset, Scale: Real_Tensor_4D; Epsilon : Real := 1.0;
        Output: out Real_Tensor_4D);

    -- 4.9.5 Quantization operations

    procedure Min_Max_Linear_Quantize (X: Real_Tensor_4D; Min, Max: Real_Tensor_4D; Bits: Positive; Signed, Symmetric: Boolean; Y: out Real_Tensor_4D);
    procedure Zero_Point_Linear_Quantize (X: Real_Tensor_4D; Zero_Point: Integer_Tensor_4D; Scale: Real_Tensor_4D; Bits: Positive; Signed, Symmetric: Boolean;
            Y: out Real_Tensor_4D);
    procedure Linear_Quantize (X, Min, Max: Real_Tensor_4D; Bits: Positive; Y: out Real_Tensor_4D);
    pragma Inline (Linear_Quantize);
    procedure Logarithmic_Quantize (X, Max: Real_Tensor_4D; Bits: Positive; Y: out Real_Tensor_4D);

    -- 4.9.6 Miscellaneous operations
    procedure Moments (Input: Real_Tensor_4D; Axes: Tiny_Positive_Vector; Mean, Variance: out Real_Tensor_4D);

end Generic_Real_Arrays.Operators;
