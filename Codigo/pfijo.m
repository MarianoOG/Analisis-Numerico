function [ raiz,t ] = pfijo( min,max,tol )
%METODO DE PUNTO FIJO
format long
format compact
syms x;
y=(1-8/(sqrt(-x^2+20^2)))*sqrt(-x^2+30^2)-8; %Modificar para otras funciones
dy=diff(y,x);
g=x-y/dy;

if(subs(g,x,min)<=max&&subs(g,x,min)>=min&&subs(g,x,max)>=min&&subs(g,x,max)<=max)
    p=[];
    e=[];
    
    p(1)=max;

    t=cell(1,4);
    t(1,:)={'n','Xn','f(Xn)','Error'};
    t(2,:)={1,p(1),subs(g,x,p(1)),'----------------------'};
   
    i=2;
    
    while (1)
        p(i) = subs(g,x,p(i-1));
        e(i) = abs((p(i)-p(i-1))/p(i));
    
        t(i+1,:)={i,p(i),subs(g,x,p(i)),e(i)};
    
        if(e(i)<tol),break; end;
        i=i+1;
    end
    
    raiz=p(i);
    
else
    disp('No es posible utilizar g(x) en ese intervalo');
    raiz=[];
    t=[];
end

end
