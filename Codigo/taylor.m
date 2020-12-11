clc,format compact;
disp('Metodo de Taylor');
disp('Teniendo F=y-t^2+1; t dentro de [0,2]; y(0)=.5;h=0.2');
t0=0;
tn=2;
h=.2;
y0=.5;
disp('solución actual:');
y2=dsolve('Dy = y-t^2+1','y(0) = 0.5');
disp(y2);
syms y t
F=y-t^2+1;
F1=diff(F,t)+F*diff(F,y);
F2=diff(F1,t)+F*diff(F1,y);
F3=diff(F2,t)+F*diff(F2,y);
N=(tn-t0)/h+1;
T=t0:h:tn;
W2(1)=y0;
W4(1)=y0;
T2=F+F1*h/2;
T4=F+F1*h/2+F2*h^2/6+F3*h^3/24;
for i=2:N;
    W2(i)=W2(i-1)+h*(subs(subs(T2,y,W2(i-1)),t,T(i-1)));
    W4(i)=W4(i-1)+h*(subs(subs(T4,y,W4(i-1)),t,T(i-1)));
end
c=2+(tn-t0)/h;
C=cell(c,6);
C(1,:)={'ti','Valor exacto','Orden 2','Error 2°','Orden 4','Error 4°'};
for i=2:c
    C(i,1)={T(i-1)};
    C(i,2)={subs(y2,T(i-1))};
    C(i,3)={W2(i-1)};
    C(i,4)={abs(W2(i-1)-subs(y2,T(i-1)))};
    C(i,5)={W4(i-1)};
    C(i,6)={abs(W4(i-1)-subs(y2,T(i-1)))};
end
C