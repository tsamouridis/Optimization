% Implementation of steepest descent algorithm for optimization with const
% gamma
function [x_star, k, x_k, y_k] = steepest_descent(f, x1, y1, gamma, epsilon)
    f_derivative = jacobian(f);
    max_num_of_iterations = 1000;
    x_k = x1;
    y_k = y1;
    for i = 1:max_num_of_iterations
        if norm(f_derivative(x_k(i), y_k(i))) < epsilon
            x_star = [x_k(i), y_k(i)];
            k = i;
            return;
        else
            d_k = - f_derivative(x_k(i), y_k(i));
            x_k(i+1) = x_k(i) + gamma*d_k(1);
            y_k(i+1) = y_k(i) + gamma*d_k(2);
        end
    end
    k = i;
    x_star = nan;
end