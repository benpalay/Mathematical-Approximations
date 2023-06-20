
% Benjamin Palay
% 1815593
% Using N=20
function submission2

%%  Question 1a)	
A= [2 1 -1 2; 4 5 -3 6; -2 5 -2 6; 4 11 -4 8];
b=[5; 9; 4; 2];
x0=[0;0;0;0];
tol = 10^-6;

%%  Question 1ai)
 [x, iterationCount] = JacobiMethod(A,b,x0,tol)
 %%  Question 1aii)
 [x, iterationCount] = gaussSeidel(A,b,x0,tol)
 %%  Question 1aiii)
[x, iterationCount] = SOR(A,b,x0,tol)


%%  Question 1b) 
A = [3 1 -1; 1 -4 2; -2 -1 5];
b=[3;-1;2];
x0=[0;0;0];
tol = 10^-6;
%%  Question 1bi)
[x, iterationCount] = JacobiMethod(A,b,x0,tol)
%%  Question 1bii)
[x, iterationCount] = gaussSeidel(A,b,x0,tol)
%%  Question 1biii)
[x, iterationCount] = SOR(A,b,x0,tol)


%% Question 1c)
disp ('The spectral radius of B is  0.5000<1for 1b,') 
disp(' whereas the spectral radius= 2.7620 >1 for 1a.') 
disp('Therefore a diverges, b converges')


%% Question 2a)
disp('The matrix is diagnoally dominant')
%% Question 2b)
A = [4 -1 0 -1 0 0 0 0 0;-1 4 -1 0 -1 0 0 0 0;0 -1 4 0 0 -1 0 0 0;-1 0 0 4 -1 0 -1 0 0;0 -1 0 -1 4 -1 0 -1 0; 0 0 -1 0 -1 4 0 0 -1;0 0 0 -1 0 0 4 -1 0; 0 0 0 0 -1 0 -1 4 -1;0 0 0 0 0 -1 0 -1 4];
spectralRGS= findSpectral(A)
%% Question 2c)
disp ('w = 1.1716')
%% Question 2d)
disp('pJ=0.7071 and 0.7071^2 =0.5=pGS Therefore confirmed.') 
   disp('  p = w-1 = 0.1716 which is the same spctral radius obtained from its iterative matrix as shown above')
end