% generates the plots of the values a_k, b_k with respect to k resulting from
% the Golden Section algorithm
function generate_a_b_plots_goldenSection(f, title_string, a1, b1, lambda_values, figure_index)
    m = length(lambda_values);
    figure(figure_index)
    for i = 1:m
        [~, alphas, betas, ~, ~] = goldenSection_method(f, a1, b1, lambda_values(i));
        k = 1:length(alphas);

        figure(figure_index)
        subplot(m,1,i)
        plot(k, alphas, 'x')
        hold on
        plot(k, betas, 'o')
        title(title_string+", l = "+string(lambda_values(i)))
        xlabel('k')
        grid on
    end
end