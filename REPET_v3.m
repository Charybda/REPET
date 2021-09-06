function [p, xlen, fs] = REPET_v3(title_original)
%REPET_v3 - funkcja przeprowadzaj¹ca algorytm REPET za pomoc¹ poszczególnych
%funkcji 

%Zdefiniowanie zmiennych tekstowych zwi¹zanych z nazwami poszczególnych
%plików dŸwiêkowych
background='_tlo';
foreground='_wokal';

%Rozdzielenie tytu³u od formatu
C=strsplit(title_original,'.');
title=char(C(1));
format=['.' char(C(2))];

%Wczytanie danego pliku dŸwiêkowego
[x, fs]=audioread(title_original);

%Uœrednienie sygna³u dwukana³owego
x=mean(x,2);

% liczba próbek sygna³u
xlen = length(x);                                   
% parametry transformaty
window = 2048;
hop = window/8;
nfft = window;
% utworzenie okina analizy 
anal_win = blackmanharris(window, 'periodic');
% policznie transformaty za pomoc¹ funkcji stft
[X, ~, ~] = stft(x, anal_win, hop, nfft, fs);
V=abs(X);
%Obliczenie wartoœci pomocniczych przy kolejnych operacjach
n=size(V,1);
m=size(V,2);
%obliczenie 'beat_spectrum'
b=beat_spectrum(V, n, m);
%Szukanie okresu spektrogramu
p=finding_p(b);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rysunek pomocniczy - wykres
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% beat_spectrum z zaznaczonymi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% okresami
beat_spectrum_graph(b, x, fs, p);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hold off

%Obliczenie liczby segmentów, na które podzielony jest spektrogram 
r=ceil(length(V)/p);
%Modelowanie powtarzaj¹cego siê segmentu
S=repeating_segment(V, n, p, r);
%Stworzenie spektrogramu z powtarzaj¹cych siê segmentów i spektrogramu
%sygna³u wejœciowego
W=repeating_spectrogram(S, V, n, p, r);
%Obliczenie maski czasowo-czêstotliwoœciowej
M=soft_mask(W, V, n, m);

%Obliczenie odwrotnej transformaty Fouriera dla spektrogramu powsta³ego
%przy u¿yciu maski czasowo-czêstotliwoœciowej na spektrogramie sygna³u
%oryginalengo - uzyskanie próbek reprezentuj¹cych t³o muzyczne [x2]
%utworzenie okna syntezy
synth_win = hamming(window, 'periodic');
[x2, ~] = istft(M.*X, anal_win, synth_win, hop, nfft, fs, xlen);
x2=x2(:);

%Zapisanie próbek w postaci pliku dŸwiêkowego
audiowrite([title background format],x2,fs);

%Obliczenie próbek reprezentuj¹cych wokal/œcie¿kê dŸwiêkow¹ [xxx] poprzez odjêcie od orygina³u sygna³u t³a
x3=x-x2;

%Zapisanie otrzymanych próbek w postaæi pliku dŸwiêkowego 
audiowrite([title foreground format],x3,fs);

%Wyœwietlenie spektrogramów poszczególnych sygna³ów: oryginalnego, t³a i
%linii melodycznej
makeSpectrograms(window/4, x , x2, x3, fs)

end

