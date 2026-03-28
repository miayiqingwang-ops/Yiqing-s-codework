
Sz=[1 0;0 -1];
Sy=[0 -i;i 0];
Sx=[0 1;1 0];
I2=eye(2);
Szz=kron(kron(Sz,I2),I2)+kron(kron(I2,Sz),I2)+kron(kron(I2,I2),Sz);
%S_squre=SanP(Sx)^2+SanP(Sy)^2+SanP(Sz)^2;
Syy=kron(kron(Sy,I2),I2)+kron(kron(I2,Sy),I2)+kron(kron(I2,I2),Sy);
Sxx=kron(kron(Sx,I2),I2)+kron(kron(I2,Sx),I2)+kron(kron(I2,I2),Sx);
S_square= Sxx^2+Syy^2+Szz^2;
S_squareN =S_square/norm(S_square,2);
[V,D]=eig(S_square);
[V1,D1]=eig(S_squareN);







%function [A]=SanP(S)
%    A=kron(kron(S,I2),I2)+kron(kron(I2,S),I2)+kron(kron(I2,I2),S);
%end


