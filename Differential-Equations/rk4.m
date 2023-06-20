function [x,y] = rk4(f,x0,y0,N,xf)
% eg f = @(x,y)(x+y);
% x0=0;y0=1;
%N=4; xf=0.4;

x(1) = x0;
y(1) = y0;
h = (xf-x0)/N;

for n=1:N
     x(n+1) = x(n) + h;
     xh_2 = x(n) + (h/2); %x(i+h/2)
     k1 = (h*(f(x(n),y(n))));
     k2 = h*f(xh_2,(y(n)+(k1/2)));
     k3 = h*f(xh_2,(y(n)+(k2/2)));
     k4 = h*f((x(n)+h),(y(n)+k3));
     y(n+1) = y(n) + (1/6)*(k1 + (2*k2) + (2*k3) + k4);
end

x = x';
y = y';
output = [x y];
% disp('          x                  y')
% disp(' ')
% disp(output)

end