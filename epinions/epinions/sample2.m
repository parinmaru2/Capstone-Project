% Loading ratings dataset and calculating its number of rows and columns.
ratings = load('rating.mat');
ratings_rows = size(ratings.rating,1);
ratings_cols = size(ratings.rating,2);
A = [max(ratings.rating(:,1)) max(ratings.rating(:,2)) max(ratings.rating(:,3)) max(ratings.rating(:,4))];

% Loading trust dataset and calculating its number of rows and columns.
trust = load('trustnetwork.mat');
trust_rows = size(trust.trustnetwork, 1);
trust_cols = size(trust.trustnetwork, 2);

% Creating a vector of users that have rated products of category k.
users = [];
for i=1:ratings_rows
   if (ratings.rating(i,3) == 27)
        users = [users;ratings.rating(i)];
   end
end
% Removing duplicate entries as there may be users who must have rated multiple products belonging to same category  
users2 = unique(users);


% Building trust network for category k
fileID = fopen('trust27.txt','w');
for i = 1:trust_rows
     if (contains(users2,trust.trustnetwork(i,1)) && contains(users2,trust.trustnetwork(i,2)))
%             fprintf(' user1 = %.0d, user2 = %.0d \n',[trust.trustnetwork(i,1) trust.trustnetwork(i,2)]');
            fprintf(fileID,'%.0d %.0d\n',[trust.trustnetwork(i,1) trust.trustnetwork(i,2)]);
     end
end

fclose(fileID);



