  Vf=eye(16);
%{
Vf(:,1)=Vs(:,1)-Vs(:,2)*(Vs(3,1)/Vs(3,2));
Vf(:,2)=Vs(:,2)-Vs(:,1)*(Vs(2,2)/Vs(2,1));
Vf(:,3)=Vs(:,3);
Vf(:,4)=Vs(:,4);
Vf(:,5)=Vs(:,5)-Vs(:,6)*(Vs(3,5)/Vs(3,6));
Vf(:,6)=Vs(:,6)-Vs(:,5)*(Vs(2,6)/Vs(2,5));
Vf(:,8)=Vs(:,8)-Vs(:,7)*(Vs(3,8)/Vs(3,7));
Vf(:,7)=Vs(:,7)-Vs(:,8)*(Vs(2,7)/Vs(2,8));
Vf(:,9)=Vs(:,9)-Vs(:,10)*(Vs(3,9)/Vs(3,10));
Vf(:,10)=Vs(:,10)-Vs(:,9)*(Vs(2,10)/Vs(2,9));
Vf(:,11)=Vs(:,11);
Vf(:,12)=Vs(:,12);
Vf(:,14)=Vs(:,14)-Vs(:,13)*(Vs(3,14)/Vs(3,13));
Vf(:,13)=Vs(:,13)-Vs(:,14)*(Vs(2,13)/Vs(2,14));
Vf(:,15)=Vs(:,15);
Vf(:,16)=Vs(:,16); 
%}
for i=1:2:16
    for j=1:6
        if abs(Vs(j,i))>10^(-8       )
           Vf(:,i)=Vs(:,i)-Vs(:,i+1)*(Vs(j,i)/Vs(j,i+1));
           
           if abs(Vs(j+1,i+1))>10^(-10)
               Vf(:,i+1)=Vs(:,i+1)-Vs(:,i)*(Vs(j+1,i+1)/Vs(j+1,i));
               break
           elseif  abs(Vs(j+2,i+1))>10^(-10)
               Vf(:,i+1)=Vs(:,i+1)-Vs(:,i)*(Vs(j+2,i+1)/Vs(j+2,i));
               break
           elseif  abs(Vs(j+3,i+1))>10^(-10)
               Vf(:,i+1)=Vs(:,i+1)-Vs(:,i)*(Vs(j+3,i+1)/Vs(j+3,i));
               break
           end    
        end
    end 
end

Vf=Vs;
for i=1:16
    Vf(:,i)=Vf(:,i)/norm(Vf(:,i));
end


Vf_clear=Vf;
Vf_clear=Vs;

for i=1:16
    for j=1:16
        if abs(Vf(j,i))<10^(-10)
           Vf_clear(j,i)=0;
        end
    end 
end

%Vf_clear=0-eye(16);
for i=1:16
    for j=1:16
        if Vf_clear(j,i) <0
           Vf_clear(:,i)= -Vf_clear(:,i);
           break
        elseif Vf_clear(j,i) >0
           break

        end
    end    
end

