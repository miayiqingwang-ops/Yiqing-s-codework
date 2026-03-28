% fill up the code bewteen %------------
x = [];
b=2;
for d1 = 0:(b-1)
    for d2 = 0:(b-1)
        for E = -2:2
            % x contains all positive floating point numbers
            %-----------------------------------------------
            number=(1+d1/b+d2/b^2)*b^E;
            x= [x,number ];
            %-----------------------------------------------
            
        end
    end
end
% add negative floating point numbers and 0 to x
% ----------------------------------------------
x = [-x,0,x];
% ----------------------------------------------
y = zeros(1,41);
figure
plot(x,y,'-+');
hold off

