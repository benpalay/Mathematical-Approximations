function errorMat = ivpmethods(f,x0,y0,h,xf,ytrue)

N = (xf-x0)/h;

[x,y] = Euler(f,x0,y0,N,xf);
errorMat = zeros(N+1,4); 
errorMat(:,1) = x(:,1);
for m=2:4
    errorMat(1,m)=0;
end

for n=1:N
 errorMat(n+1,2) = abs(ytrue(n) - y(n+1));
 [x,y2] = Heun(f,x0,y0,N,xf);
 errorMat(n+1,3) = abs(ytrue(n) - y2(n+1));
 [x,y3] = rk4(f,x0,y0,N,xf);
 errorMat(n+1,4) = abs(ytrue(n) - y3(n+1));
end

% disp(' ')
% disp('Errors for 3 different schemes:')
% disp(' ')
% disp('     x           Euler          Heun         Rk4')  
% disp(' ');
% disp(errorMat);

end   

