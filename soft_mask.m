function [ M ] = soft_mask( W, V, n, m)
%soft_mask - funkcja obliczaj�ca mask� czasowo-cz�stotliwo�ciow� 
%   Maska czasowo-cz�stotliwo�ciowa [M] obliczana jest na podstawie
%   spektrogramu wej�ciowego [V] oraz spektrogramu powtarzaj�cej si� cz�ci
% W - spktrogram powtarzaj�cyh si� element�w
% V - spektrogram wej�ciowy
% n - size(V,1) - cz�stotliwo��
% m - size(V,2) - czas

%utowrzenie zmiennej s�u��cej do przechowywania maski
M=zeros(n,m);

%tworzenie maski
for i=1:n
    for j=1:m
        M(i,j)=W(i,j)./V(i,j);
    end
end

end

