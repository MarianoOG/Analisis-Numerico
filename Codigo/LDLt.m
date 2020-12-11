function [ L , D , Lt ] = LDLt( A )
%Factorizacion LLt - Algoritmo de Choleski
if (positiva(A))
    [n x]=size(A);
    L=eye(n);
    D=zeros(n);
    for i=1:n
        for j=1:i-1
            V(j)=L(i,j)*D(j,j);
            D(i,i)=D(i,i)+L(i,j)*V(j);
        end
        D(i,i)=A(i,i)-D(i,i);
        for j=i+1:n
            for k=1:i-1
                L(j,i)=L(j,i)+L(j,k)*V(k);
            end
            L(j,i)=(A(j,i)-L(j,i))/D(i,i);
        end
    end
    Lt=transpose(L);
else
    disp('la matriz no es positiva');
    L=[];
    D=[];
    Lt=[];
end
end