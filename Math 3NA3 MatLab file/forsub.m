function [x] = forsub(L,b)
% Usage: [x] = forsub(l,b)
% Solve lower triangular system Lx = b by back substitution
% matrix is accessed column-wise, and information from previously
% calculated elements of x is integrated progressively by modifying rhs.
% Input:
% L = lower triangular matrix
% b = right hand side
% Output:
% x = solution vector

[n,n] = size(L); % Find size of system

for j = 1:n % Loop over columns
    if L(j,j)==0 % Stop if matrix is singular
       disp('Matrix is singular'); 
       break
    end
    x(j) = b(j)/L(j,j);	    
    b(j+1:n) = b(j+1:n) - L(j+1:n,j)*x(j); % Update right hand side
end  
x=x'; % Transform x from row to column vector       
     