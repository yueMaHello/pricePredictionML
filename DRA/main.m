T = readtable('newfile.csv');
T=table2array(T);
T(:,2) = [];
T(:,2)=[];
T(:,22)=[];
[m0,n0] = size(T);
T_insert1 = T(:,21).*T(:,21);
%T_insert2 = T(:,21).*T(:,21).*T(:,21);
T = [T(:,1:n0-1) T_insert1 T(:,n0)];

[m,n] = size(T);

% Ttest = T(1000:1499,:);
% Ttrain = T;
% Ttrain(1000:1499,:) = [];
Ttrain = T(1,:);
%Ttest =  zeros(m,n);
Ttest = T(1:7:m,:);
i=2;
while i<=m
    Ttrain = cat(1,Ttrain,T(i,:));
    if mod(i,7)==0
        i=i+1;
        continue
    end
    i=i+1;
end



%without regularzation
[X1,Y1]=division(Ttrain);
theta=regression(X1,Y1,0);
[Tx1,Ty1]=division(Ttest);
c1=cost(Tx1,theta,Ty1);
%with regularzation
[m,n] = size(X1);
theta0 = zeros(n,1);
[lambda,costlist]=validation(Ttrain);
theta2=regression(X1,Y1,lambda);
c2=cost(Tx1,theta2,Ty1);
c0=cost(Tx1,theta0,Ty1);
figure(1);
plot(Tx1*theta2,'r');
hold on;
plot(Ty1,'b');
legend('Prediction','Real');
[thetab,FitInfo]=regressionByLasso(Ttrain);
CB=cost(Tx1,thetab,Ty1);
figure(2);
plot(Tx1*thetab,'r');
hold on;
plot(Ty1,'b');
legend('Prediction','Real');

