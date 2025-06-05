// define values

x = [27.7; 28.2; 29; 31];
y = [4.0; 4.3; 4.1; 3.6];

// apply cubic spline

function [a, b, c, d] = cubic_spline(x, y)
    n = length(x);
    h = diff(x);
    
    A = zeros(n, n);
    rhs = zeros(n, 1);
    
    A(1,1) = 1;
    A(n,n) = 1;
    
    for i = 2:n-1
        A(i, i-1) = h(i-1);
        A(i, i) = 2 * (h(i-1) + h(i));
        A(i, i+1) = h(i);
        rhs(i) = 3 * ((y(i+1) - y(i)) / h(i) - (y(i) - y(i-1)) / h(i-1));
    end

    c = A \ rhs;
    
    a = y(1:$-1);
    b = zeros(n-1, 1);
    d = zeros(n-1, 1);
    
    for i = 1:n-1
        b(i) = (y(i+1) - y(i)) / h(i) - h(i) * (2*c(i) + c(i+1)) / 3;
        d(i) = (c(i+1) - c(i)) / (3 * h(i));
    end

    c = c(1:$-1);
endfunction

[a, b, c, d] = cubic_spline(x, y);

for i = 1:length(a)
    mprintf("S_%d(x) = %.3f + %.3f*(x - %.1f) + %.3f*(x - %.1f)^2 + %.3f*(x - %.1f)^3\n", ...
        i, a(i), b(i), x(i), c(i), x(i), d(i), x(i));
end
