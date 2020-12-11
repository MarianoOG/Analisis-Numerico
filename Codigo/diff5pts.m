function [ r ] = diff5pts( x,y )

op=1;
h=x(2)-x(1);

for j=1:length(x)-1;
    if (x(j)+h~=x(j+1))
        op=0;break;
    end
end

    if (length(x)==length(y)&&op)
        r(1)=(-25*y(1)+48*y(2)-36*y(3)+16*y(4)-3*y(5))/(12*h);
        for i=3:length(x)-2
            r(i)=(y(i-2)-8*y(i-1)+8*y(i+1)-y(i+2))/(12*h);
        end
        r(length(x))=(-25*y(length(x)-4)+48*y(length(x)-3)-36*y(length(x)-2)...
            +16*y(length(x)-1)-3*y(length(x)))/(12*h);
    else
        disp('No es posible utilizar el método')
        r=[];
    end
    
end