// define f(t, y)

function [dy] = f(t, y)
    dy = 2 - t + 3 * y;
endfunction

// apply euler method

function [t, y] = euler_method(f, t0, y0, h, n_steps)
    t = zeros(1, n_steps + 1);
    y = zeros(1, n_steps + 1);

    t(1) = t0;
    y(1) = y0;

    for k = 1:n_steps
        y(k+1) = y(k) + h * f(t(k), y(k));
        t(k+1) = t(k) + h;
    end
endfunction

[t, y] = euler_method(f, 0, 1, 0.1, 2)
disp(y)