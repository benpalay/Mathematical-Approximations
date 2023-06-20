function [x, iterationCount] = JacobiMethod(A,b,x0,tol)
format short
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


B = -inv(D)*(L+U); %used for spectral radius

spectralRB = max(abs(eig(B))); %finding the spectral radius to see if converges

if spectralRB>1
    disp( 'This method diverges')
    disp('but here is the output after 20 iterations:')
end

iterationCount=0;
xi=x0;
N=20;
for iterate=1:N
    
y = b - ((L+U)*xi);

for k=1:n
    
   xip1(k,1) = y(k)/D(k,k); %x(I+1)
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


%I have set the defualt array variable to long
end