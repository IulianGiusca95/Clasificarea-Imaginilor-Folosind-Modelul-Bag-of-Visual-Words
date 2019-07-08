function eticheta = clasificaSVM( histograme_test, histogrameBOVW_exemplePozitive, histogrameBOVW_exempleNegative)
% eticheta = eticheta dedusa folosind un SVM liniar: http://www.vlfeat.org/matlab/vl_svmtrain.html
%
% Input: 
%       histogramaBOVW_test - matrice 1 x K, histograma BOVW a unei imagini test
%       histogrameBOVW_exemplePozitive - matrice #ImaginiExemplePozitive x K, fiecare linie reprezinta histograma BOVW a unei imagini pozitive
%       histogrameBOVW_exempleNegative - matrice #ImaginiExempleNegative x K, fiecare linie reprezinta histograma BOVW a unei imagini negative
% Output: 
%     eticheta - eticheta dedusa a imaginii test

l1 = size(histogrameBOVW_exemplePozitive,1);
l2 = size(histogrameBOVW_exemplePozitive,2);
etpoz = ones(1,l1);
etneg = ones(1,l1).*(-1);
et = [etpoz etneg];
hists = [histogrameBOVW_exemplePozitive; histogrameBOVW_exempleNegative];
[w b] = vl_svmtrain(hists',et,0.1);
% disp('--------');
% disp(w);
% disp('-------');
% disp(b);
% disp('-+-+-+-+-+-+-');
scores = w' * histograme_test' + b;
% disp('size w')
% disp(size(w));
% disp('size w"');
% disp(size(w'));
% disp('size histograme_test');
% disp(size(histograme_test));
% disp('size histograme test"');
% disp(size(histograme_test'));
% disp('scores');
% disp(scores);

if scores >= 0
    eticheta = 1;
else
    eticheta = 0;
end


end