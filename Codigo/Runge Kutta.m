to=1;tn=2;h=.5;yo=2; %Modificar con otros valores iniciales

W2=rungekutta(t0,tn,h,yo);

i=1:.2:3;
for j=1:length(i)
y(j)=i(j)*tan(log(i(j)))
end

c=2+(tn-t0)/h;
t=t0:h:tn;

T=cell(c,6);
T(1,:)={'ti','Valor exacto','Aproximación','Error','Orden 4','Error 4°'};
for i=2:c
    T(i,1)={t(i-1)};
    T(i,2)={subs(y,t(i-1))};
    T(i,3)={W2(i-1)};
    T(i,4)={abs(W2(i-1)-subs(y,t(i-1)))};
    T(i,5)={W4(i-1)};
    T(i,6)={abs(W4(i-1)-subs(y,t(i-1)))};
end
T