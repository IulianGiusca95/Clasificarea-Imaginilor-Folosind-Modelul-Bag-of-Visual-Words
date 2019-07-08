function histograma = histograma_celulei(magnitudine,orientare,nBins)

dimB = pi/nBins;
orientare(orientare<0)=orientare(orientare<0)+pi;
leftBinIndex=round(orientare/dimB);
rightBinIndex=leftBinIndex+1;
leftBinCenter=((leftBinIndex-0.5)*dimB);

rightPortions = orientare - leftBinCenter;
leftPortions = dimB - rightPortions;
rightPortions = rightPortions / dimB;
leftPortions = leftPortions / dimB;

leftBinIndex(leftBinIndex ==0) = nBins;
rightBinIndex(rightBinIndex == (nBins + 1))=1;

histograma = zeros(1,nBins);
for i = 1:nBins
    pixeli = (leftBinIndex == i);
    histograma(1,i)=histograma(1,i)+sum(leftPortions(pixeli)' * magnitudine(pixeli));
    pixeli=(rightBinIndex==i);
    histograma(1,i)=histograma(1,i)+sum(rightPortions(pixeli)' * magnitudine(pixeli));
end
end


