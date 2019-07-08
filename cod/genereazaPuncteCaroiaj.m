function puncteCaroiaj = genereazaPuncteCaroiaj(img,nrPuncteX,nrPuncteY,margine)
% genereaza puncte pe baza unui caroiaj
% un caroiaj este o retea de drepte orizontale si verticale de forma urmatoare:
%
%        |   |   |   |
%      --+---+---+---+--
%        |   |   |   |
%      --+---+---+---+--
%        |   |   |   |
%      --+---+---+---+--
%        |   |   |   |
%      --+---+---+---+--
%        |   |   |   |
%
% Input:
%       img - imaginea input
%       nrPuncteX - numarul de drepte verticale folosit la constructia caroiajului
%                 - in desenul de mai sus aceste drepte sunt identificate cu simbolul |
%       nrPuncteY - numarul de drepte orizontale folosit la constructia caroiajului
%                 - in desenul de mai sus aceste drepte sunt identificate cu simbolul --
%         margine - numarul de pixeli de la marginea imaginii (sus, jos, stanga, dreapta) pentru care nu se considera puncte
% Output:
%       puncteCaroiaj - matrice (nrPuncteX * nrPuncteY) X 2
%                     - fiecare linie reprezinta un punct (y,x) de pe caroiaj aflat la intersectia dreptelor orizontale si verticale
%                     - in desenul de mai sus aceste puncte sunt idenficate cu semnul +
puncteCaroiaj = zeros(nrPuncteX*nrPuncteY,2);
[h w] = size(img);
h1 = h - 2* margine;
distantaH=floor((h1-1)/(nrPuncteX-1));
w1 = w - 2* margine;
distantaW=floor((w1-1)/(nrPuncteY-1));

x = (margine+1:distantaH:h-margine);
y = (margine+1:distantaW:w-margine);

contor=1;
for i = 1:nrPuncteX
    for j = 1:nrPuncteY
        puncteCaroiaj(contor,:)=[x(i) y(j)];
        contor=contor+1;
    end
end
end