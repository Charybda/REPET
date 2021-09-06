function [ p ] = finding_p( b )
%finding_p - funkcja znajduj�ca okres powtarzaj�cego si� segmentu
%   Na podstawie obliczonego 'beat spectrum' znajdowany jest okres
%   powtarzaj�cego si� segmentu za pomoc� odpowiedniego algorytmu

%rozmiar macierzy b po odrzuczeniu 1/4 
l=ceil(3*length(b)/4);
%nowa macierz b stworzona po odrzuceniu  czwartej cz�ci
%najwi�kszych op�nie�
b_n=b(1:l);
%rozmiar nowej macierzy b
l=length(b_n);
%parametr ustawiony na '2' w dziedzinie czasu
delta_1=2;
%pusta macierz o d�ugo�ci l/3
J=zeros(floor(l/3),1);

%g��wna cz�� funkcji wykonuj�ca algorytm znajdowania okresu 
for j=1:(l/3)
    delta_2=floor(3*j/4);
    I=0;
    for n=1:(l/j)
        i=n*j;
        if (i+delta_2<=l)&&(i-delta_2>=1)
            if (i-delta_1>=1)&&(i+delta_1<=l)
                h=find(b_n==max(b_n(i-delta_1:i+delta_1)));
                if h==find(b_n==max(b_n(i-delta_2:i+delta_2)))
                    I=I+b_n(h)-mean(b_n(i-delta_2:i+delta_2));
                end
            end
        end
    end
    J(j)=I/floor(l/j);
end
p=find(J==max(J));

end

