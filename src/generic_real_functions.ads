pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

with Ada.Numerics.Generic_Elementary_Functions;

generic

    type Float_Type is digits <>;

package Generic_Real_Functions is
    pragma Preelaborate;

    package Elementary_Functions is new Ada.Numerics.Generic_Elementary_Functions(Float_Type => Float_Type);
    use Elementary_Functions;

    function Copy (X: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Copy);
    function Neg (X: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Neg);
    function Rcp (X: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Rcp);
    function Atan (X: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Atan);
    function Acot (X: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Acot);
    function Absval (X: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Absval);
    function Sign (X: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Sign);
    function Floor (X: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Floor);
    function Ceil (X: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Ceil);
    function Round (X: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Round);

    function Tanh_Derivative (F: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Tanh_Derivative);
    function Logistic (X: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Logistic);
    function Logistic_Derivative (F: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Logistic_Derivative);
    function ReLU (X: Float_Type'Base) return Float_Type'Base;
    pragma Inline(ReLU);

    function Add (X, Y: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Add);
    function Sub (X, Y: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Sub);
    function Mul (X, Y: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Mul);
    function Div (X, Y: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Div);
    function Pow (X, Y: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Pow);

    function Less_Than (X, Y: Float_Type'Base) return Boolean'Base;
    pragma Inline(Less_Than);
    function Greater_Than (X, Y: Float_Type'Base) return Boolean'Base;
    pragma Inline(Greater_Than);
    function Less_Or_Equal (X, Y: Float_Type'Base) return Boolean'Base;
    pragma Inline(Less_Or_Equal);
    function Greater_Or_Equal (X, Y: Float_Type'Base) return Boolean'Base;
    pragma Inline(Greater_Or_Equal);
    function Equal (X, Y: Float_Type'Base) return Boolean'Base;
    pragma Inline(Equal);
    function Not_Equal (X, Y: Float_Type'Base) return Boolean'Base;
    pragma Inline(Not_Equal);

    function Selection (Condition: Boolean'Base; True_Value, False_Value: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Selection);

    function Sqr (X: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Sqr);
    function RSqr (X: Float_Type'Base) return Float_Type'Base;
    pragma Inline(RSqr);
    function RSqrt (X: Float_Type'Base) return Float_Type'Base;
    pragma Inline(RSqrt);
    function Log2 (X: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Log2);

    function Max (X, Y: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Max);
    function Min (X, Y: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Min);

    function Clamp (X, A, B: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Clamp);

    function Prelu (X, Alpha : Float_Type'Base) return Float_Type'Base;
    pragma Inline(Prelu);
    function Leaky_Relu (X, Alpha : Float_Type'Base) return Float_Type'Base;
    pragma Inline(Leaky_Relu);
    function Elu (X: Float_Type'Base; Alpha : Float_Type'Base := 1.0) return Float_Type'Base;
    pragma Inline(Elu);
    function Selu (X: Float_Type'Base; Alpha : Float_Type'Base := 1.673_263_19; Lambda : Float_Type'Base := 1.050_701_02)  return Float_Type'Base;
    pragma Inline(Selu);
    function Gelu (X : Float_Type'Base) return Float_Type'Base;
    pragma Inline(Gelu);
    function Silu (X : Float_Type'Base) return Float_Type'Base;
    pragma Inline(Silu);

    function Softplus (X: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Softplus);

    type Unary_Real_Function is private;
    function Call (F: Unary_Real_Function; X: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Call);

    type Binary_Real_Function is private;
    function Call (F: Binary_Real_Function; X, Y: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Call);

    type Ternary_Real_Function is private;
    function Call (F: Ternary_Real_Function; X, Y, Z: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Call);

    type Compare_Real_Function is private;
    function Call (F: Compare_Real_Function; X, Y: Float_Type'Base) return Boolean'Base;
    pragma Inline(Call);

    type Select_Real_Function is private;
    function Call (F: Select_Real_Function; C: Boolean'Base; X, Y: Float_Type'Base) return Float_Type'Base;
    pragma Inline(Call);

    Copy_Function: constant Unary_Real_Function;
    Neg_Function: constant Unary_Real_Function;
    Rcp_Function: constant Unary_Real_Function;
    Exp_Function: constant Unary_Real_Function;
    Log_Function: constant Unary_Real_Function;
    Sin_Function: constant Unary_Real_Function;
    Cos_Function: constant Unary_Real_Function;
    Tan_Function: constant Unary_Real_Function;
    Cot_Function: constant Unary_Real_Function;
    Sinh_Function: constant Unary_Real_Function;
    Cosh_Function: constant Unary_Real_Function;
    Tanh_Function: constant Unary_Real_Function;
    Coth_Function: constant Unary_Real_Function;
    Arcsin_Function: constant Unary_Real_Function;
    Arccos_Function: constant Unary_Real_Function;
    Arctan_Function: constant Unary_Real_Function;
    Arccot_Function: constant Unary_Real_Function;
    Arcsinh_Function: constant Unary_Real_Function;
    Arccosh_Function: constant Unary_Real_Function;
    Arctanh_Function: constant Unary_Real_Function;
    Arccoth_Function: constant Unary_Real_Function;
    Abs_Function: constant Unary_Real_Function;
    Sign_Function: constant Unary_Real_Function;
    Floor_Function: constant Unary_Real_Function;
    Ceil_Function: constant Unary_Real_Function;
    Round_Function: constant Unary_Real_Function;

    Add_Function: constant Binary_Real_Function;
    Sub_Function: constant Binary_Real_Function;
    Mul_Function: constant Binary_Real_Function;
    Div_Function: constant Binary_Real_Function;
    Pow_Function: constant Binary_Real_Function;

    Lt_Function: constant Compare_Real_Function;
    Gt_Function: constant Compare_Real_Function;
    Le_Function: constant Compare_Real_Function;
    Ge_Function: constant Compare_Real_Function;
    Eq_Function: constant Compare_Real_Function;
    Ne_Function: constant Compare_Real_Function;

    Selection_Function: constant Select_Real_Function;

    Sqr_Function: constant Unary_Real_Function;
    Sqrt_Function: constant Unary_Real_Function;
    RSqr_Function: constant Unary_Real_Function;
    RSqrt_Function: constant Unary_Real_Function;
    Log2_Function: constant Unary_Real_Function;

    Min_Function: constant Binary_Real_Function;
    Max_Function: constant Binary_Real_Function;

    Clamp_Function: constant Ternary_Real_Function;

    Logistic_Function: constant Unary_Real_Function;
    Relu_Function: constant Unary_Real_Function;
    Prelu_Function: constant Binary_Real_Function;
    Leaky_Relu_Function: constant Binary_Real_Function;
    Elu_Function: constant Binary_Real_Function;
    Selu_Function: constant Ternary_Real_Function;
    Gelu_Function: constant Unary_Real_Function;
    Silu_Function: constant Unary_Real_Function;
    Softplus_Function: constant Unary_Real_Function;

private

    type Unary_Real_Function is access function(X: Float_Type'Base) return Float_Type'Base;
    type Binary_Real_Function is access function(X, Y: Float_Type'Base) return Float_Type'Base;
    type Ternary_Real_Function is access function(X, Y, Z: Float_Type'Base) return Float_Type'Base;
    type Compare_Real_Function is access function(X, Y: Float_Type'Base) return Boolean'Base;
    type Select_Real_Function is access function(C: Boolean'Base; X, Y: Float_Type'Base) return Float_Type'Base;

    Copy_Function: constant Unary_Real_Function := Copy'Access;
    Neg_Function: constant Unary_Real_Function := Neg'Access;
    Rcp_Function: constant Unary_Real_Function := Rcp'Access;
    Exp_Function: constant Unary_Real_Function := Exp'Access;
    Log_Function: constant Unary_Real_Function := Log'Access;
    Sin_Function: constant Unary_Real_Function := Sin'Access;
    Cos_Function: constant Unary_Real_Function := Cos'Access;
    Tan_Function: constant Unary_Real_Function := Tan'Access;
    Cot_Function: constant Unary_Real_Function := Cot'Access;
    Sinh_Function: constant Unary_Real_Function := Sinh'Access;
    Cosh_Function: constant Unary_Real_Function := Cosh'Access;
    Tanh_Function: constant Unary_Real_Function := Tanh'Access;
    Coth_Function: constant Unary_Real_Function := Coth'Access;
    Arcsin_Function: constant Unary_Real_Function := Arcsin'Access;
    Arccos_Function: constant Unary_Real_Function := Arccos'Access;
    Arctan_Function: constant Unary_Real_Function := Atan'Access;
    Arccot_Function: constant Unary_Real_Function := Acot'Access;
    Arcsinh_Function: constant Unary_Real_Function := Arcsinh'Access;
    Arccosh_Function: constant Unary_Real_Function := Arccosh'Access;
    Arctanh_Function: constant Unary_Real_Function := Arctanh'Access;
    Arccoth_Function: constant Unary_Real_Function := Arccoth'Access;
    Abs_Function: constant Unary_Real_Function := Absval'Access;
    Sign_Function: constant Unary_Real_Function := Sign'Access;
    Floor_Function: constant Unary_Real_Function := Floor'Access;
    Ceil_Function: constant Unary_Real_Function := Ceil'Access;
    Round_Function: constant Unary_Real_Function := Round'Access;

    Add_Function: constant Binary_Real_Function := Add'Access;
    Sub_Function: constant Binary_Real_Function := Sub'Access;
    Mul_Function: constant Binary_Real_Function := Mul'Access;
    Div_Function: constant Binary_Real_Function := Div'Access;
    Pow_Function: constant Binary_Real_Function := Pow'Access;

    Lt_Function: constant Compare_Real_Function := Less_Than'Access;
    Gt_Function: constant Compare_Real_Function := Greater_Than'Access;
    Le_Function: constant Compare_Real_Function := Less_Or_Equal'Access;
    Ge_Function: constant Compare_Real_Function := Greater_Or_Equal'Access;
    Eq_Function: constant Compare_Real_Function := Equal'Access;
    Ne_Function: constant Compare_Real_Function := Not_Equal'Access;

    Selection_Function: constant Select_Real_Function := Selection'Access;

    Sqr_Function: constant Unary_Real_Function := Sqr'Access;
    Sqrt_Function: constant Unary_Real_Function := Sqrt'Access;
    RSqr_Function: constant Unary_Real_Function := RSqr'Access;
    RSqrt_Function: constant Unary_Real_Function := RSqrt'Access;
    Log2_Function: constant Unary_Real_Function := Log2'Access;

    Min_Function: constant Binary_Real_Function := Min'Access;
    Max_Function: constant Binary_Real_Function := Max'Access;

    Clamp_Function: constant Ternary_Real_Function := Clamp'Access;

    Logistic_Function: constant Unary_Real_Function := Logistic'Access;
    Relu_Function: constant Unary_Real_Function := Relu'Access;

    Prelu_Function: constant Binary_Real_Function := Prelu'Access;
    Leaky_Relu_Function: constant Binary_Real_Function := Leaky_Relu'Access;
    Elu_Function: constant Binary_Real_Function := Elu'Access;
    Selu_Function: constant Ternary_Real_Function := Selu'Access;
    
    Gelu_Function: constant Unary_Real_Function := Gelu'Access;
    Silu_Function: constant Unary_Real_Function := Silu'Access;
    Softplus_Function: constant Unary_Real_Function := Softplus'Access;

end Generic_Real_Functions;
