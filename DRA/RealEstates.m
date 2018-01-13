T = readtable('newfile.csv');
T=table2array(T);
%X=[T(:,1) T(:,3:24)];
%(1,area,floor,year)%k = -0.0018
X = [T(:,1) T(:,21) T(:,6)];
Y=T(:,25);

[m,n] = size(X);
theta=zeros(n,1);
J=cost(X,theta,Y);
Theta=pinv(X'*X)*X'*Y;
%Theta = linearGD(X,theta,Y,0.000000000005,10000);
%Theta2=pinv(X'*X)*X'*Y;
%[Theta, CostHistory] = gradientDescent(X, theta, Y, 0.0000000008, 100000);
K=cost(X,Theta,Y);

YY = X*Theta;


figure(1);
%subplot(4,1,1);
stem(X(1:100,3),Y(1:100),'b--');
hold on;
stem(X(1:100,3),YY(1:100),'r--');
figure(2);
plot3(X(1:1000,3),X(1:1000,2),Y(1:1000),X(1:1000,3),X(1:1000,2),YY(1:1000),'s');
%patch(X(1:1000,3),X(1:1000,2),Y(1:1000));
%%%use p-value
%%%function can be used: fitlm,lasso
%%%forward selection with no prediction
%%%backward elimination
%%%LASSO
%%%validation set, training set
%%%k-fold corss a
