
% * *Benjamin Palay: 1815593*

function submission3

%% Question1Ai)
tol = 10^-5;
f = @(x) (exp(x) + 2.^-x + 2*cos(x) -6);
I0 = [1,2];
[rootB1,iterationcountB1] = bisectionSearch(f,tol,I0);
[rootF1,iterationcountF1] = RegularfalsiSearch(f,tol,I0);

F=@(x)(exp(x) + 2.^-x + 2*cos(x) -6);
Fprime = @(x)(exp(x) - 2.^-x - 2*sin(x));
x0 = 1;
[rootN1,iterationcountN1] = Newtonmethodscalar(F,Fprime,x0,tol);
disp('      '); disp('        ');
fprintf('%5s %5s %15s\n', '          Method   ','   root    ', '  Iteration count')
fprintf('%50s\n','__________________________________________') %after decimal point is how many decimal to include, letter is type, before decimal is field width
fprintf('%50s\n','                                          ')
fprintf('%15s %6.5f %4s %2i\n' ,  '        Bisection    ',rootB1,'   ',iterationcountB1)
fprintf('%15s %6.5f %4s %2i\n' ,  '       False position',rootF1,'   ',iterationcountF1)
fprintf('%15s %6.5f %4s %2i\n' ,  '         Newton      ',rootN1,'   ',iterationcountN1)

%% Question1Aii)
f = @(x) (1-(2/(x.^2 -2*x +2)));
I0 = [-1,1];
[rootB2,iterationcountB2] = bisectionSearch(f,tol,I0);
[rootF2,iterationcountF2] = RegularfalsiSearch(f,tol,I0);

F=@(x) (1-(2/(x.^2 -2*x +2)));
Fprime = @(x)((2/((x.^2 -2*x +2).^2))*(2*x -2));
x0 = 0.5;
[rootN2,iterationcountN2] = Newtonmethodscalar(F,Fprime,x0,tol);
disp('      '); disp('        ');
fprintf('%5s %5s %15s\n', '          Method   ','   root    ', '  Iteration count')
fprintf('%50s\n','__________________________________________')
fprintf('%50s\n','                                          ')
fprintf('%15s %6.5f %4s %2i\n' ,  '        Bisection    ',rootB2,'   ',iterationcountB2)
fprintf('%15s %6.5f %4s %2i\n' ,  '       False position',rootF2,'   ',iterationcountF2)
fprintf('%15s %6.5f %4s %2i\n' ,  '         Newton      ',rootN2,'   ',iterationcountN2)

%% Question1aiii)
f = @(x) (exp(x) + 2.^-x + 2*cos(x) -6);
F=@(x)(exp(x) + 2.^-x + 2*cos(x) -6);
Fprime = @(x)(exp(x) - 2.^-x - 2*sin(x));
x0=1;
I0 = [1,2];

plotting(f,tol,I0,F,Fprime,x0) 


%% Question1b)
f = @(x) (x - (tan(x)));
I0 = [0,2];
[rootB1,iterationcountB1] = bisectionSearch(f,tol,I0);
I0 = [2,5];
[rootB2,iterationcountB1] = bisectionSearch(f,tol,I0);
I0 = [5,8];
[rootB3,iterationcountB1] = bisectionSearch(f,tol,I0);
I0 = [7,10];
[rootB4,iterationcountB1] = bisectionSearch(f,tol,I0);
disp('      '); disp('        ');
disp('Using the Bisection method, the roots are ')
disp(rootB1); disp( rootB2); disp( rootB3);


%% Question2a)
tol = 10^-5;
x0 = [1;1;1];
F =@(x,y,z)[(sin(x)+y.^2+log(z)-7);(3*x+2.^y-z.^3+1);(x+y+z-5)];
 J = @(x,y,z)[cos(x), 2*y , 1/z; 3, log(2)*2.^y, -3*z.^2; 1, 1, 1];
 root= Newtonmethodsystem(F,J,x0,tol);
 disp('      '); disp('        ');
 disp('The root is   ')
disp(root)


%% Question2b)

F = @(x,y)[(x.^3 - 3*x*y.^2 -1); (3*x.^2*y - y.^3)];
J = @(x,y)[(3*x.^2 - 3*y.^2), -6*x*y; 6*x*y,(3*x.^2 - 3*y.^2)];
x0 = [-0.6;0.6];
root= Newtonmethodsystem(F,J,x0,tol);
disp('      '); disp('        ');
disp('The root is   ')
disp(root)

%% Question2c)
F = @(x,y)[(y - x.^2 +x); (x.^2/16 + y.^2 -1)];
J = @(x,y)[(-2*x +1), 1; x/8 , 2*y];
x0 = [-2;4]

root1 = Newtonmethodsystem(F,J,x0,tol);
x0 = [2;3]
root2 = Newtonmethodsystem(F,J,x0,tol);
disp('      '); disp('        ');
disp('The roots are   ')

disp(root1)
disp ('and')
disp(root2)


x = -4:0.1:4;
y = x.^2 - x;
figure(2); hold on
 xlabel('x')
ylabel('y')
title('Plot of y vs x for a parabola and ellipse')
plot(x,y);
y1 = sqrt(1 - (x.^2/16));
 y2 = -sqrt(1 - (x.^2/16));
figure(2);
plot(x,y1); hold on
figure(2);
plot(x,y2);
axis([-4 4 -8 20])



end