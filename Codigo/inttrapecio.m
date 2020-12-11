function [ F ] = inttrapecio( x0,y0,x1,y1 )
if (x1>x0)
    F=(x1-x0)*(y0+y1)/2;
else
    disp('Datos de entrada erróneos')
    F=[];
end
end

