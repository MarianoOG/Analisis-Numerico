function [ r ] = diff3pts( x,y )

op=1;
h=x(2)-x(1);

for j=1:length(x)-1;
    if (x(j)+h~=x(j+1))
        op=0;break;
    end
end

    if (length(x)==length(y)&&op)
        r(1)=(y(1)-4*y(2)+3*y(3))/(2*h);
        for i=2:length(x)-1
            r(i)=-(y(i-1)-y(i+1))/(2*h);
        end
        r(length(x))=(y(length(x)-2)-4*y(length(x)-1)+3*y(length(x)))/(2*h);
    else
        disp('No es posible utilizar el método')
        r=[];
    end
    
end