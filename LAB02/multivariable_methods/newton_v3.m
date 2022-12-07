function [x_star, k, x_k, y_k, gamma_k] = newton_v3(f, x1, y1, epsilon, check_positive_definite)
    f_derivative = (jacobian(f))';
    f_second_derivative = hessian(f);
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
            A = f_second_derivative(x_k(i), y_k(i));
%             if ~is_positive_definite(A) 
%                 error('Hessian is not positive definite')
%             end
            d_k = - inv(A) * f_derivative(x_k(i), y_k(i));
            [gamma_k(i+1), x_k(i+1), y_k(i+1)] = armijo(f, f_derivative, x_k(i), y_k(i), d_k);
        end
    end
    k = i;
    x_star = nan;
end








