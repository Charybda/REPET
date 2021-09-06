function [ S ] = repeating_segment(V, n, p, r)
%repeating_segment - funkcja modeluj�ca powtarzaj�cy si� segment (S)
%   Macierz S to �rednia poszczeg�lnych segment�w, na jakie zosta�
%   podzielony spektrogram przetwarzanego sygna�u

s=zeros(1,r);
S=zeros(n,p);

for i=1:n
    for l=1:p
       for k=1:r
           if l+(k-1)*p<=size(V,2)
              s(k)=V(i,l+(k-1)*p);
           end
       end
       S(i,l)=median(s);
    end
end

end

