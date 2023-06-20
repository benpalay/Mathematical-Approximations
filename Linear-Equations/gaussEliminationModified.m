function [x, U] = gaussEliminationModified(A,b)
[n m] = size(A); %n is number of rows and m is number of columns of an n x m matrix;
 
X= zeros([m 1]); %returns a mx1 0 matrix
 

k=0; 
          for c=(n-1):-1:1
              
   
        b(c,:) = b(c,:) - (((A(c,k+1))/(A(n-k,k+1)))*b(n-k,:)); % do b first so A isnt yet modified
        A(c,:) = A(c,:) - (((A(c,k+1))/(A(n-k,k+1)))*A(n-k,:)); 
      
          end
k=k+1;
b(k,:) = b(k,:) - (((A(k,k+1))/(A(n-k,k+1)))*b(n-k,:)); % do b first so A isnt yet modified
        A(k,:) = A(k,:) - (((A(k,k+1))/(A(n-k,k+1)))*A(n-k,:)); 
        
       
         col=m; %able to substitute later without c in the for loop getting confused
    
     for d=1:n  %backwards substitution 
         
         q =0; 
         
         for c=1:m
             
             q = q + (A(d,c)*X(c,:)); %subtraction
             
         end
        
        X(n+1-d,:) = ((b(d,:) - q)/A(d,col));
         col = col-1;
         X=X;
     end
     x=X;
     U=A;
end
        
