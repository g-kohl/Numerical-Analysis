// define g(x)

function [y] = g(x)
    y = sqrt(2 + x);
endfunction

// apply fixed point iteration method

function [root] = fixed_point_iteration_method(x0, tol, max_iter)
    for i = 1:max_iter
        x1 = g(x0);

        if abs(x1-x0) < tol then
            root = x1;
            return;
        end

        x0 = x1;
    end

    root = x1;
endfunction

disp(fixed_point_iteration_method(1.2, 1e-6, 100))