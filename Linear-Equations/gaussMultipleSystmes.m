function [X, U, C] = gaussMultipleSystmes(A,B)
[n m] = size(A); %n is number of rows and m is number of columns of an n x m matrix;
[s f] = size (B);

X= zeros([s f]); %returns a sxf 0 matrix
   
       w=2;
        for k=1:n-1 
          for c=k+1:n
              
     for w=c:n
         
               if ((abs(A(w-1,c-1)))<(abs(A(w,c-1)))) %partial pivoting
            temp = A(w-1,:);
            A(w-1,:)=A(w,:);
            A(w,:)=temp ;
             temp2 = B(w-1,:);
            B(w-1,:)=B(w,:);
            B(w,:)=temp2;
            
            
               end
     end
               
          for c=k+1:n   
        B(c,:) = B(c,:) - (((A(c,k))/(A(k,k)))*B(k,:)); % do b first so A isnt yet modified
        A(c,:) = A(c,:) - (((A(c,k))/(A(k,k)))*A(k,:));
          end
              
          end
     end

       
         
     
    
     col=m; %able to substitute later without c in the for loop getting confused
    for k=1:f
     for d=n:-1:1  %backwards substitution 
         
         q =0; 
         
         for c=1:m
             
             q = q + (A(d,c)*X(c,k)); %subtraction            
         end
        
        X(d,k) = ((B(d,k) - q)/A(d,d));        
         end
     end
     U=A;
    C=B;
X=X;
 

end