function [p, xlen, fs] = REPET_v3(title_original)
%REPET_v3 - funkcja przeprowadzaj�ca algorytm REPET za pomoc� poszczeg�lnych
%funkcji 

%Zdefiniowanie zmiennych tekstowych zwi�zanych z nazwami poszczeg�lnych
%plik�w d�wi�kowych
background='_tlo';
foreground='_wokal';

%Rozdzielenie tytu�u od formatu
C=strsplit(title_original,'.');
title=char(C(1));
format=['.' char(C(2))];

%Wczytanie danego pliku d�wi�kowego
[x, fs]=audioread(title_original);

%U�rednienie sygna�u dwukana�owego
x=mean(x,2);

% liczba pr�bek sygna�u
xlen = length(x);                                   
% parametry transformaty
window = 2048;
hop = window/8;
nfft = window;
% utworzenie okina analizy 
anal_win = blackmanharris(window, 'periodic');
% policznie transformaty za pomoc� funkcji stft
[X, ~, ~] = stft(x, anal_win, hop, nfft, fs);
V=abs(X);
%Obliczenie warto�ci pomocniczych przy kolejnych operacjach
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

%Obliczenie liczby segment�w, na kt�re podzielony jest spektrogram 
r=ceil(length(V)/p);
%Modelowanie powtarzaj�cego si� segmentu
S=repeating_segment(V, n, p, r);
%Stworzenie spektrogramu z powtarzaj�cych si� segment�w i spektrogramu
%sygna�u wej�ciowego
W=repeating_spectrogram(S, V, n, p, r);
%Obliczenie maski czasowo-cz�stotliwo�ciowej
M=soft_mask(W, V, n, m);

%Obliczenie odwrotnej transformaty Fouriera dla spektrogramu powsta�ego
%przy u�yciu maski czasowo-cz�stotliwo�ciowej na spektrogramie sygna�u
%oryginalengo - uzyskanie pr�bek reprezentuj�cych t�o muzyczne [x2]
%utworzenie okna syntezy
synth_win = hamming(window, 'periodic');
[x2, ~] = istft(M.*X, anal_win, synth_win, hop, nfft, fs, xlen);
x2=x2(:);

%Zapisanie pr�bek w postaci pliku d�wi�kowego
audiowrite([title background format],x2,fs);

%Obliczenie pr�bek reprezentuj�cych wokal/�cie�k� d�wi�kow� [xxx] poprzez odj�cie od orygina�u sygna�u t�a
x3=x-x2;

%Zapisanie otrzymanych pr�bek w posta�i pliku d�wi�kowego 
audiowrite([title foreground format],x3,fs);

%Wy�wietlenie spektrogram�w poszczeg�lnych sygna��w: oryginalnego, t�a i
%linii melodycznej
makeSpectrograms(window/4, x , x2, x3, fs)

end

