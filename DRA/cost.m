function [ output ] = cost( X,theta,Y )
%COST Summary of this function goes here
%   Detailed explanation goes here
[p,q] = size(Y);
output=sum(abs(X*theta-Y)./Y)/p;

end

