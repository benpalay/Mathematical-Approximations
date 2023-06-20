function [x,y] = Midpoint(f,x0,y0,N,xf)
% eg f = @(x,y)(x+y);
% x0=0;y0=1;
%N=4; xf=0.4;

x(1) = x0;
y(1) = y0;
h = (xf-x0)/N;

for n=1:N
     x(n+1) = x(n) + h;
    xh_2 = x(n) + (h/2); %x(i+h/2)
    yh_2 = y(n) + (h/2)*(f(x(n),y(n)));%y(i+h/2)
    y(n+1) = y(n) + h*(f(xh_2,yh_2));
   
end
x = x';
y = y';
output = [x y];

%  disp('          x                  y');
%  disp(' ');
%  disp(output);
end