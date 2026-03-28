% fill up the code bewteen %------------

%------------------------------------
% finish the for loop
N=[];
E=[];
Error=[];
for k=1:20
      n=10^k;
      e=((n+1)/n)^n;
      error=abs(exp(1)-e);
      N=[N,n];
      E=[E,e];
      Error=[Error,error];
end
%-------------------------------------


figure;
%-------------------------------------
% plot e versus n using semilogx
semilogx(N,E)
%-------------------------------------
xlabel('n');
ylabel('e');
title('Estimated value of e');
hold off
  
figure;
%-------------------------------------
loglog(N,Error)
%-------------------------------------
xlabel('n');
ylabel('abs error');
title('Absolute error');
hold off
  
  
  
  