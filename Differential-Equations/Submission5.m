function Submission5
% Benjamin Palay
% 1815593

%% Question 1A)

f = @(x,y) (1-(4/3)*x)*y;
x0 = 0;xf = 3;y0 = 1;
[x1,y1] = Euler(f,x0,y0,10,xf);%for N=10
[x2,y2] = Euler(f,x0,y0,50,xf);%for N=50
[x3,y3] = Euler(f,x0,y0,100,xf);%for N=100
solution = exp(x3-(2./3).*(x3.^2));%for exact solution

figure(1)
plot(x1,y1,'-b.', ...
     x2,y2, '-r.', ...
     x3,y3,'-y.',...
     x3,solution, '-g.')
xlabel('x');
ylabel('y');
legend('N=10', 'N=50', 'N=100', 'Exact');
title('Euler with varying step size');


%% Question1B)

format short
 f = @(x,y)(1-(4/3)*x)*y; y0=1;x0=0;xf=3;N=300;
[x1,y1] = Euler(f,x0,y0,N,xf);
[x1,y2] = Heun(f,x0,y0,N,xf);
[x1,y3] = Midpoint(f,x0,y0,N,xf);
[x1,y4] = rk4(f,x0,y0,N,xf);

 figure(2)
plot(x1,y1, '-b*', ...
     x1,y2, '-o', ...
     x1,y3,'-r.',...
     x1,y4, '-y.')
xlabel('x');
ylabel('y');
legend('Euler', 'Heun', 'Midpoint', 'RK4');
 title('Solving the IVP with 4 different methods');


%% Question 2

t0 = 0; tf = 0.05;
xspan = [t0 tf];
N = 50; %assuming enough
y0 = [0, 0, 0, 0];

%let q1=y1, y2=y1(dash),y3=q2, y4=y3(dash)to get f, where f is dy/dx(y is a
%vector)

f = @(t,y) [y(2) ; 7500 + y(2)*(-625/3) + y(1)*(-1/(6*(10^(-6)))) + y(3)*(1/(6*(10^(-6)))) ;y(4);y(1)*(1/(6*(10^(-6)))) + y(3)*(-2/(6*(10^(-6)))) + y(4)*(-625/3)];

[x,y] = RK4system(f,xspan,y0,N);

figure(3)
plot(x, y(:,2),'-b.', x, y(:,4),'-g.');
xlabel('Time');
ylabel('Current');
legend('i1', 'i2');
title('i1 and i2 vs time');

%% Question 3
% y''' + y*y'' = 0

xspan = [0 5];
N = 50; %assuming enough
y0 = [0 0 1];
f = @(x,y) [y(2) ; y(3) ; -y(1)*y(3)];

[x,y] = RK4system(f, xspan, y0, N);

figure(4)
plot(x, y(:,2))
xlabel('x');
ylabel('y(dash)');
title( 'y(dash) vs x');

%% Question 4

xspan = [0 2];
N = 50;
y0a = [1.0 -4.1];
y0b = [1.0 -4.101];

f = @(x,y) [y(2) ; 16.81*y(1)];

[xa,ya] = RK4system(f, xspan, y0a, N);
[xb,yb] = RK4system(f, xspan, y0b, N);
figure(5)
plot(xa,ya(:,1), '-b.', ...
     xa,yb(:,1),'-r.')
      
xlabel('x');
ylabel('y');
legend('yA', 'yB');
 title('Plot of solutions with differing initial conditions');

%% Question 4 writing

% The analytic solution to the above differential equation is given by:
% y = k(exp(sqrt(16.81)(x))) + m(exp(-sqrt(16.81)(x)));
% For the initial conditions in 'a', k=0 and m=1; Therefore the first term
% is zero.
% For the initial conditions in 'b', k=-0.00012195 and m=1.000121951; 

% The first term for condition a is zero, and so that exponential will
% not affect y at all. So since for condition b, both exponentials are in use, 
% even though the difference looks very small, over
% many iterations and using an exponential, this difference will have
% exponential affect on the outcome. So that is why there is a large
% difference in the two solutions.

%% Question 5
format shortE
f = @(x,y) (1-(4/3)*x)*y;
x0=0;xf=3;y0=1;
h=0.1;
N = (xf-x0)/h;
x=x0;

for n=1:N
   x=x+h;
    ytrue(n) = exp(x-(2./3).*(x.^2));
    
end

errorMat = ivpmethods(f,x0,y0,h,xf,ytrue);
x1 = errorMat(:,1);
y2 = errorMat(:,2);
y3 = errorMat(:,3);
y4 = errorMat(:,4);

figure(6)
plot(x1,y2, '-b.', ...
      x1,y3, '-g.', ...
     x1,y4,'-r.')
      
xlabel('x');
ylabel('y');
legend('Euler', 'Heun', 'RK4');
 title('Absolute Error for different schemes');
 
 
end