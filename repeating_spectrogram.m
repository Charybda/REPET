function [ W ] = repeating_spectrogram( S, V, n, p, r)
%repeating_spectrogram funkcja tworz¹ca spektrogram powtarzaj¹cego siê
%modelu
%   spektrogram powtarzaj¹cego siê modelu tworzony jest poprzez porównanie 
% odpowiadaj¹cych sobie wartoœci z macierzy powtarzaj¹cego siê segmentu [S] oraz spektrogramu sygna³u wejœciowego [V] 

%utworzenie zmiennej o rozmiarach spektrogramu, w której przechowywany
%bêdzie powtarzaj¹cy siê spektrogram
W=zeros(size(V,1),size(V,2));

%tworzenie powtarzaj¹cego siê spektrogramu
for i=1:n
    for l=1:p
        for k=1:r
            if l+(k-1)*p<=size(V,2)
                W(i,l+(k-1)*p)=min(S(i,l),V(i,l+(k-1)*p));    
            end
        end
    end
end

end

