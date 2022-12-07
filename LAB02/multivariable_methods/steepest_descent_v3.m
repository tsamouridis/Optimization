% Implementation of steepest descent algorithm for optimization with
% mutable gamma chosen by armijo rule
function [x_star, k, x_k, y_k, gamma_k] = steepest_descent_v3(f, x1, y1, epsilon)
    f_derivative = jacobian(f);
    max_num_of_iterations = 1000;
    x_k = x1;
    y_k = y1;
    s = 1;
    
    gamma_k(1) = s;
    for i = 1:max_num_of_iterations
        if norm(f_derivative(x_k(i), y_k(i))) < epsilon
            x_star = [x_k(i), y_k(i)];
            k = i;
            return;
        else
            d_k = - f_derivative(x_k(i), y_k(i)); 
            [gamma_k(i+1), x_k(i+1), y_k(i+1)] = armijo(f, f_derivative, x_k(i), y_k(i), d_k);
        end
    end
    k = i;
    x_star = nan;
end