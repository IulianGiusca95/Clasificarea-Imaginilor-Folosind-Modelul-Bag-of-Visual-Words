function eticheta = clasificaBOVWCelMaiApropiatVecin(histogramaBOVW_test,histogrameBOVW_exemplePozitive,histogrameBOVW_exempleNegative)
% eticheta = eticheta celui mai apropiat vecin (in sensul distantei Euclidiene)
% eticheta = 1, daca cel mai apropiat vecin este un exemplu pozitiv,
% eticheta = 0, daca cel mai apropiat vecin este un exemplu negativ. 
% Input: 
%       histogramaBOVW_test - matrice 1 x K, histograma BOVW a unei imagini test
%       histogrameBOVW_exemplePozitive - matrice #ImaginiExemplePozitive x K, fiecare linie reprezinta histograma BOVW a unei imagini pozitive
%       histogrameBOVW_exempleNegative - matrice #ImaginiExempleNegative x K, fiecare linie reprezinta histograma BOVW a unei imagini negative
% Output: 
%     eticheta - eticheta dedusa a imaginii test

  
% completati codul
distanta_expoz=0;
distanta_exneg=0;

% for i = 1 : size(histogrameBOVW_exemplePozitive,1)
%     for j = 1: size(histogrameBOVW_exemplePozitive,2)
%        distanta_expoz = distanta_expoz + (histogramaBOVW_test(1,j)-histogrameBOVW_exemplePozitive(i,j))* (histogramaBOVW_test(1,j)-histogrameBOVW_exemplePozitive(i,j));    
%     end
% end
% 
% for i = 1 : size(histogrameBOVW_exempleNegative,1)
%     for j = 1: size(histogrameBOVW_exempleNegative,2)
%        distanta_exneg = distanta_exneg + (histogramaBOVW_test(1,j)-histogrameBOVW_exempleNegative(i,j))* (histogramaBOVW_test(1,j)-histogrameBOVW_exempleNegative(i,j));    
%     end
% end

[indici1, distanta_expoz]=vecinapropiat(histogramaBOVW_test,histogrameBOVW_exemplePozitive);
[indici2, distanta_exneg]=vecinapropiat(histogramaBOVW_test,histogrameBOVW_exempleNegative);
if distanta_expoz < distanta_exneg
    eticheta = 1;
else
    eticheta = 0;
end
  
end
