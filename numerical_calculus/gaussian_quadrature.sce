// define function

function y = f(x)
    y = x.^3 + 2;
endfunction


// apply gaussian quadrature

function [I] = gaussian_quadrature(f, a, b)
    xi = [-1/sqrt(3), 1/sqrt(3)];
    wi = [1, 1];

    I = 0;

    for i = 1:2
        t = xi(i);
        x = (b - a)/2 * t + (a + b)/2;
        I = I + wi(i) * f(x);
    end

    I = (b - a)/2 * I;
endfunction

disp(gaussian_quadrature(f, -1, 1))