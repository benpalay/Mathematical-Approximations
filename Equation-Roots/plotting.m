function void = plotting(f,tol,I0,F,Fprime,x0)
a = I0(1);
 b = I0(2);

rootB = (a+b)/2;
iterationcountB=0; 
errorB = [];
errorF = [];
errorN = [];
for i=1:10
   check = rootB;%for stopping criteria
    if (f(rootB)*f(a))<0
        b= rootB; %new interval
        rootB = (rootB+a)/2;
       
    elseif (f(rootB)*f(a))>0
        a = rootB;
        rootB= (rootB+b)/2;  
    end

    iterationcountB = iterationcountB+1;
     errorB(i) =  (abs(rootB-check)/abs(rootB));
end
 figure(1); hold on 
 i = 1:10;
  xlabel('iterationCount')
ylabel('error')
title('Plot of the error vs iteration count')
x = i;
y1 = errorB(i);
 plot(x,y1,'DisplayName','Bisection'); %hold on

a = I0(1);
 b = I0(2);
rootF = (a*f(b) - b*f(a))/(f(b)-f(a));
iterationcountRF=0; 
for i=1:10
   check = rootF;%for stopping criteria
    if f(rootF)<0
        a= rootF; %new interval
        rootF = (rootF*f(b) - b*f(rootF))/(f(b)-f(rootF));
       
    elseif f(rootF)>0
        b = rootF;
        rootF= (a*f(rootF) - rootF*f(a))/(f(rootF)-f(a));

    end
    

    iterationcountRF = iterationcountRF+1;
    errorF(i) =  (abs(rootF-check))/abs(rootF);
end
 figure(1);  
 i = 1:10;
x = i;
y2 = errorF(i);
 plot(x,y2, 'DisplayName','FalsePosition'); 

legend
d=x0;
 
iterationcountN = 0;
for i=1:10
    rootN =d; 
    d = d - F(d)/Fprime(d);
    iterationcountN = iterationcountN+1;
    errorN(i) = (abs(d-rootN)/abs(d));
end

 figure(1);hold on  
 i = 1:10;
x = i;
y3 = errorN(i);
plot(x,y3,'DisplayName','NewtonXo=1'); 
hold off

d=1.5;
 
iterationcountN = 0;
for i=1:10
    rootN =d; 
    d = d - F(d)/Fprime(d);
    iterationcountN = iterationcountN+1;
    errorN(i) = (abs(d-rootN)/abs(d));
end

 figure(1);hold on  
 i = 1:10;
x = i;
y4 = errorN(i);
plot(x,y4,'DisplayName','NewtonXo=1.5'); 
hold off
end