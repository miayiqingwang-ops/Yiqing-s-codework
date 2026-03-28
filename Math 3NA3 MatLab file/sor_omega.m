n = 5;
A = diag(ones(n,1)*4) + diag(ones(n-1,1)*2,-1) + diag(ones(n-1,1)*1,1);
D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1);
Gj = -inv(D)*(L+U);
rhoj = max(abs(eigs(Gj)));
rhosor = [];
for omega = 1:0.01:2
    Gsor = inv(D+omega*L)*((1-omega)*D-omega*U);
    rhosor = [rhosor; max(abs(eigs(Gsor)))];
end
figure
plot(1:0.01:2, rhosor);
hold on
omega_opt = 2/(1+sqrt(1-rhoj^2));
Gsor = inv(D+omega_opt*L)*((1-omega_opt)*D-omega_opt*U);
plot(omega_opt, max(abs(eigs(Gsor))), 'r*');
hold off
