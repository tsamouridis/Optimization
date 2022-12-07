function [x_star, k, x_k, y_k, m_k] = Levenberg_Marquardt(f, x1, y1, gamma, epsilon)
    f_derivative = jacobian(f)';
    f_second_derivative = hessian(f);
    I = diag([1,1]);
    
    m_k(1) = calculate_m_k(f_second_derivative, x1, y1); 
    max_num_of_iterations = 1000;
    x_k = x1;
    y_k = y1;
    fcontour(f)
    for i = 1:max_num_of_iterations
        hold on
        plot(x_k, y_k)
        if norm(f_derivative(x_k(i), y_k(i))) < epsilon
            x_star = [x_k(i), y_k(i)];
            k = i;
            return;
        else
             m_k(i) = calculate_m_k(f_second_derivative, x1, y1); 
             d_k = - inv( f_second_derivative(x_k(i),y_k(i)) + m_k(i)*I) * f_derivative(x_k(i), y_k(i));
             x_k(i+1) = x_k(i) + gamma*d_k(1)
             y_k(i+1) = y_k(i) + gamma*d_k(2)
        end
    end
    k = i;
    x_star = nan;
end

             
             
             
             