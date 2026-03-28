errorl=[];
errornorm=[];
Vf_clear=Vs;
for column = 1:16
    error=H*Vf_clear(:,column)-d(column)*Vf_clear(:,column);
    errorl=[errorl error];
    errornorm=[errornorm norm(error)];
end
