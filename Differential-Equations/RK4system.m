function [x,y]= RK4system(f,xspan,y0,N)
%xspan = [x0 xf] 
%y0 is a row vector 
x0 = xspan(1);
xf = xspan(2);
h = (xf-x0)/N
y(:,1) = y0;
x(1)=x0;

for n=1:N
     x(n+1) = x(n) + h;
end
     for j=1:N
     k1 = f(x(j),y(:,j)); %y(:,j) is the 'j'th column of the vector y i.e the function is taken for each y value
     k2 = f(x(j) + h/2,(y(:,j)+ k1/2*h));
     k3 = f(x(j) +h/2,(y(:,j)+ k2/2*h));
     k4 = f((x(j)+h),(y(:,j)+ k3*h));
     y(:,j+1) = y(:,j) + (h/(6))*(k1 + (2*k2) + (2*k3) + k4);
     end

x=x';
y=y';


end 