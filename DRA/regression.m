function [theta]=regression(X,Y,lambda)
[m,n]=size(X);
E=eye(n);
E(1,1)=0;
theta=pinv(X'*X+lambda*E)*X'*Y;
end