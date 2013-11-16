% Loading ratings dataset and calculating its number of rows and columns.
ratings = load('rating_with_timestamp.mat');
ratingsRows = size(ratings.rating,1);
ratingsCols = size(ratings.rating,2);
A = [max(ratings.rating(:,1)) max(ratings.rating(:,2)) max(ratings.rating(:,3)) max(ratings.rating(:,4))];

% loading trust dataset and calculating its number of rows and columns.
trust = load('epinion_trust_with_timestamp.mat');
trustRows = size(trust.trust, 1);
trustCols = size(trust.trust, 2);

% creating a vector of users that have rated products of category k.
users = [];
for i=1:ratingsRows
   if (ratings.rating(i,3) == 27)
        users = [users;ratings.rating(i)];
   end
end
% removing duplicate entries as there may be users who must have rated multiple products belonging to same category  
users = unique(users);


% building trust network for category k
fileId = fopen('../TrustNetworks/trust27.txt','w');
for i = 1:trustRows
     if (contains(users,trust.trust(i,1)) && contains(users,trust.trust(i,2)))
%             fprintf(' user1 = %.0d, user2 = %.0d \n',[trust.trustnetwork(i,1) trust.trustnetwork(i,2)]');
            fprintf(fileId,'%.0d %.0d %.0d\n',[trust.trust(i,1) trust.trust(i,2) trust.trust(i,3)]);
     end
end

fclose(fileId);