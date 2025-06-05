// define values

x = [0, 0.1, 0.2, 0.3, 0.4]
y = [4.2, 7.5, 9, 10.5, 7]

// apply trapezoidal rule

function [I] = trapezoidal_rule(x, y)
    n = length(x);
    h = x(2) - x(1);
    sum = y(1) + y(n);

    for i = 2:n-1
        sum = sum + 2*y(i);
    end

    I = (h/2) * sum;
endfunction

disp(trapezoidal_rule(x, y))