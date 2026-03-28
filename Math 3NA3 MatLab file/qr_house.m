function [R,c,x,res] = qr_house(A,b)
% Usage: [R,c,x,res] = qr_house(A,b)
% Computes QR transformation of matrix A to upper triangular form and
% solves least squares problem Rx = c by back substitution
% Input variables:
% A = matrix to be transformed
% b = right hand side
% Output variables:
% R = upper triangular matrix
% c = transformed right hand side
% x = solution of least square problem
% res = l2 norm (b-Ax)

c = b;
R = A;
[m,n] = size(R); % Find size of matrix 
nn = n;
if (m == n)
    nn = n-1;
end


for k = 1:nn % Loop over columns
  % Compute Household vector
  v = R(k:m,k);
  alpha = -sign(v(1))*norm(v);
  v(1) = v(1) - alpha;
  % perform the householder transform if v(2:n) and v are not zero
  if (norm(v(2:end)) > 1e-15 && norm(v) > 1e-15)
      v = v/norm(v);
      % transform A
      R(k:m, 1:n) = R(k:m, 1:n) - 2*v*(v'*R(k:m, 1:n));
      % transform rhs
      c(k:m) = c(k:m) - 2*v*(v'*c(k:m));
  end
end
x = backsub(R(1:n,1:n),c(1:n)); % Solve upper triangular system
res = norm(c(n+1:m),2); 