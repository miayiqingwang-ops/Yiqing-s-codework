format rat
A=eye(5,6);
A(:,6)=[1
11
98
802
6223];
for n=[0:4]
    i=n+1;
    A(i,1)=7^n;
    A(i,2)=5^n;
    A(i,3)=n;
    A(i,4)=n^2;
    A(i,5)=n^3;
end
rref(A)