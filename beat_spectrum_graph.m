function [  ] = beat_spectrum_graph(b, x, fs, p)
% beat_spectrum_graph funkcja rysująca beat spectrum i zaznaczająca na nim
% okresy
%   b - wektor beat spectrum
%   x - wektor sygnału oryginalnego
%   fs - częstotliwość próbkowania sygnału oryginalnego
%   p - okres powtarzania 

%zdefiniowanie i przeskalowanie osi x
x_axis=linspace(0,length(b),length(b))*length(x)/((length(b))*fs);
figure();

%narysowanie beat spectrum
plot(x_axis,b)
hold on
%policzenie liczby okresów
nperiod=length(b)/p;
%zaznaczanie kolejnych okresów w postaci czerwonych kwadracików
for o=1:nperiod
    plot(o*p*length(x)/((length(b))*fs),b(o*p),'rs') 
    hold on
end

%nadanie etykiet poszczególnym osiom
xlabel('Czas [s]');
ylabel('Beat spectrum');

end

