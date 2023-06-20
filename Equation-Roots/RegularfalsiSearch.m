function [root,iterationcountRF] = RegularfalsiSearch(f,tol,I0)

 a = I0(1);
 b = I0(2);

root = (a*f(b) - b*f(a))/(f(b)-f(a));
iterationcountRF=0; 
for i=1:20
   check = root;%for stopping criteria
    if f(root)<0
        a= root; %new interval
        root = (root*f(b) - b*f(root))/(f(b)-f(root));
       
    elseif f(root)>0
        b = root;
        root= (a*f(root) - root*f(a))/(f(root)-f(a));

    end
    
    
    %stopping criteria
    if (abs(root-check))<tol
        break
    end
    iterationcountRF = iterationcountRF+1;
end

end
