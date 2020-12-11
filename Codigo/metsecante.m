function [ raiz,t ] = metsecante( min,max,tol )
%METODO DE SECANTE
format long
format compact
syms x;
y=x^5-4*x^3+x+1; %Modificar para otras funciones

[Xo,t]=biseccion(min,max,1e-2);

if (Xo)

    [i,a]=size(t);
    t(i,3)={'Aproximacion de Xo'};
    p=[];
    e=[];
    p(i-1)=cell2mat(t(i,6));
    p(i-2)=cell2mat(t(i-1,6));
    e(i-1)=cell2mat(t(i,8));
    
    if (tol<e(i-1))
        
        while (1)
            p(i) = p(i-1) - subs(y,x,p(i-1))*(p(i-2)-p(i-1))/(subs(y,x,p(i-2))-subs(y,x,p(i-1)));
            e(i) = abs((p(i)-p(i-1))/p(i));    
            t(i+1,:)={i,'------------------','------------------','------------------','------------------',p(i),subs(y,x,p(i)),e(i)};
            if(e(i)<tol),break; end;
            i=i+1;
        end
    
        raiz=p(i);
    else
        raiz=Xo;
    end
else
    raiz=[];
end

end