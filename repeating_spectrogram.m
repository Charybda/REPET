function [ W ] = repeating_spectrogram( S, V, n, p, r)
%repeating_spectrogram funkcja tworz�ca spektrogram powtarzaj�cego si�
%modelu
%   spektrogram powtarzaj�cego si� modelu tworzony jest poprzez por�wnanie 
% odpowiadaj�cych sobie warto�ci z macierzy powtarzaj�cego si� segmentu [S] oraz spektrogramu sygna�u wej�ciowego [V] 

%utworzenie zmiennej o rozmiarach spektrogramu, w kt�rej przechowywany
%b�dzie powtarzaj�cy si� spektrogram
W=zeros(size(V,1),size(V,2));

%tworzenie powtarzaj�cego si� spektrogramu
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

