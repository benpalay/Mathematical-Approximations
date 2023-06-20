function [P,L,U] = LU(A)

[n m] = size(A); %n is number of rows and m is number of columns of an n x m matrix;

   V=zeros([n 1]);
   for l=1:n
    V(l)=1;
   end
   
   P = diag(V);
   L =P;
   
w=2;
        for k=1:n-1 
          for c=k+1:n
              
     for w=c:n
         
               if ((abs(A(w-1,c-1)))<(abs(A(w,c-1)))) %partial pivoting
            temp = A(w-1,:);
            A(w-1,:)=A(w,:);
            A(w,:)=temp ;
             temp2 = P(w-1,:);
            P(w-1,:)=P(w,:);
            P(w,:)=temp2;

               end
     end
               
          for c=k+1:n   
              if L(c,k) == 0
              L(c,k) = ((A(c,k))/(A(k,k)));
              end
        A(c,:) = A(c,:) - (((A(c,k))/(A(k,k)))*A(k,:));
        
          end
             
          end
     end

       U=A;
         
     
    
    
end