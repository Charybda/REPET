function [  ] = beat_spectrum_graph(b, x, fs, p)
% beat_spectrum_graph funkcja rysuj�ca beat spectrum i zaznaczaj�ca na nim
% okresy
%   b - wektor beat spectrum
%   x - wektor sygna�u oryginalnego
%   fs - cz�stotliwo�� pr�bkowania sygna�u oryginalnego
%   p - okres powtarzania 

%zdefiniowanie i przeskalowanie osi x
x_axis=linspace(0,length(b),length(b))*length(x)/((length(b))*fs);
figure();

%narysowanie beat spectrum
plot(x_axis,b)
hold on
%policzenie liczby okres�w
nperiod=length(b)/p;
%zaznaczanie kolejnych okres�w w postaci czerwonych kwadracik�w
for o=1:nperiod
    plot(o*p*length(x)/((length(b))*fs),b(o*p),'rs') 
    hold on
end

%nadanie etykiet poszczeg�lnym osiom
xlabel('Czas [s]');
ylabel('Beat spectrum');

end

