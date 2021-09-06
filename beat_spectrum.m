function [ b ] = beat_spectrum(V, n, m)
%beat_spectrum funkcja licz�ca wektor 'b' tj. wektor, kt�ry odpowiada rytmowi
%('beat') w �cie�ce muzycznej, liczony na podstawie podobie�stwa poszczeg�lnych 
% fragment�w �cie�ki wzgl�dem siebie 
%   V - spektrogram sygna�u
%   n=size(V,1); %cz�stotliwo��
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
%odrzucenie pierwszej warto�ci wektora b
b=b(2:m);
end

