function [co,T] = NewtonInterp(x,y)
%x is a column vector, y is the corresponding y values 
%co is a row vector with the newton coefficients
%Tis the matrix containing th divided difference values, will be L or U
%triangular therfore padded where necessary with zeros
%eg x= [-4;-1;0;2;5]
% y=[1245;33;5;9;1335]


[n m] = size(y);
[p q] = size (x);

if n~=p
    error ('Inputs do not correspond in length')
end

T(:, 1) = y;  %column 1 is the column vector y

for i=1:(n-1) %populating the divided differecne table
    for k=1:i
        T(i+1,k+1) = (T(i+1,k)-T(i,k)) / (x(i+1)-x(i-k+1));
    end
end
T = T;
co = transpose(diag(T));


end