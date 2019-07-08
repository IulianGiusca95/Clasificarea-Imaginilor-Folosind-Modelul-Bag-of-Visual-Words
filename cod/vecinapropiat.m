function [indecsi dist] = vecinapropiat(D1,D2)
 N = size(D1,1);
 M = size(D2,1);
 indecsi = zeros(N,1);
 dist = zeros(N,1);
 
 for i=1:N
     all_dist = zeros(M,1);
     for j = 1:M
         all_dist(j) = norm(D1(i,:)-D2(j,:));
     end
     [val ind] = min(all_dist);
     indecsi(i) = ind;
     dist(i) = val;
 end

end

