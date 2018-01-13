function [ output ] = cost2( X,theta,Y )
%COST Summary of this function goes here
%   Detailed explanation goes here
output=sum((X*theta-Y).*(X*theta-Y));

end
