// define values

x = [1.3, 1.4, 1.5];
y = [1.7, 1.869, 2.037];

// apply numerical derivative

function [derivative] = numerical_derivative(x, y, index, method)
    n = length(x);
    h = x(2) - x(1);

    select method
    case "forward"
        if index >= n then
            error("Index too high for forward differences");
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

    case "second_central"
        if index <= 1 | index >= n then
            error("Invalid index for second central derivative");
        end
        h = x(index + 1) - x(index);
        derivative = (y(index + 1) - 2*y(index) + y(index - 1)) / (h^2);

    else
        error("Invalid method");
    end
endfunction

fd = numerical_derivative(x, y, 2, "forward");
bd = numerical_derivative(x, y, 2, "backward");
cd = numerical_derivative(x, y, 2, "central");
scd = numerical_derivative(x, y, 2, "second_central");

disp("Forward difference: " + string(fd));
disp("Backward difference: " + string(bd));
disp("Central difference: " + string(cd));
disp("Second difference: " + string(scd));
