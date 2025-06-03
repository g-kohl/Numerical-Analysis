// define values

x = [-2; 1; 2];
y = [5; 0; -3];

// apply lagrange interpolation

function [coefficients] = lagrange_interpolation(x, y)
    n = length(x);
    coefficients = zeros(1, n);

    for i = 1:n
        Li = 1;
        denominator = 1;

        for j = 1:n
            if j <> i then
                Li = conv(Li, [1, -x(j)]);
                denominator = denominator * (x(i) - x(j));
            end
        end

        coefficients = coefficients + (y(i) / denominator) * Li;
    end
endfunction


coefficients = lagrange_interpolation(x, y);
disp(coefficients);
