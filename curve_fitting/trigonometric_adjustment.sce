// define x and y

samples = 4;
x = linspace(0, 2*%pi, samples+1)(1:samples);

y = [3; 5; 7; 6];

// apply trigonometric adjustment

function [coefficients] = trigonometric_adjustment(x, y, degree)
    n = length(x);
    A = zeros(n, 2*degree + 1);

    A(:, 1) = ones(n, 1);

    for k = 1:degree
        A(:, 2*k)   = cos(k * x);
        A(:, 2*k+1) = sin(k * x);
    end

    coefficients = A \ y;
endfunction

coefficients = trigonometric_adjustment(x, y, 1);
disp(coefficients)
