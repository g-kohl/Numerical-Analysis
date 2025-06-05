// define values

x = [1.3, 1.4, 1.5];
y = [1.7, 1.869, 2.037];

// apply numerical derivative

function [derivative] = numerical_derivative(x, y, index, metodo)
    n = length(x);
    h = x(2) - x(1);

    select metodo
    case "forward"
        if index >= n then
            error("Index too low for forward differences");
        end

        derivative = (y(index + 1) - y(index)) / h;

    case "backward"
        if index <= 1 then
            error("Index too low for backward differences");
        end

        derivative = (y(index) - y(index - 1)) / h;

    case "central"
        if index <= 1 | index >= n then
            error("Invalid index for central differences");
        end

        derivative = (y(index + 1) - y(index - 1)) / (2*h);

    else
        error("Invalid method");
    end
endfunction

fd = numerical_derivative(x, y, 2, "forward");
bd = numerical_derivative(x, y, 2, "backward");
cd = numerical_derivative(x, y, 2, "central");

disp("Forward difference: " + string(fd));
disp("Backward difference: " + string(bd));
disp("Central difference: " + string(cd));
