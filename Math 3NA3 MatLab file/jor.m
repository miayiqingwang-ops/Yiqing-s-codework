% fill up the code bewteen %------------
function [x, iter] = jor(A,b,omega,tol,max)
% Usage: [x,iter] = jor(A,b,omega,tol,max)
% Uses JOR iterative method to solve Ax = b
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
I = eye(n);
D_inv = diag(1./diag(A));

while (error > tol & k < max)
      k = k+1;
%----------------------------------------------------
      % update x and error
  
      x =  (I - omega*D_inv*A)*x + omega*D_inv*b;
      error = norm(A*x-b,2)/norm(b,2);  
%-----------------------------------------------------
end
iter = k;

end

