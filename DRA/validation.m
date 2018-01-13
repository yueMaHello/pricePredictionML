function [lambda,costlist]=validation(Train)
[p,q] = size(Train);
Ttrain1 = Train(1:p/4,:);
Ttrain2 = Train(p/4+1:p/2,:);
Ttrain3 = Train(p/2+1:3*p/4,:);
Ttrain4 = Train(3*p/4:p,:);
[Tx1,Ty1]=division(Ttrain1);
[Tx2,Ty2]=division(Ttrain2);
[Tx3,Ty3]=division(Ttrain3);
[Tx4,Ty4]=division(Ttrain4);
lambda=0;
t1=regression(cat(1,Tx2,Tx3,Tx4),cat(1,Ty2,Ty3,Ty4),lambda);
t2=regression(cat(1,Tx1,Tx3,Tx4),cat(1,Ty1,Ty3,Ty4),lambda);
t3=regression(cat(1,Tx1,Tx2,Tx4),cat(1,Ty1,Ty2,Ty4),lambda);
t4=regression(cat(1,Tx1,Tx2,Tx3),cat(1,Ty1,Ty2,Ty3),lambda);
c=cost(Tx1,t1,Ty1)+cost(Tx2,t2,Ty2)+cost(Tx3,t3,Ty3)+cost(Tx4,t4,Ty4);

costlist=[];
costlist(1)=c;
for i=0:15000
    
    t1=regression(cat(1,Tx2,Tx3,Tx4),cat(1,Ty2,Ty3,Ty4),i);
    t2=regression(cat(1,Tx1,Tx3,Tx4),cat(1,Ty1,Ty3,Ty4),i);
    t3=regression(cat(1,Tx1,Tx2,Tx4),cat(1,Ty1,Ty2,Ty4),i);
    t4=regression(cat(1,Tx1,Tx2,Tx3),cat(1,Ty1,Ty2,Ty3),i);

    c0=cost(Tx1,t1,Ty1)+cost(Tx2,t2,Ty2)+cost(Tx3,t3,Ty3)+cost(Tx4,t4,Ty4);
    costlist(i+1)=c0;
    if c0<c
        lambda=i;
        c=c0;
    end
end

end



