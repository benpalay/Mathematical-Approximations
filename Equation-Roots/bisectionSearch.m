function [root,iterationcountB]  = bisectionSearch(f,tol,I0)

 a = I0(1);
 b = I0(2);

root = (a+b)/2;
iterationcountB=0; 
for i=1:4
   check = root;%for stopping criteria
    if (f(root)*f(a))<0 |(f(root)*f(a))==0
        b= root; %new interval
        root = (root+a)/2
       
    elseif (f(root)*f(a))>0
        a = root;
        root= (root+b)/2
        
    end
    
    %stopping criteria
    if (abs(root-check))<tol
        break
    end
    iterationcountB = iterationcountB+1;
end

end