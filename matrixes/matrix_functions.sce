// define matrix A and vector b

A = [1 -2 4; 1 1 1; 1 3 9];

b = [3; 0; -3];

// gauss elimination

disp(linsolve(A, b))

// inverse

disp(inv(A))

// LU decomposition

[L, U, P] = lu(A);
y = L \ (P * b);
x = U \ y;

disp(x)

disp(A*x)
disp(b)

// norm

disp(norm(A))

// condition number

disp(cond(A))

// eigenvalues

disp(spec(A))

// eigenvectors

[eigenvectors, diagonal_eigenvalues] = spec(A)

disp(eigenvectors, diagonal_eigenvalues)
