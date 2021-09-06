function [ b ] = beat_spectrum(V, n, m)
%beat_spectrum funkcja licz¹ca wektor 'b' tj. wektor, który odpowiada rytmowi
%('beat') w œcie¿ce muzycznej, liczony na podstawie podobieñstwa poszczególnych 
% fragmentów œcie¿ki wzglêdem siebie 
%   V - spektrogram sygna³u
%   n=size(V,1); %czêstotliwoœæ
%   m=size(V,2); %czas

B=zeros(n,m);
b=zeros(1,m);

for i=1:n
    for j=1:m
        Vik=0;
        for k=1:(m-j+1)
            Vik=Vik+power(V(i,k),2)*power(V(i,k+j-1),2);
        end
        B(i,j)=Vik/(m-j+1);
    end
end

for j=1:m
    b(j)=sum(B(:,j))/n;
    b(j)=b(j)/b(1);
end
%odrzucenie pierwszej wartoœci wektora b
b=b(2:m);
end

