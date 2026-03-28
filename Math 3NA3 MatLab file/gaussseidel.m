function [x,iter] = gaussseidel(A,b,tol,max)
% Usage: [x,iter] = gaussseidel(A,b,tol,max)
% Uses Gauss-Seidel iteration to solve Ax = b
% Input variables:
% A = matrix
% b = rhs
% tol = l2 tolerance on residue
% max = maximum allowable number of iterations
% Output variables:
% x = solution
% iter = number of iterations 

[n,n] = size(A); % Find size of matrix

x = zeros(n,1); % Initial guess
k = 0; % Initialize iteration counter
error = norm(A*x-b,2)/norm(b,2); % Initial error
while (error > tol && k < max)
    k = k+1;
    x = forsub(tril(A), -triu(A,1)*x+b);
    error = norm(A*x-b,2)/norm(b,2);
end
iter = k;