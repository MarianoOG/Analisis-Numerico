t0=0;tn=2;h=.2;y0=.5; %Modificar con otros valores iniciales

W2=ecdiftaylor(t0,tn,y0,h,2);
W4=ecdiftaylor(t0,tn,y0,h,4);
y=dsolve('Dy = y-t^2+1','y(0) = 0.5');

c=2+(tn-t0)/h;
t=t0:h:tn;

T=cell(c,6);
T(1,:)={'ti','Valor exacto','Orden 2','Error 2°','Orden 4','Error 4°'};
for i=2:c
    T(i,1)={t(i-1)};
    T(i,2)={subs(y,t(i-1))};
    T(i,3)={W2(i-1)};
    T(i,4)={abs(W2(i-1)-subs(y,t(i-1)))};
    T(i,5)={W4(i-1)};
    T(i,6)={abs(W4(i-1)-subs(y,t(i-1)))};
end
T