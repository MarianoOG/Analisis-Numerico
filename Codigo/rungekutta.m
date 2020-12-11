function [ W ] = rungekutta(to,tn,h,yo)
syms y t
%F=(1+t)/(1+y); %Modificar para ecuación diferencial diferente.
F=1+y/t+(y/t)^2;
Tn=to:h:tn;
W(1)=yo;
for i=2:length(Tn)
    K1=h*subs(subs(F,t,Tn(i-1)),y,W(i-1));
    K2=h*subs(subs(F,t,Tn(i-1)+h/2),y,W(i-1)+K1/2);
    K3=h*subs(subs(F,t,Tn(i-1)+h/2),y,W(i-1)+K2/2);
    K4=h*subs(subs(F,t,Tn(i)),y,W(i-1)+K3);
    W(i)=W(i-1)+(K1+2*K2+2*K3+K4)/6;
end

end