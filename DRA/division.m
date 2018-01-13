function [X,Y] = division(T)
[m,n] = size(T);
X = T(:,1:n-1);
Y = T(:,n);
end