close all; clear variables

load_functions
a1 = -1;
b1 = 3;
lambda_values = [ 0.01, 0.1, 0.5, 1 ];

figure_index = 1;
generate_a_b_plots_goldenSection(f1, 'f_1(x)', a1, b1, lambda_values, figure_index)

figure_index = 2;
generate_a_b_plots_goldenSection(f2, 'f_2(x)', a1, b1, lambda_values, figure_index)

figure_index = 3;
generate_a_b_plots_goldenSection(f3, 'f_3(x)', a1, b1, lambda_values, figure_index)

for figure_index = 1:3
    figure(figure_index)
    legend('a', 'b')
end