function [ answer ] = contains(ratings, user)
% checks whether the user has provided rating for any category
% @param     ratings     the ratings dataset having records of category k
% @param     user        userID
    
    ratings_rows = size(ratings,1);
    answer = false;
    for n = 1:ratings_rows
        if (ratings(n) == user)
            answer = true;
            break;
        end
    end

end

