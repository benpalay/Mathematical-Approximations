function x = LUsolve (A,b)
[n m] = size(A); %n is number of rows and m is number of columns of an n x m matrix;
[s f] = size(b);
X= zeros([s s]); %returns a mx1 0 matrix


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
       
       B=P*b;
       b1 = B(:,1);
b2 = B(:,2);
b3 = B(:,3);
%b4 = B(:,4);

       %using my original GE code
       [n m] = size(A); %n is number of rows and m is number of columns of an n x m matrix;
 

 
%A=A %just so it shows in published file
%b=b
 
    
x1 = zeros([m 1]);
y1(1,1) = b1(1)/L(1,1);
for c = 2:n
    
    y1(c,1)=(b1(c)-L(c,1:c-1)*y1(1:c-1,1))./L(c,c);%forward substitution
end
y1=y1;

for k=1:n-1 
          for c=k+1:n
              
               if (U(k+1,k+1)==0)
        error ('Zero in pivot, cannot proceed with normal Gauss Elimination')
   
               end
    %if ((c+k)<=n) %keep within matrix size
        y1(c,:) = y1(c,:) - (((U(c,k))/(U(k,k)))*y1(k,:)); % do y first so U isnt yet modified
        U(c,:) = U(c,:) - (((U(c,k))/(U(k,k)))*U(k,:)); 
 
    %end 
    
 
 
          end
     end
    
     col=m; %able to substitute later without c in the for loop getting confused
    
     for d=n:-1:1  %backwards substitution 
         
         q =0; 
         
         for c=1:m
             
             q = q + (U(d,c)*x1(c,:)); %subtraction
             
         end
         
        x1(d,:) = ((y1(d,:) - q)/U(d,col));
         col = col-1;
         
     end
     y1=y1
     x2 = zeros([m 1]);
y2(1,1) = b2(1)/L(1,1);
for c = 2:n
    
    y2(c,1)=(b2(c)-L(c,1:c-1)*y2(1:c-1,1))./L(c,c);%forward substitution
end
y2=y2;

for k=1:n-1 
          for c=k+1:n
              
               if (U(k+1,k+1)==0)
        error ('Zero in pivot, cannot proceed with normal Gauss Elimination')
   
               end
    %if ((c+k)<=n) %keep within matrix size
        y2(c,:) = y2(c,:) - (((U(c,k))/(U(k,k)))*y2(k,:)); % do y first so U isnt yet modified
        U(c,:) = U(c,:) - (((U(c,k))/(U(k,k)))*U(k,:)); 
 
    %end 
    
 
 
          end
     end
    
     col=m; %able to substitute later without c in the for loop getting confused
    
     for d=n:-1:1  %backwards substitution 
         
         q =0; 
         
         for c=1:m
             
             q = q + (U(d,c)*x2(c,:)); %subtraction
             
         end
         
        x2(d,:) = ((y2(d,:) - q)/U(d,col));
         col = col-1;
         
     end
     x3 = zeros([m 1]);
y3(1,1) = b3(1)/L(1,1);
for c = 2:n
    
    y3(c,1)=(b3(c)-L(c,1:c-1)*y3(1:c-1,1))./L(c,c);%forward substitution
end
y3=y3;

for k=1:n-1 
          for c=k+1:n
              
               if (U(k+1,k+1)==0)
        error ('Zero in pivot, cannot proceed with normal Gauss Elimination')
   
               end
    %if ((c+k)<=n) %keep within matrix size
        y3(c,:) = y3(c,:) - (((U(c,k))/(U(k,k)))*y3(k,:)); % do y first so U isnt yet modified
        U(c,:) = U(c,:) - (((U(c,k))/(U(k,k)))*U(k,:)); 
 
    %end 
    
 
 
          end
     end
    
     col=m; %able to substitute later without c in the for loop getting confused
    
     for d=n:-1:1  %backwards substitution 
         
         q =0; 
         
         for c=1:m
             
             q = q + (U(d,c)*x3(c,:)); %subtraction
             
         end
         
        x3(d,:) = ((y3(d,:) - q)/U(d,col));
         col = col-1;
         
     end
     
     
         X(:,1)=x1;
         X(:,2)=x2;
         X(:,3)=x3;
         X(:,4)=[];
         
         x=X;
end