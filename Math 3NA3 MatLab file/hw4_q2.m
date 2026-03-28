% fill up the code bewteen %-------------

% record elapsed time and error
time_chol = [];
time_plu = [];
error_chol = [];
error_plu = [];
hh=[];

for k = 2:1:10
    n = 2^k; % discretization
    h = 1/n;


    % set up the exact solution
    x = h:h:1-h;
    x = x';
    yexact = 1/4/(exp(2)-exp(-2))*(exp(2*x)-exp(-2*x))+1/4*x;

    %-----------------------------------------------------------------
    % set up A and b (using the vector x) 
    A=zeros(n-1);
    for j=1:n-2
        A(j,j+1)=-1;
    end
    A=A+A'+eye(n-1)*(2+4*h^2);
    
    b=(1:1:n-2)*(h^3);
    b=[b,(n-1)*h^3+1/2];
    
    b=b';

    %-----------------------------------------------------------------
    
    % cholesky factorization
    tchol_start = tic;

    %-----------------------------------------------------------------
    % compute ychol (solution of the linear system) using the Cholesky factorzation (to be completed)
    ychol = chol_solver(A,b);

    %-----------------------------------------------------------------
    
    tchol_end = toc(tchol_start);
    time_chol = [time_chol, tchol_end];
    error_chol =[error_chol, norm(ychol-yexact,inf)];
    
    % plu factorization
    tplu_start = tic;
    
    %-----------------------------------------------------------------
    % compute yplu (solution of the linear system) using the PLU factorization (to be completed)
    yplu =plu_solver(A,b);
    
    %-----------------------------------------------------------------
    tplu_end = toc(tplu_start);
    time_plu = [time_plu, tplu_end];
    error_plu =[error_plu, norm(yplu-yexact,inf)];    
    
    hh=[hh,h];
        
end

%-----------------------------------------------------------------
% complete the code for plotting 
figure;
loglog(hh,time_chol)
xlabel('h');
ylabel('time of Chol');
title('Time vs h for chol');
hold off

figure;
loglog(hh,time_plu)
xlabel('h');
ylabel('time of PLU');
title('Time vs h for PLU');
hold off

figure;
loglog(hh,error_chol)
%semilogx(hh,error_chol)
xlabel('h');
ylabel('error of chol');
title('error vs h for chol');
hold off

figure;
loglog(hh,error_plu)
%semilogx(hh,error_plu)
xlabel('h');
ylabel('error of PLU');
title('error vs h for PLU');
hold off
%-----------------------------------------------------------------
