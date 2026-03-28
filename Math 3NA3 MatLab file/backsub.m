function [x] = backsub(U,b)
% Usage: [x] = backsub(U,b)
% Solve upper triangular system Ux = b by back substitution
% matrix is accessed column-wise, and information from previously
% calculated elements of x is integrated progressively by modifying b.
% Input:
% U = upper triangular matrix
% b = right hand side
% Output:
% x = solution vector

[n,n] = size(U); % Find size of square matrix u

for j = n:-1:1 % Loop backwards over columns
    if U(j,j)==0 % Stop if matrix is singular
       disp('Matrix is singular'); 
       break
    end
    x(j) = b(j)/U(j,j);
    b(1:j-1) = b(1:j-1) - U(1:j-1,j)*x(j); % Update right hand side to avoid re-calculating sum
end  
x=x'; % Transform x from row to column vector       
     