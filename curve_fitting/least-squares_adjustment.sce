// define values

x = [0; 1.2; 1.5; 1.9; 2.2 ; 2.5];
y = [3; 4.5; 6  ; 3.6; 1.04; 0.2];

// apply polinomial adjustment

function [coefficients] = polinomial_adjustment(x, y, degree)
    n = length(x);

    A = zeros(n, degree + 1);
    for i = 1:(degree + 1)
        A(:, i) = x.^(i - 1);
    end

    AtA = A' * A;
    Aty = A' * y;

    coefficients = AtA \ Aty;
endfunction

// apply exponential adjustment

function [a, b] = exponential_adjustment(x, y)
    idx = find(y > 0);
    x = x(idx);
    y = y(idx);

    Y = log(y);
    A = [ones(x), x];

    coefficients = A \ Y;
    a = exp(coefficients(1));
    b = coefficients(2);
endfunction

// apply power adjustment

function [a, b] = power_adjustment(x, y)
    idx = find((x > 0) & (y > 0));
    x = x(idx);
    y = y(idx);

    X = log(x);
    Y = log(y);
    A = [ones(X), X];

    coefficients = A \ Y;
    a = exp(coefficients(1));
    b = coefficients(2);
endfunction


coefficients = polinomial_adjustment(x, y, 2)
disp(coefficients)

[a, b] = exponential_adjustment(x, y)
disp(a, b)

[a, b] = power_adjustment(x, y)
disp(a, b)