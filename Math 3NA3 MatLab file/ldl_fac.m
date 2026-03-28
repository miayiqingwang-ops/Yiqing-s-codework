% fill up the code bewteen %------------
function [L,D] = ldl_fac(A)
% Usage: [L, D] = ldl_fac(A)
% compute L, D such that A = LDL'
% A is a sysmmetric matrix
% L is a lower triangular matrix with unit diagonal entries
% D is a diagonal matrix
% input: A
% output: L,D   
    [n,n] = size(A);
    A(2:n,1) = A(2:n,1)/A(1,1);
    for j = 2:1:n
    % compute v
        v = A(j,1:j-1)'.*diag(A(1:j-1,1:j-1));
    % compute dj, stored in Ajj
        A(j,j) = A(j,j) - A(j,1:j-1)*v;
    %-----------------------------------------------------------------
    % compute lij, stored in Aij
    
        A(j+1:n,j) =  (A(j+1:n,j)- A(j+1:n,1:j-1)*v)/A(j,j);
    end
    %-----------------------------------------------------------------

L = eye(n,n) + tril(A,-1);
D = diag(diag(A));

end

