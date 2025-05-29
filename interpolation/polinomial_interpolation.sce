// define values

x = [-2; 1; 3];
y = [3; 0; -3];

// apply polinomial interpolation

function [coefficients] = polinomial_interpolation(x, y)
    n = length(x);

    V = zeros(n, n);

    for i = 1:n
        for j = 1:n
            V(i, j) = x(i)^(j-1);
        end
    end

    coefficients = V \ y;
endfunction

coefficients = polinomial_interpolation(x, y);
disp(coefficients);