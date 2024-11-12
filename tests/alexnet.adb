pragma Ada_95;
pragma Profile (Ravenscar);
package body AlexNet is
    procedure Forward is
    begin
        conv (input => data, filter => variable_0, bias => variable_1, border => Border_Mode_constant, padding => ((0, 0), (0, 0)), stride => (4, 4), dilation => (1, 1), groups => 1, output => conv_0);
        relu (x => conv_0, y => relu_0);
        sqr (x => relu_0, y => sqr1);
        box (input => sqr1, size => (1, 5, 1, 1), border => Border_Mode_constant, padding => Padding_Auto, stride => Default_Stride, dilation => Default_Dilation, normalize => true, output => box1);
        mul (x => box1, y => 0.0001, z => mul1);
        add (x => mul1, y => 1.0, z => add1);
        pow (x => add1, y => 0.75, z => pow1);
        div (x => relu_0, y => pow1, z => local_response_normalization_0);
        max_pool (input => local_response_normalization_0, size => (1, 1, 3, 3), border => Border_Mode_ignore, padding => ((0, 0), (0, 0), (0, 0), (0, 0)), stride => (1, 1, 2, 2), dilation => Default_Dilation, output => max_pool_0);
        conv (input => max_pool_0, filter => variable_2, bias => variable_3, border => Border_Mode_constant, padding => ((2, 2), (2, 2)), stride => (1, 1), dilation => (1, 1), groups => 2, output => conv_1);
        relu (x => conv_1, y => relu_1);
        sqr (x => relu_1, y => sqr2);
        box (input => sqr2, size => (1, 5, 1, 1), border => Border_Mode_constant, padding => Padding_Auto, stride => Default_Stride, dilation => Default_Dilation, normalize => true, output => box2);
        mul (x => box2, y => 0.0001, z => mul2);
        add (x => mul2, y => 1.0, z => add2);
        pow (x => add2, y => 0.75, z => pow2);
        div (x => relu_1, y => pow2, z => local_response_normalization_1);
        max_pool (input => local_response_normalization_1, size => (1, 1, 3, 3), border => Border_Mode_ignore, padding => ((0, 0), (0, 0), (0, 0), (0, 0)), stride => (1, 1, 2, 2), dilation => Default_Dilation, output => max_pool_1);
        conv (input => max_pool_1, filter => variable_4, bias => variable_5, border => Border_Mode_constant, padding => ((1, 1), (1, 1)), stride => (1, 1), dilation => (1, 1), groups => 1, output => conv_2);
        relu (x => conv_2, y => relu_2);
        conv (input => relu_2, filter => variable_6, bias => variable_7, border => Border_Mode_constant, padding => ((1, 1), (1, 1)), stride => (1, 1), dilation => (1, 1), groups => 2, output => conv_3);
        relu (x => conv_3, y => relu_3);
        conv (input => relu_3, filter => variable_8, bias => variable_9, border => Border_Mode_constant, padding => ((1, 1), (1, 1)), stride => (1, 1), dilation => (1, 1), groups => 2, output => conv_4);
        relu (x => conv_4, y => relu_4);
        max_pool (input => relu_4, size => (1, 1, 3, 3), border => Border_Mode_ignore, padding => ((0, 0), (0, 0), (0, 0), (0, 0)), stride => (1, 1, 2, 2), dilation => Default_Dilation, output => max_pool_2);
        reshape (input => max_pool_2, output => reshape_0);
        linear (input => reshape_0, filter => variable_10, bias => variable_11, output => linear_0);
        relu (x => linear_0, y => relu_5);
        linear (input => relu_5, filter => variable_12, bias => variable_13, output => linear_1);
        relu (x => linear_1, y => relu_6);
        linear (input => relu_6, filter => variable_14, bias => variable_15, output => linear_2);
        softmax (x => linear_2, axes => (1 => 2), y => prob);
    end Forward;
end AlexNet;
