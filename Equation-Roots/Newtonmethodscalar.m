function  [root, iterationcountN] = Newtonmethodscalar(F,Fprime,x0,tol)

 x=x0;
 
iterationcountN = 0;
for i=1:2
    root =x; 
    x = x - F(x)/Fprime(x);
if ((abs(x-root))/(abs(x)))<tol
        break
    end
    iterationcountN = iterationcountN+1;
end
root = x;
end

 