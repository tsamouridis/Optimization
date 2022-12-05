% prints the resulting intervals(or minimum x*) for the functions f1, f2,
% f3 using the methods stored in the folder methods
close all; clear variables;

load_functions; load_parameters;
functions_to_test = [f1, f2, f3];
i = 1;
for f = functions_to_test
    fprintf('\n== f%d(x) ==\n', i)
    result1 = bisection_method(f, a1, b1, lambda, epsilon);
    result2 = goldenSection_method(f, a1, b1, lambda);
    result3 = fibonacci_method(f, a1, b1, lambda);
    result4 = derivativeBisection_method(f, a1, b1, lambda);

    fprintf('Bisection Method: [%f, %f]\n', result1(1), result1(2))
    fprintf('Golden Section Method: [%f, %f]\n', result2(1), result2(2))
    fprintf('Fibonacci Method: [%f, %f]\n', result3(1), result3(2))
    if isscalar(result4)
        fprintf('Bisection Method with the use of Derivative: %f\n', result4)
    else
        fprintf('Bisection Method with the use of Derivative: [%f, %f]\n', result4(1), result4(2))
    end
    i = i+1;
end