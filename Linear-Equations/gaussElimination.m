function x = gaussElimination(A,b)
[n m] = size(A); %n is number of rows and m is number of columns of an n x m matrix;

X= zeros([m 1]); %returns a mx1 0 matrix

%A=A %just so it shows in published file
%b=b
 
     
for k=1:n-1 
          for c=k+1:n
              
               if (A(k+1,k+1)==0)
        error ('Zero in pivot, cannot proceed with normal Gauss Elimination')
   
               end
    %if ((c+k)<=n) %keep within matrix size
        b(c,:) = b(c,:) - (((A(c,k))/(A(k,k)))*b(k,:)); % do b first so A isnt yet modified
        A(c,:) = A(c,:) - (((A(c,k))/(A(k,k)))*A(k,:)); 

    %end 
    


          end
     end
    
     col=m; %able to substitute later without c in the for loop getting confused
    
     for d=n:-1:1  %backwards substitution 
         
         q =0; 
         
         for c=1:m
             
             q = q + (A(d,c)*X(c,:)); %subtraction
             
         end
         
        X(d,:) = ((b(d,:) - q)/A(d,col));
         col = col-1;
         
     end
    
 x=X;
 

end