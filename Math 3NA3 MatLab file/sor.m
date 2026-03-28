function [x,iter] = sor(A,b,omega,tol,max)
% Usage: [x,iter] = sor(A,b,omega,tol,max)
% Uses SOR iteration to solve Ax = b
% Input variables:
% A = matrix
% b = rhs
% omega = relaxation parameter
% tol = l2 tolerance on residue
% max = maximum allowable number of iterations
% Output variables:
% x = solution
% iter = number of iterations 

[n,n] = size(A); % Find size of matrix
x = zeros(n,1); % Initial guess
k = 0; % Initialize iteration counter
error = norm(A*x-b,2)/norm(b,2); % Initial error
D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1);



while (error > tol & k < max)
      k = k+1;
      x = forsub(D+omega*L, ((1-omega)*D-omega*U)*x+omega*b);
      error = norm(A*x-b,2)/norm(b,2);
end
iter = k;