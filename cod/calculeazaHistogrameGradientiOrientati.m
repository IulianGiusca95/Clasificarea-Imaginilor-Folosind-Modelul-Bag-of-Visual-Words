function [descriptoriHOG, patchuri] = calculeazaHistogrameGradientiOrientati(img,puncte,dimensiuneCelula)
% calculeaza pentru fiecare punct din de pe caroiaj, histograma de gradienti orientati
% corespunzatoare dupa cum urmeaza:
%  - considera cele 16 celule inconjuratoare si calculeaza pentru fiecare
%  celula histograma de gradienti orientati de dimensiune 8;
%  - concateneaza cele 16 histograme de dimeniune 8 intr-un descriptor de
%  lungime 128 = 16*8;
%  - fiecare celula are dimensiunea dimensiuneCelula x dimensiuneCelula (4x4 pixeli)
%
% Input:
%       img - imaginea input
%    puncte - puncte de pe caroiaj pentru care calculam histograma de
%             gradienti orientati
%   dimensiuneCelula - defineste cat de mare este celula
%                    - fiecare celula este un patrat continand
%                      dimensiuneCelula x dimensiuneCelula pixeli
% Output:
%        descriptoriHOG - matrice #Puncte X 128
%                       - fiecare linie contine histograme de gradienti
%                        orientati calculata pentru fiecare punct de pe
%                        caroiaj
%               patchuri - matrice #Puncte X (16 * dimensiuneCelula^2)
%                       - fiecare linie contine pixelii din cele 16 celule
%                         considerati pe coloana

nBins = 8; %dimensiunea histogramelor fiecarei celule

descriptoriHOG = zeros(size(puncte,1),nBins*4*4); % fiecare linie reprezinta concatenarea celor 16 histograme corespunzatoare fiecarei celule
patchuri = zeros(size(puncte,1),4*dimensiuneCelula*4*dimensiuneCelula); % 


if size(img,3)==3
    img = rgb2gray(img);
end
img = double(img);

% f = [-1 0 1];
% Ix = imfilter(img,f,'replicate');
% Iy = imfilter(img,f','replicate');
[gradx,grady]=gradient(img);
orientare=atan2(grady,gradx);
magnitudine=sqrt((grady .^ 2) + (gradx .^ 2));
% orientare = atand(Ix./(Iy+eps)); %unghiuri intre -90 si 90 grade
% orientare = orientare + 90; %unghiuri intre 0 si 180 grade
% magnitudine = sqrt(Ix .^ 2 + Iy .^2);


for i = 1:size(puncte,1)
    varf_patch_x = puncte(i,1) - 8;
    varf_patch_y = puncte(i,2) - 8;
    varf_patch=[varf_patch_x varf_patch_y];
    
    for j = 0:3
        rand=varf_patch(1)+4*j;
        for k=0:3
            coloana=varf_patch(2)+4*k;
            indecsiRand = rand : rand + 4 - 1;
            indecsiColoana = coloana : coloana + 4 - 1;
            orientareCelula=orientare(indecsiRand,indecsiColoana);
            magnCelula=magnitudine(indecsiRand,indecsiColoana);
            histograma = histograma_celulei(magnCelula,orientareCelula,nBins);
            descHOG(j+1,k+1,:)=histograma(1:8);
        end
    end
    descriptoriHOG(i,:)=descHOG(:);
    patch = img(varf_patch(1):(varf_patch(1)+4*4 -1),varf_patch(2):(varf_patch(2)+4*4-1));
    patchuri(i,:)=patch(:);
end
    

end
