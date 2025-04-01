// define f(x)

function [y] = f(x)
    y = x.^3 + 2*x.^2 - 3*x + 1;
endfunction

// apply false position method

function [root] = false_position_method(x0, x1, tol, max_iter)
    if f(x0) * f(x1) >= 0 then
        error("This interval does not contain a root")
    end

    for i = 1:max_iter
        x2 = (x1*f(x0) - x0*f(x1))/(f(x0)-f(x1));

        if abs(f(x2)) < tol then
            root = x2;
            return;
        end

        if f(x0)*f(x2) < 0 then
            x1 = x2;
        else
            x0 = x2;
        end
    end

    root = x2;
endfunction

disp(false_position_method(-4, -2, 1e-6, 100)) // display result