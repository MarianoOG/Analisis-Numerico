format long,format compact
%to=1;tn=2;h=.5;yo=2; %Modificar con otros valores iniciales
to=1;tn=3;h=.2;yo=0;

W=rungekutta(to,tn,h,yo); %Modificar en función para ecuación diferente

t=to:h:tn;
for j=1:length(t)
    %y(j)=sqrt(t(j)^2+2*t(j)+6)-1; %Modificar para solución diferente
    y(j)=t(j)*tan(log(t(j))); 
end

c=2+(tn-to)/h;
T=cell(c,4);
T(1,:)={'ti','Valor exacto','Aproximación','Error'};
for i=2:c
    T(i,1)={t(i-1)};
    T(i,2)={y(i-1)};
    T(i,3)={W(i-1)};
    T(i,4)={abs(W(i-1)-y(i-1))};
end
T