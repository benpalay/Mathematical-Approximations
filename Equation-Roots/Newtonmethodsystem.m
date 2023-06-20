function [root, iterationcountN] = Newtonmethodsystem(F,J,x0,tol)
%  F can be a single function or a system of functions as a column vector, 
% Fprime can be the derivative of the single function OR the Jacobian matrix if F is a system. 
% x0 can be a scalar or a vector.

  x=x0;
 [n m] = size(x);
 
 
iterationcountN = 0;
for i=1:3
    root =x; 

if (n==2)
    b =F(x(1),x(2));
    d = inv(J(x(1),x(2)));
    c= d*b;
    x(1) = x(1) - c(1)
    x(2) = x(2) - c(2)
end
if (n==3)
    b =F(x(1),x(2),x(3));
    d = inv(J(x(1),x(2),x(3)));
    c= d*b;
    x(1) = x(1) - c(1);
    x(2) = x(2) - c(2);
    x(3) = x(3) - c(3);
end
num = norm((x - root),Inf);
 denum = norm(x,Inf);
 if (num/denum)<tol
    break
 end

    iterationcountN = iterationcountN+1;
end

if(n==3)
root = [x(1);x(2);x(3)];
end

if (n==2)
    root = [x(1);x(2)];
end
end

