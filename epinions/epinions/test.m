% ratings = load('rating.mat');
% ratings_rows = size(ratings.rating,1);
% ratings_cols = size(ratings.rating,2);
% 
% for i = 1:ratings_rows
%     if (~isempty(find(27 == ratings.rating(i,3))))
%          fprintf(' user = %.0d, category = %.0d \n',[ratings.rating(i,1) ratings.rating(i,2)]');
%     end
% end

trust1 = load('trust3.txt');

for i = 1:size(trust1,1)
    if (~isempty(find(21945 == trust1(i,1) && trust1(i,2) == 16242)))
         fprintf(' user = %.0d, category = %.0d \n',[trust1(i,1) i]');
    end
end