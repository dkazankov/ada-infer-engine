pragma Ada_95;
pragma Profile (Ravenscar);

package body Generic_Real_Functions is

   function Copy (X: Float_Type'Base) return Float_Type'Base is
   begin
      return X;
   end Copy;

   function Neg (X: Float_Type'Base) return Float_Type'Base is
   begin
      return -X;
   end Neg;

   function Rcp (X: Float_Type'Base) return Float_Type'Base is
   begin
      return 1.0 / X;
   end Rcp;

   function Atan (X: Float_Type'Base) return Float_Type'Base is
   begin
      return Arctan(X, 1.0);
   end Atan;

   function Acot (X: Float_Type'Base) return Float_Type'Base is
   begin
      return Arccot(X, 1.0);
   end Acot;

   function Absval (X: Float_Type'Base) return Float_Type'Base is
   begin
      return Abs(X);
   end Absval;

   function Sign (X: Float_Type'Base) return Float_Type'Base is
   begin
      if X > 0.0 then
         return 1.0;
      elsif X < 0.0 then
         return -1.0;
      else
         return 0.0;
      end if;
   end Sign;

   function Floor (X: Float_Type'Base) return Float_Type'Base is
   begin
      return Float_Type'Floor(X);
   end Floor;

   function Ceil (X: Float_Type'Base) return Float_Type'Base is
   begin
      return Float_Type'Ceiling(X);
   end Ceil;

   function Round (X: Float_Type'Base) return Float_Type'Base is
   begin
      return Float_Type'Rounding(X);
   end Round;

   function Tanh_Derivative (F: Float_Type'Base) return Float_Type'Base is
   begin
      return 1.0 - F * F;
   end Tanh_Derivative;

   function Logistic (X: Float_Type'Base) return Float_Type'Base is
   begin
      return 1.0 / (1.0 + Exp(-X));
   end Logistic;

   function Logistic_Derivative (F: Float_Type'Base) return Float_Type'Base is
   begin
      return F * (1.0 - F);
   end Logistic_Derivative;

   function ReLU (X: Float_Type'Base) return Float_Type'Base is
   begin
      if X > 0.0 then
         return X;
      else
         return 0.0;
      end if;
   end ReLU;

   function Add (X, Y: Float_Type'Base) return Float_Type'Base is
   begin
      return X + Y;
   end Add;
   function Sub (X, Y: Float_Type'Base) return Float_Type'Base is
   begin
      return X - Y;
   end Sub;
   function Mul (X, Y: Float_Type'Base) return Float_Type'Base is
   begin
      return X * Y;
   end Mul;
   function Div (X, Y: Float_Type'Base) return Float_Type'Base is
   begin
      return X / Y;
   end Div;
   function Pow (X, Y: Float_Type'Base) return Float_Type'Base is
   begin
      return X ** Y;
   end Pow;
   
   function Less_Than (X, Y: Float_Type'Base) return Boolean'Base is
   begin
      return X < Y;
   end Less_Than;
   function Greater_Than (X, Y: Float_Type'Base) return Boolean'Base is
   begin
      return X > Y;
   end Greater_Than;
   function Less_Or_Equal (X, Y: Float_Type'Base) return Boolean'Base is
   begin
      return X <= Y;
   end Less_Or_Equal;
   function Greater_Or_Equal (X, Y: Float_Type'Base) return Boolean'Base is
   begin
      return X >= Y;
   end Greater_Or_Equal;
   function Equal (X, Y: Float_Type'Base) return Boolean'Base is
   begin
      return X = Y;
   end Equal;
   function Not_Equal (X, Y: Float_Type'Base) return Boolean'Base is
   begin
      return X /= Y;
   end Not_Equal;

   function Selection (Condition: Boolean'Base; True_Value, False_Value: Float_Type'Base) return Float_Type'Base is
   begin
      if Condition then
         return True_Value;
      else
         return False_Value;
      end if;
   end Selection;

   function Sqr (X: Float_Type'Base) return Float_Type'Base is
   begin
      return X * X;
   end Sqr;
   function RSqr (X: Float_Type'Base) return Float_Type'Base is
   begin
      return 1.0 / (X * X);
   end RSqr;
   function RSqrt (X: Float_Type'Base) return Float_Type'Base is
   begin
      return 1.0 / Sqrt(X);
   end RSqrt;

   function Log2 (X: Float_Type'Base) return Float_Type'Base is
   begin
      return Log(X) / Log(2.0);
   end Log2;

   function Max (X, Y: Float_Type'Base) return Float_Type'Base is
   begin
      return Float_Type'Max(X, Y);
   end Max;

   function Min (X, Y: Float_Type'Base) return Float_Type'Base is
   begin
      return Float_Type'Min(X, Y);
   end Min;

    function Clamp (X, A, B: Float_Type'Base) return Float_Type'Base is
    begin
        return Max (Min (X, B), A);
    end Clamp;

    function Prelu (X, Alpha: Float_Type'Base) return Float_Type'Base is
    begin
         if X < 0.0 then
            return Alpha * X;
         else
            return X;
         end if;
    end Prelu;

    function Leaky_Relu (X, Alpha: Float_Type'Base) return Float_Type'Base is
    begin
         if X < 0.0 then
            return Alpha * X;
         else
            return X;
         end if;
    end Leaky_Relu;

    function Elu (X: Float_Type'Base; Alpha : Float_Type'Base := 1.0) return Float_Type'Base is
    begin
         if X < 0.0 then
            return Alpha * (Exp(X) - 1.0);
         else
            return X;
         end if;
    end Elu;

    function Selu (X: Float_Type'Base; Alpha : Float_Type'Base := 1.673_263_19; Lambda : Float_Type'Base := 1.050_701_02) return Float_Type'Base is
    begin
         if X < 0.0 then
            return Alpha * (Exp(X) - 1.0) * Lambda;
         else
            return X * Lambda;
         end if;
    end Selu;

    function Gelu (X : Float_Type'Base) return Float_Type'Base is
    begin
         return X * Logistic(1.702 * X);
    end Gelu;

    function Silu (X : Float_Type'Base) return Float_Type'Base is
    begin
         return X * Logistic(X);
    end Silu;

    function Softplus (X: Float_Type'Base) return Float_Type'Base is
    begin
        return Log (Exp (X) + 1.0);
    end Softplus;

    function Call (F: Unary_Real_Function; X: Float_Type'Base) return Float_Type'Base is
    begin
        return F (X);
    end Call;

    function Call (F: Binary_Real_Function; X, Y: Float_Type'Base) return Float_Type'Base is
    begin
        return F (X, Y);
    end Call;

    function Call (F: Ternary_Real_Function; X, Y, Z: Float_Type'Base) return Float_Type'Base is
    begin
        return F (X, Y, Z);
    end Call;

    function Call (F: Compare_Real_Function; X, Y: Float_Type'Base) return Boolean'Base is
    begin
        return F (X, Y);
    end Call;

    function Call (F: Select_Real_Function; C: Boolean'Base; X, Y: Float_Type'Base) return Float_Type'Base is
    begin
        return F (C, X, Y);
    end Call;

end Generic_Real_Functions;
