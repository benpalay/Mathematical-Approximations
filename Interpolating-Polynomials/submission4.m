function submission4
%*Benjamin Palay: 1815594
%*Lab 4: Polynomial Interpolation

%% Question 1A)
format long
R = [1101.0; 911.3;636.0;451.1;233.5];
Tc = [25.113; 30.131;40.120;50.128;60.136];
[co,T] = NewtonInterp(R,Tc)
%% 
%% Question 1B)
Rq = [1050.1, 901.56, 875.11, 711.40, 545.27, 333.1, 200];
Tq = NewtonInterp2 (R,Tc,Rq)

figure(1); hold on
title('Plot of Tc vs R and Tq vs Rq')
xlabel('Temp ')
ylabel('Resistance ')
plot(Tc,R,'DisplayName', 'Tc vs R'); 
hold on
plot(Tq, Rq, 'DisplayName', 'Tq vs Rq'); hold off
legend('Tc vs R','Tq vs Rq')
%% Question 2)
N = 14; 
xdata = unifrnd(0,10,1,N);  %generate N random numbers between 0 and 10
xdata = sort(xdata) %put in ascending order

y = 2*xdata.^2  - xdata + 1   %f(x) = 2x^2 + x + 1
xq = unifrnd(0,10,1,N/2);
xq = sort(xq)
y2 = 2*xq.^2 - xq + 1;
yq = NewtonInterp2 (xdata',y',xq)

figure(2.0); hold on
title('Plot of y vs xq and yq vs xq')
xlabel('xq')
ylabel('y = 2*x.^2 + x + 1')
plot(xq,y2, 'g'); 
hold on
plot( xq,yq, '-b*'); hold off
legend('y vs xq','yq vs xq')

%% Question 3A)
n = [5 ,10 ,20 ,50];
xq = linspace(-5,5,101);

for i = 1:101
    y(i)= 1/(1+(xq(i).^2));
end

 for k = 1:4
xdata = linspace(-5,5, n(k));

for i = 1:n(k)
    ydata(i) = 1/(1+(xdata(i).^2));
end

yq = NewtonInterp2 (xdata',ydata',xq);

for i=1:101
md(i) = abs(y(i) - yq(i));
end
maxd(k) = max(md);
 end
 figure(3.0); hold on
title('Plot of y vs xq and yq vs xq for Runge Function')
xlabel('xq')
ylabel('y = 1/(1+(x.^2))')
plot(xq,y,'g'); 
hold on
plot( xq,yq, '-b*'); hold off
legend('y vs xq','yq vs xq')
 f(:,1) = n;
f(:,2) = maxd;
fprintf("   Maximum Difference Table:\n\n");
fTable = array2table(double(f),'VariableNames',...
    {'n','Max Difference'});
disp(fTable);

%% Question 3B)
% According to the Weierstrauss Appoximation Theorem, if a function is
% continuous and on a closed interval, there exists a polynomial that is
% similar to the function. However, this is not true for every function  
% As shown in 3a, certain functions have large oscillations when
% approximated using this method. For higher-degree functions, the
% interpolating polynomial diverges for large n. This is known as Runge's
% Phenomenon. 
 end