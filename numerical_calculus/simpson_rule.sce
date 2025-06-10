// define function

function y = f(x)
    y = sin(x);
endfunction

// apply simpson rule

function [I] = simpson_rule(f, a, b, n)
    if modulo(n, 2) <> 0 then
        error("The number of subintervals must be even");
    end

    h = (b - a) / n;
    x = a:h:b;
    y = f(x);

    odd_sum = sum(y(2:2:$-1));
    even_sum = sum(y(3:2:$-2));

    I = (h/3) * (y(1) + 4*odd_sum + 2*even_sum + y($));
endfunction

disp(simpson_rule(f, 0, %pi, 10))