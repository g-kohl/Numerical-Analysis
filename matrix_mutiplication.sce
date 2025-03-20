// define matrix sizes
rows_1 = 2
cols_1 = 5
rows_2 = 5
cols_2 = 3

M1 = zeros(rows_1, cols_1);
M2 = zeros(rows_2, cols_2);
R = zeros(rows_1, cols_2);

// attribute values

counter = 1

for i = 1:rows_1
    for j = 1:cols_1
        M1(i,j) = counter
        counter = counter + 1
    end
end

counter = 1

for i = 1:rows_2
    for j = 1:cols_2
        M2(i,j) = counter
        counter = counter + 1
    end
end

// compute product

for i = 1:cols_2
    for j = 1:rows_1
        for k = 1:cols_1
            R(j,i) = R(j,i) + (M1(j,k) * M2(k,i))
        end
    end
end

disp(R)
