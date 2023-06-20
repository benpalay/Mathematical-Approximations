function yq = NewtonInterp2 (x,y,xq)
format short
[n m] = size(x);
[N M] = size(xq);
[co,T] = NewtonInterp(x,y);
yq = [];
for i=1:M
    
    t = co(1); %use to add each successive co(k)*(x-x(k))s
    d = 1; %use to multiply all of the (x-x(k))'s
    
    for k = 2:n
        d = d*(xq(i) - x(k-1));
        t = t + d*co(k);
    end
    yq(i) = t;
    
end

end