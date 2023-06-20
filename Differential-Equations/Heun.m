function [x,y] = Heun(f,x0,y0,N,xf)
% eg f = @(x,y)(x+y);
% x0=0;y0=1;
%N=4; xf=0.4;

x(1) = x0;
y(1) = y0;
h =(xf-x0)/N;

for n=1:N
     x(n+1) = x(n) + h;
    f1 = (f(x(n),y(n)));
    y(n+1) = y(n) + (h/2)*(f1 + (f(x(n+1),(y(n)+(h*f1)))));
end

x = x';
y = y';
output = [x y];

%  disp('          x                  y');
%  disp(' ');
%  disp(output);

end
