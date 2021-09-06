function [  ] = makeSpectrograms( window, x, x2, x3, fs)
%makeSpectrograms - funkcja tworz�ca trzy spektrogramy w jednym oknie na podstawie
%podanych parametr�w
%   x, x2, x3 - trzy sygna�y, kt�re s� odpowiednio �cie�k� oryginaln�,
%   �cie�k� t�a oraz �cie�k� wokalu
%   window, fs - parametry tworzenia spektrogramu za pomoc� funkcji
%   spectrogram - d�ugo�c okna i cz�stotliwo�c pr�bkowania

figure()
subplot(3,1,1), spectrogram(x,window,[],[],fs,'yaxis'); title('Orygina�');
subplot(3,1,2), spectrogram(x2,window,[],[],fs,'yaxis');title('T�o');
subplot(3,1,3), spectrogram(x3,window,[],[],fs,'yaxis');title('Wokal');

end

