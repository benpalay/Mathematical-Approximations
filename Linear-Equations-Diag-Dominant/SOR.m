function [x, iterationCount] = SOR(A,b,x0,tol)

[n m] = size(A);

for r=1:n  %creating matrices D,L,U
for c=1:m
    if c==r
        D(r,c)=A(r,c);
    end
    if c~=r
        D(r,c)=0;
        if r>c
            L(r,c)=A(r,c);
            U(r,c)=0;
        end
        if r<c
            U(r,c)=A(r,c);
             L(r,c)=0;
        end
    end
end
end

Bj = -inv(D)*(L+U); %B of Jacobi
lamda = max(abs(eig(Bj)));
w = 2/(1+sqrt(1-(lamda^2))); %finding optimal omega for SOR

Real = isreal(w); %if w is complex , returns a zero
if ((w<0) || (w>2) || (Real==0))
   
    disp( 'This method diverges')
    disp('but here is the output after 20 iterations:')

end
    
iterationCount=0;
xi=x0;
N=20;

for iterate=1:N
    
y = (w*b) + ((((1-w)*D)-(w*U))*xi);
Q = (D+(w*L))\y;

for k=1:n
   xip1(k,1) = Q(k,1); %x(I+1)
end

temp=xi;
xi=xip1;

% stopping criteria
 num = norm((xip1 - temp),Inf);
 denum = norm(xip1,Inf);
 if (num/denum)<tol
    break
 end
    iterationCount = iterationCount+1;
end
x = xip1;
end