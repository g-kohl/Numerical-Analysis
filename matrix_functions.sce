// define matrix A and vector b

A = [10 2 -1; -3 -6 2; 1 1 5];

b = [27; -61.5; -21.5];

// gauss elimination

disp(linsolve(A, b))

// inverse

disp(inv(A))

// LU decomposition

[L, U, P] = lu(A);
y = L \ (P * b);
x = U \ y;

disp(x)