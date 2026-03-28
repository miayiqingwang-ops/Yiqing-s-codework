A=[1 100 100^2;1 110 110^2;1 120 120^2];
b=[6.41;8.04;9.38];
x=inv(A.'*A)*A.'*b;

for N=200:1000
    y=[1;N;N^2];
    if dot(y,x)>3600
        disp([N dot(y,x)])
        break
    end
end


