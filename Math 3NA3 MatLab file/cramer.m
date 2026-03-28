% fill up the code bewteen %------------

error1 = [];
error2 = [];
condition = [];
% run 20 tests
for i = 1:1:20
% set up A and b
    perturbation = 10^(-10);
    a = rand(2,1);
    A = [a,a+rand(2,1)/norm(rand(2,1),1)*perturbation];
    b = A(:,2) + rand(2,1)/norm(rand(2,1),1)*perturbation;

%-----------------------------------------------------------------
% compute the condition number of matrix A corresponding to 1-norm
    condition1=(norm(A,1)*norm(A^-1,1));
    condition = [condition; condition1];
%-----------------------------------------------------------------

% Gaussian elimination
    x1 = A\b;
    r1 = A*x1-b;
%-----------------------------------------------------------------
% estimate the relative backward error using the 1-norm of r1, x1 and A
    fwderror=abs(norm((x1-r1),1));
    error1 = [error1; fwderror/condition1];
%-----------------------------------------------------------------


% Cramer's rule
    detA = A(1,1)*A(2,2)-A(1,2)*A(2,1);
    x2 = [];
%-----------------------------------------------------------------
% compute the entries of x2 using Cramer's rule
    x2(1) = (A(1,1)* b(1) - A(1,2) *b(2))/ detA;
    x2(2) = (-A(2,1)* b(1) + A(1,1) *b(2))/ detA;
    x2 = x2';
%-----------------------------------------------------------------

    r2 = A*x2-b; 

%----------------------------------------------------------------
% estimate the relative backward error using 1-norm of r2, x2 and A
    fwderror=abs(norm((x2-r2),1));
    error2 = [error2; fwderror/condition1];
%----------------------------------------------------------------

end
mean(error1)
mean(error2)
mean(condition)

 


