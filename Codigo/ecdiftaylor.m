function [ W ] = ecdiftaylor( t0,tn,y0,h,n )
syms y t
F(1)=y-t^2+1; %Modificar para ecuación diferencial diferente.
for i=2:n
    F(i)=diff(F(i-1),t)+F(1)*diff(F(i-1),y);
end
N=(tn-t0)/h+1;
T=t0:h:tn;
W(1)=y0;
Tn=0;
for i=1:n
    Tn=Tn+F(i)*h^(i-1)/factorial(i);
end
for i=2:N;
    W(i)=W(i-1)+h*(subs(subs(Tn,y,W(i-1)),t,T(i-1)));
end
end