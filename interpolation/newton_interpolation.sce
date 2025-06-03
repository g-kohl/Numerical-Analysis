// define values

x = [-2; 1; 2];
y = [5; 0; -3];

// apply newton interpolation

function [coefficients] = newton_interpolation(x, y)
    n = length(x);
    diferences_table = zeros(n, n);
    diferences_table(:, 1) = y;

    for j = 2:n
        for i = 1:(n - j + 1)
            diferences_table(i, j) = (diferences_table(i + 1, j - 1) - diferences_table(i, j - 1)) / (x(i + j - 1) - x(i));
        end
    end

    coefficients = diferences_table(1, :);
endfunction

function [pz] = evaluate_newton(x, a, z)
    n = length(a);
    pz = a(n);

    for i = n - 1:-1:1
        pz = a(i) + (z - x(i)) * pz;
    end
endfunction

coefficients = newton_interpolation(x, y);
disp(coefficients)

result = evaluate_newton(x, coefficients, 3);
disp("P(3) = " + string(result));