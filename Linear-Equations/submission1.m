%APPM3021 Lab 1
%Benjamin Palay
%1815593
function submission1

%% Question 1a

A1 = [2 1 -1 2;4 5 -3 6;-2 5 -2 6;4 11 -4 8];b1=[5; 9; 4;2];% for question (a)%
x = gaussElimination(A1,b1)
%% Question 1aii)
H = [1 1/2 1/3 1/4; 1/2 1/3 1/4 1/5; 1/3 1/4 1/5 1/6; 1/4 1/5 1/6 1/7];
A = H(1:3,[3:-1:1]); b= -H(1:3,4);
x = gaussElimination(A,b)
 
%% Question 1aiii)
H = [1 1/2 1/3 1/4 1/5; 1/2 1/3 1/4 1/5 1/6; 1/3 1/4 1/5 1/6 1/7; 1/4 1/5 1/6 1/7 1/8;1/5 1/6 1/7 1/8 1/9];
A = H; b = [137/60; 29/20; 153/140; 743/840 ;1879/2520];
x = gaussElimination(A,b)

%% Question 1b

A2 = [3 1 -1;1 -4 2;-2 -1 5];b2 = [3;-1;2];% for question (b)
[x, U] = gaussEliminationModified(A2,b2)

%% Question 1c

A = [1 -1 2 -1;2 -2 3 -3;1 1 1 0;1 -1 4 3]; % for question (c)
 B = [-8 -10 -100;-20 -20 -250;-2 -2 -25;4 8 80];
[X, U, C] = gaussMultipleSystmes(A,B)

%% Question 2ai)

A = [1 -1 2 -1;2 -2 3 -3;1 1 1 0;1 -1 4 3];

disp(' Partial pivoting is to be used')
 [P,L,U] = LU(A)
 
 %% Question 2aii)
 A = [1 1 1 1 1;1 2 3 4 5;1 3 6 10 15;1 4 10 20 35;1 5 15 35 70];
 disp(' Partial pivoting is to be used')
 [P,L,U] = LU(A)
 %% Question 2b

 A = [1 -1 2 -1;2 -2 3 -3;1 1 1 0;1 -1 4 3];
 B = [-8 -10 -100;-20 -20 -250;-2 -2 -25;4 8 80];
x = LUsolve(A,B)

 
 %% Question 3
 
disp(' Instead of creating a new matrix P, simply')
disp('interchange the corresponding rows in the ')
disp('right hand vector (even if you do not know any values)') 
disp('as long as you know the size, you can keep track of the changes easily')