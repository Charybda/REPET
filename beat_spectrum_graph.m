function [  ] = beat_spectrum_graph(b, x, fs, p)
% beat_spectrum_graph funkcja rysuj¹ca beat spectrum i zaznaczaj¹ca na nim
% okresy
%   b - wektor beat spectrum
%   x - wektor sygna³u oryginalnego
%   fs - czêstotliwoœæ próbkowania sygna³u oryginalnego
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

