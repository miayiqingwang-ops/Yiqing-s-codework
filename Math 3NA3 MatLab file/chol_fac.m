function [ L] = chol_fac(A)
% Usage: [L] = chol_fac(A)
% compute the cholesky factorization of A
% A = LL^T, where L is a lower triangular matrix
% input: positive symmetric matrix A
% output: L
[n, n] = size(A);
A(1,1) = sqrt(A(1,1)); 
A(2:n,1) = A(2:n,1)/A(1,1); 
for j = 2:1:n
A(j,j) = A(j,j) - A(j,1:j-1)*A(j,1:j-1)';
A(j,j) = sqrt(A(j,j));
A(j+1:n, j) = (A(j+1:n,j) - A(j+1:n,1:j-1)*A(j,1:j-1)')/A(j,j);
end
L = tril(A);



end

