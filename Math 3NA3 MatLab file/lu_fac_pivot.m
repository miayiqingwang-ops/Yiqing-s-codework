function [L,U,P]=lu_fac_pivot(A)
% PA = LU factorization for matrix A
% L is lower triangular
% U is upper triangular
% P is permutation matrix that permutes A into stable form

n=length(A);P=eye(n);
for k=1:n-1 % Loop over columns
    [~,kk]=max(abs(A(k:n,k))) ; kk = kk + k-1;% Find coordinate kk of max element
    if kk ~= k % Interchange rows kk and k of matrix and permutation matrix
        temp = A(k,:) ; A(k,:) = A(kk,:) ; A(kk,:) = temp;
        temp = P(k,:) ; P(k,:) = P(kk,:) ; P(kk,:) = temp;
    end
    if A(k,k)==0
        break % A is singular
    end
    % Compute multipliers for column k and store them below diagonal where eliminated entries would go
    A(k+1:n,k)=A(k+1:n,k)/A(k,k); 
    
    A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - A(k+1:n,k)*A(k,k+1:n);
    
end
U=triu(A);           % Upper trianguler matrix from transformed matrix A
L=eye(n)+tril(A,-1); % Lower triangular matrix formed from multipliers


