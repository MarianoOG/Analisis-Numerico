function [ Q ] = neville(p,X)
syms x
f=3^x; %Modificar para otras funciones.
[a,n]=size(X);
for k=1:n
    Q(k,1)=subs(f,x,X(k));
end
for i=2:n
    for j=2:i
        Q(i,j)=( (p-X(i-j+1))*Q(i,j-1)-(p-X(i))*Q(i-1,j-1) )/(X(i)-X(i-j+1));
    end
end

end