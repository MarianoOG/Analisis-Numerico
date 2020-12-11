function [ sal ] = positiva( A )
%Regresa '1' si la funcion es positiva o '0' si no lo es.
[a b]=size(A);
if (a==b)
    for i=1:a
        if (det(A(1:i,1:i))<=0)
            sal=0;
            break;
        else
            sal=1;            
        end
    end
else
    sal=0;
end
end

