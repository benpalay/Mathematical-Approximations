function spectralRGS= findSpectral(A)

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


Bj = -inv(D)*(L+U); %used for spectral radius

spectralRJacobi = max(abs(eig(Bj)))

Bgs = -inv(D+L)*(U);

spectralRGS = max(abs(eig(Bgs)));

lamda = max(abs(eig(Bj)));
w = 2/(1+sqrt(1-(lamda^2))); %finding optimal omega for SOR

Bw = (inv(D+(w*L)))*(((1-w)*D)-(w*U));

spectralRSOR = max(abs(eig(Bw)))

end
