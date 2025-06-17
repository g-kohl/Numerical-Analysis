// define f(t, y)

function [dy] = f(t, y)
    dy = -t * y;
endfunction

// apply runge-kutta 4

function [t, y] = runge_kutta_4(f, t0, y0, h, n_steps)
    t = zeros(1, n_steps + 1);
    y = zeros(1, n_steps + 1);

    t(1) = t0;
    y(1) = y0;

    for k = 1:n_steps
        k1 = f(t(k), y(k));
        k2 = f(t(k) + h/2, y(k) + (h/2) * k1);
        k3 = f(t(k) + h/2, y(k) + (h/2) * k2);
        k4 = f(t(k) + h, y(k) + h * k3);

        y(k+1) = y(k) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
        t(k+1) = t(k) + h;
    end
endfunction

[t, y] = runge_kutta_4(f, 0, 1, 0.1, 9)
disp(y)