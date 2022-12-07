% Implementation of steepest descent algorithm for optimization with
% mutable gamma
function [x_star, k, x_k, y_k, gamma_k] = steepest_descent_v2(f, x1, y1, epsilon)
    syms sym_gamma;
    f_derivative = jacobian(f);
    max_num_of_iterations = 1000;
    x_k = x1;
    y_k = y1;
    
    points = f_derivative(x_k(1), y_k(1));
    g = f( x_k(1) - sym_gamma*points(1), y_k(1) - sym_gamma*points(2) );
    gamma_k(1) = mean(derivativeBisection_method(g, 0, 3, 0.01));

    for i = 1:max_num_of_iterations
        if norm(f_derivative(x_k(i), y_k(i))) < epsilon
            x_star = [x_k(i), y_k(i)];
            k = i;
            return;
        else
            d_k = - f_derivative(x_k(i), y_k(i)); 
            
            points = f_derivative(x_k(i), y_k(i));
            g = f( x_k(i) - sym_gamma*points(1), y_k(i) - sym_gamma*points(2) );
            gamma_k(i) = mean(goldenSection_method(g, 0, 3, 0.0001));
            
            x_k(i+1) = x_k(i) + gamma_k(i)*d_k(1);
            y_k(i+1) = y_k(i) + gamma_k(i)*d_k(2);
        end
    end
    k = i;
    x_star = nan;
end