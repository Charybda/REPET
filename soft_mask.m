function [ M ] = soft_mask( W, V, n, m)
%soft_mask - funkcja obliczaj¹ca maskê czasowo-czêstotliwoœciow¹ 
%   Maska czasowo-czêstotliwoœciowa [M] obliczana jest na podstawie
%   spektrogramu wejœciowego [V] oraz spektrogramu powtarzaj¹cej siê czêœci
% W - spktrogram powtarzaj¹cyh siê elementów
% V - spektrogram wejœciowy
% n - size(V,1) - czêstotliwoœæ
% m - size(V,2) - czas

%utowrzenie zmiennej s³u¿¹cej do przechowywania maski
M=zeros(n,m);

%tworzenie maski
for i=1:n
    for j=1:m
        M(i,j)=W(i,j)./V(i,j);
    end
end

end

