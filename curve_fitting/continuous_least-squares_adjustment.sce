// define function
deff('y = f(x)', 'y = x.^2');

// apply continuous least squares adjustment

function [coefficients] = continuous_adjustment(y_function, a, b, degree)
    Phi = zeros(degree+1, degree+1);
    B = zeros(degree+1, 1);

    for i = 0:degree
        for j = 0:degree
            exponent = i + j;
            expression = 'x.^' + string(exponent);
            Phi(i+1, j+1) = integrate(expression, 'x', a, b);
        end
    end

    for i = 0:degree
        expression = 'f(x) .* x.^' + string(i);
        B(i+1) = integrate(expression, 'x', a, b);
    end

    coefficients = Phi \ B;
endfunction

coefficients = continuous_adjustment(f, 1, 2, 1);
disp(coefficients);