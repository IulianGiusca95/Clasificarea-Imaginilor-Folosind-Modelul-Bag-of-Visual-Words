function histogramaBOVW = calculeazaHistogramaBOVW(descriptoriHOG, cuvinteVizuale)
  % calculeaza histograma BOVW pe baza descriptorilor si a cuvintelor
  % vizuale, gasind pentru fiecare descriptor cuvantul vizual cel mai
  % apropiat (in sensul distantei Euclidiene)
  %
  % Input:
  %   descriptori: matrice MxD, contine M descriptori de dimensiune D
  %   cuvinteVizuale: matrice NxD, contine N centri de dimensiune D 
  % Output:
  %   histogramaBOVW: vector linie 1xN 
  
 % completati codul

nr_desc = size(descriptoriHOG,1);
nr_cuv = size(cuvinteVizuale,1);
histogramaBOVW = zeros(nr_cuv,1);
% for i = 1:nr_desc
%    dist = zeros(1,nr_cuv);
%    for j = 1:nr_cuv
%        for k = 1:128
%            dist(1,j) = dist(1,j) + (descriptoriHOG(i,k) - cuvinteVizuale(j,k))*(descriptoriHOG(i,k) - cuvinteVizuale(j,k));
%        end
%    end
%    [mindist,indice]=min(dist);
%    histogramaBOVW(1,indice) = histogramaBOVW(1,indice)+1;
% end

[indecsi, val] = vecinapropiat(descriptoriHOG,cuvinteVizuale);
for i = 1:nr_cuv
    histogramaBOVW(i)=length(find(indecsi==i));
end
     
end