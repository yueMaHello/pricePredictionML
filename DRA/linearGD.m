function [Theta] = linearGD(X,theta,Y,a,times)
%LINEAR Summary of this function goes here
%   Detailed explanation goes here
    m = size(theta,1);
    for i=1:times
       h=X*theta;
       err=h-Y;
       gradient=a*(1/m)*(X'*err);
       theta=theta-gradient;
    end
    Theta=theta;
    
end

