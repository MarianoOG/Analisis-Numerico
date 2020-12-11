function [ F ] = intsimpson( x,y )
if (x(2)-x(1)==x(3)-x(2)&&length(x)==3&&length(y)==3)
    F=(x(2)-x(1))*(y(1)+4*y(2)+y(3))/3;
else
    disp('Datos de entrada erróneos')
    F=[];
end
end
