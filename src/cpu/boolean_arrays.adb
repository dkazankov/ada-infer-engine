pragma Ada_95;
pragma Profile (Ravenscar);

package body Boolean_Arrays is

    function "Not"(X: Boolean_Vector) return Boolean_Vector is
        Y: Boolean_Vector(X'Range);
    begin
        for I in X'Range loop
            Y(I) := not X(I);
        end loop;
        return Y;
    end "Not";

    function "Not"(X: Boolean_Matrix) return Boolean_Matrix is
        Y: Boolean_Matrix(X'Range(1), X'Range(2));
    begin
        for I in X'Range(1) loop
            for J in X'Range(2) loop
                Y(I, J) := not X(I, J);
            end loop;
        end loop;
        return Y;
    end "Not";

    function "Not"(X: Boolean_Tensor_3D) return Boolean_Tensor_3D is
        Y: Boolean_Tensor_3D(X'Range(1), X'Range(2), X'Range(3));
    begin
        for I in X'Range(1) loop
            for J in X'Range(2) loop
                for K in X'Range(3) loop
                    Y(I, J, K) := not X(I, J, K);
                end loop;
            end loop;
        end loop;
        return Y;
    end "Not";

    function "Not"(X: Boolean_Tensor_4D) return Boolean_Tensor_4D is
        Y: Boolean_Tensor_4D(X'Range(1), X'Range(2), X'Range(3), X'Range(4));
    begin
        for I in X'Range(1) loop
            for J in X'Range(2) loop
                for K in X'Range(3) loop
                    for L in X'Range(4) loop
                        Y(I, J, K, L) := not X(I, J, K, L);
                    end loop;
                end loop;
            end loop;
        end loop;
        return Y;
    end "Not";

    function "And"(X, Y: Boolean_Vector) return Boolean_Vector is
        Z: Boolean_Vector(X'Range);
    begin
        for I in X'Range(1) loop
            Z(I) := X(I) and then Y(I);
        end loop;
        return Z;
    end "And";

    function "And"(X, Y: Boolean_Matrix) return Boolean_Matrix is
        Z: Boolean_Matrix(X'Range(1), X'Range(2));
    begin
        for I in X'Range(1) loop
            for J in X'Range(2) loop
                Z(I, J) := X(I, J) and then Y(I, J);
            end loop;
        end loop;
        return Z;
    end "And";

    function "And"(X, Y: Boolean_Tensor_3D) return Boolean_Tensor_3D is
        Z: Boolean_Tensor_3D(X'Range(1), X'Range(2), X'Range(3));
    begin
        for I in X'Range(1) loop
            for J in X'Range(2) loop
                for K in X'Range(3) loop
                    Z(I, J, K) := X(I, J, K) and then Y(I, J, K);
                end loop;
            end loop;
        end loop;
        return Z;
    end "And";

    function "And"(X, Y: Boolean_Tensor_4D) return Boolean_Tensor_4D is
        Z: Boolean_Tensor_4D(X'Range(1), X'Range(2), X'Range(3), X'Range(4));
    begin
        for I in X'Range(1) loop
            for J in X'Range(2) loop
                for K in X'Range(3) loop
                    for L in X'Range(4) loop
                        Z(I, J, K, L) := X(I, J, K, L) and then Y(I, J, K, L);
                    end loop;
                end loop;
            end loop;
        end loop;
        return Z;
    end "And";

    function "Or"(X, Y: Boolean_Vector) return Boolean_Vector is
        Z: Boolean_Vector(X'Range);
    begin
        for I in X'Range(1) loop
            Z(I) := X(I) or else Y(I);
        end loop;
        return Z;
    end "Or";

    function "Or"(X, Y: Boolean_Matrix) return Boolean_Matrix is
        Z: Boolean_Matrix(X'Range(1), X'Range(2));
    begin
        for I in X'Range(1) loop
            for J in X'Range(2) loop
                Z(I, J) := X(I, J) or else Y(I, J);
            end loop;
        end loop;
        return Z;
    end "Or";

    function "Or"(X, Y: Boolean_Tensor_3D) return Boolean_Tensor_3D is
        Z: Boolean_Tensor_3D(X'Range(1), X'Range(2), X'Range(3));
    begin
        for I in X'Range(1) loop
            for J in X'Range(2) loop
                for K in X'Range(3) loop
                    Z(I, J, K) := X(I, J, K) or else Y(I, J, K);
                end loop;
            end loop;
        end loop;
        return Z;
    end "Or";

    function "Or"(X, Y: Boolean_Tensor_4D) return Boolean_Tensor_4D is
        Z: Boolean_Tensor_4D(X'Range(1), X'Range(2), X'Range(3), X'Range(4));
    begin
        for I in X'Range(1) loop
            for J in X'Range(2) loop
                for K in X'Range(3) loop
                    for L in X'Range(4) loop
                        Z(I, J, K, L) := X(I, J, K, L) or else Y(I, J, K, L);
                    end loop;
                end loop;
            end loop;
        end loop;
        return Z;
    end "Or";

    function All_Reduce(Input: Boolean_Vector) return Boolean_Vector is
        Output: Boolean_Vector(Input'First..Input'First) := (others => true);
    begin
        for I in Input'Range loop
            Output(Output'First) := Output(Output'First) AND then Input(I);
        end loop;
        return Output;
    end All_Reduce;

    function All_Reduce(Input: Boolean_Matrix; Axes: Positive) return Boolean_Matrix is
        Last1 : Positive := Input'Last(1);
        Last2 : Positive := Input'Last(2);
        I1, J1: Positive;
    begin
        case Axes is
            when 1 => Last1 := Input'First(1);
            when 2 => Last2 := Input'First(2);
            when others => null;
        end case;
        declare
            Output: Boolean_Matrix(Input'First(1)..Last1, Input'First(2)..Last2) := (others => (others => true));
        begin
            for I in Input'Range(1) loop
                if Output'Length(1) = 1 then
                    I1 := Output'First(1);
                else
                    I1 := I;
                end if;
                for J in Input'Range(2) loop
                    if Output'Length(2) = 1 then
                        J1 := Output'First(2);
                    else
                        J1 := J;
                    end if;
                    Output(I1, J1) := Output(I1, J1) AND then Input(I, J);
                end loop;
            end loop;
            return Output;
        end;
    end All_Reduce;

    function All_Reduce(Input: Boolean_Tensor_3D; Axes: Tiny_Positive_Vector) return Boolean_Tensor_3D is
        Last1 : Positive := Input'Last(1);
        Last2 : Positive := Input'Last(2);
        Last3 : Positive := Input'Last(3);
        I1, J1, K1: Positive;
    begin
        for I in Axes'Range loop
            case Axes(I) is
                when 1 => Last1 := Input'First(1);
                when 2 => Last2 := Input'First(2);
                when 3 => Last3 := Input'First(3);
                when others => null;
            end case;
        end loop;
        declare
            Output: Boolean_Tensor_3D(Input'First(1)..Last1, Input'First(2)..Last2, Input'First(3)..Last3) := (others => (others => (others => true)));
        begin
            for I in Input'Range(1) loop
                if Output'Length(1) = 1 then
                    I1 := Output'First(1);
                else
                    I1 := I;
                end if;
                for J in Input'Range(2) loop
                    if Output'Length(2) = 1 then
                        J1 := Output'First(2);
                    else
                        J1 := J;
                    end if;
                    for K in Input'Range(3) loop
                        if Output'Length(3) = 1 then
                            K1 := Output'First(3);
                        else
                            K1 := K;
                        end if;
                        Output(I1, J1, K1) := Output(I1, J1, K1) AND then Input(I, J, K);
                    end loop;
                end loop;
            end loop;
            return Output;
        end;
    end All_Reduce;

    function All_Reduce(Input: Boolean_Tensor_4D; Axes: Tiny_Positive_Vector) return Boolean_Tensor_4D is
        Last1 : Positive := Input'Last(1);
        Last2 : Positive := Input'Last(2);
        Last3 : Positive := Input'Last(3);
        Last4 : Positive := Input'Last(4);
        I1, J1, K1, L1: Positive;
    begin
        for I in Axes'Range loop
            case Axes(I) is
                when 1 => Last1 := Input'First(1);
                when 2 => Last2 := Input'First(2);
                when 3 => Last3 := Input'First(3);
                when 4 => Last4 := Input'First(4);
                when others => null;
            end case;
        end loop;
        declare
            Output: Boolean_Tensor_4D(Input'First(1)..Last1, Input'First(2)..Last2, Input'First(3)..Last3, Input'First(4)..Last4) :=
                (others => (others => (others => (others => true))));
        begin
            for I in Input'Range(1) loop
                if Output'Length(1) = 1 then
                    I1 := Output'First(1);
                else
                    I1 := I;
                end if;
                for J in Input'Range(2) loop
                    if Output'Length(2) = 1 then
                        J1 := Output'First(2);
                    else
                        J1 := J;
                    end if;
                    for K in Input'Range(3) loop
                        if Output'Length(3) = 1 then
                            K1 := Output'First(3);
                        else
                            K1 := K;
                        end if;
                        for L in Input'Range(4) loop
                            if Output'Length(4) = 1 then
                                L1 := Output'First(4);
                            else
                                L1 := L;
                            end if;
                            Output(I1, J1, K1, L1) := Output(I1, J1, K1, L1) AND then Input(I, J, K, L);
                        end loop;
                    end loop;
                end loop;
            end loop;
            return Output;
        end;
    end All_Reduce;

    function Any_Reduce(Input: Boolean_Vector) return Boolean_Vector is
        Output: Boolean_Vector(Input'First..Input'First) := (others => false);
    begin
        for I in Input'Range loop
            Output(Output'First) := Output(Output'First) OR else Input(I);
        end loop;
        return Output;
    end Any_Reduce;

    function Any_Reduce(Input: Boolean_Matrix; Axes: Positive) return Boolean_Matrix is
        Last1 : Positive := Input'Last(1);
        Last2 : Positive := Input'Last(2);
        I1, J1: Positive;
    begin
        case Axes is
            when 1 => Last1 := Input'First(1);
            when 2 => Last2 := Input'First(2);
            when others => null;
        end case;
        declare
            Output: Boolean_Matrix(Input'First(1)..Last1, Input'First(2)..Last2) := (others => (others => false));
        begin
            for I in Input'Range(1) loop
                if Output'Length(1) = 1 then
                    I1 := Output'First(1);
                else
                    I1 := I;
                end if;
                for J in Input'Range(2) loop
                    if Output'Length(2) = 1 then
                        J1 := Output'First(2);
                    else
                        J1 := J;
                    end if;
                    Output(I1, J1) := Output(I1, J1) OR else Input(I, J);
                end loop;
            end loop;
            return Output;
        end;
    end Any_Reduce;

    function Any_Reduce(Input: Boolean_Tensor_3D; Axes: Tiny_Positive_Vector) return Boolean_Tensor_3D is
        Last1 : Positive := Input'Last(1);
        Last2 : Positive := Input'Last(2);
        Last3 : Positive := Input'Last(3);
        I1, J1, K1: Positive;
    begin
        for I in Axes'Range loop
            case Axes(I) is
                when 1 => Last1 := Input'First(1);
                when 2 => Last2 := Input'First(2);
                when 3 => Last3 := Input'First(3);
                when others => null;
            end case;
        end loop;
        declare
            Output: Boolean_Tensor_3D(Input'First(1)..Last1, Input'First(2)..Last2, Input'First(3)..Last3) := (others => (others => (others => false)));
        begin
            for I in Input'Range(1) loop
                if Output'Length(1) = 1 then
                    I1 := Output'First(1);
                else
                    I1 := I;
                end if;
                for J in Input'Range(2) loop
                    if Output'Length(2) = 1 then
                        J1 := Output'First(2);
                    else
                        J1 := J;
                    end if;
                    for K in Input'Range(3) loop
                        if Output'Length(3) = 1 then
                            K1 := Output'First(3);
                        else
                            K1 := K;
                        end if;
                        Output(I1, J1, K1) := Output(I1, J1, K1) OR else Input(I, J, K);
                    end loop;
                end loop;
            end loop;
            return Output;
        end;
    end Any_Reduce;

    function Any_Reduce(Input: Boolean_Tensor_4D; Axes: Tiny_Positive_Vector) return Boolean_Tensor_4D is
        Last1 : Positive := Input'Last(1);
        Last2 : Positive := Input'Last(2);
        Last3 : Positive := Input'Last(3);
        Last4 : Positive := Input'Last(4);
        I1, J1, K1, L1: Positive;
    begin
        for I in Axes'Range loop
            case Axes(I) is
                when 1 => Last1 := Input'First(1);
                when 2 => Last2 := Input'First(2);
                when 3 => Last3 := Input'First(3);
                when 4 => Last4 := Input'First(4);
                when others => null;
            end case;
        end loop;
        declare
            Output: Boolean_Tensor_4D(Input'First(1)..Last1, Input'First(2)..Last2, Input'First(3)..Last3, Input'First(4)..Last4) :=
                (others => (others => (others => (others => false))));
        begin
            for I in Input'Range(1) loop
                if Output'Length(1) = 1 then
                    I1 := Output'First(1);
                else
                    I1 := I;
                end if;
                for J in Input'Range(2) loop
                    if Output'Length(2) = 1 then
                        J1 := Output'First(2);
                    else
                        J1 := J;
                    end if;
                    for K in Input'Range(3) loop
                        if Output'Length(3) = 1 then
                            K1 := Output'First(3);
                        else
                            K1 := K;
                        end if;
                        for L in Input'Range(4) loop
                            if Output'Length(4) = 1 then
                                L1 := Output'First(4);
                            else
                                L1 := L;
                            end if;
                            Output(I1, J1, K1, L1) := Output(I1, J1, K1, L1) OR else Input(I, J, K, L);
                        end loop;
                    end loop;
                end loop;
            end loop;
            return Output;
        end;
    end Any_Reduce;

end Boolean_Arrays;
