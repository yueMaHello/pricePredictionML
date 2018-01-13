function[theta,FitInfo]=regressionByLasso(Train)
[X,Y]=division(Train);
[m,n]=size(X);
theta=zeros(n,1);
c=cost(X,theta,Y);
[b,FitInfo]=lasso(X,Y,'NumLambda',15000,'CV',4);

[M,N]=size(b);

for i=1:N
    theta1=b(:,i);
    c0=cost(X,theta1,Y);
    if c0<c
        theta=theta1;
        c=c0;
    end
end
end