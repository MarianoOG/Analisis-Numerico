function [ X ] = gaussjordan( A )
%GAUSS JORDAN
[a b]=size(A);

if (a+1==b)
    A=flipud(sortrows(A));
    c=0;
    p=zeros(1,a);
    for j=1:a %Columnas
        for i=1+c:a %Filas
            if(A(i,j)~=0)
                p(j)=i; %Selecciona primer numero diferente de 0.
                c=c+1;
                break;
            end
        end
        if(p(j)==j)
            A(j,:)=A(j,:)/A(j,j); %Crea el 1 de pivote.
            for k=1+c:a
                A(k,:)=A(k,j)*A(j,:)-A(k,:); %Crea los ceros debajo del pivote.
            end
            for k=1:c-1
                A(k,:)=A(k,:)-A(k,j)*A(j,:); %Crea los ceros arriba del pivote.
            end
        else
            disp('No existe solución única');
            break;
        end
    end
    X=zeros(1,a);
    for m=1:a
        X(m)=A(m,b); %Asigna variable.
    end
else
    X=[];
    disp('No puede utilizarse el método sobre esta matriz');
end

end