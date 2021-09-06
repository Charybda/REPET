function [  ] = makeSpectrograms( window, x, x2, x3, fs)
%makeSpectrograms - funkcja tworz¹ca trzy spektrogramy w jednym oknie na podstawie
%podanych parametrów
%   x, x2, x3 - trzy sygna³y, które s¹ odpowiednio œcie¿k¹ oryginaln¹,
%   œcie¿k¹ t³a oraz œcie¿k¹ wokalu
%   window, fs - parametry tworzenia spektrogramu za pomoc¹ funkcji
%   spectrogram - d³ugoœc okna i czêstotliwoœc próbkowania

figure()
subplot(3,1,1), spectrogram(x,window,[],[],fs,'yaxis'); title('Orygina³');
subplot(3,1,2), spectrogram(x2,window,[],[],fs,'yaxis');title('T³o');
subplot(3,1,3), spectrogram(x3,window,[],[],fs,'yaxis');title('Wokal');

end

