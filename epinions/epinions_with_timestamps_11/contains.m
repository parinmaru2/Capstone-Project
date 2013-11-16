function [ answer ] = contains(users, userId)
% checks whether the user has provided rating for category k
% @param     ratings     the ratings dataset having records of category k
% @param     user        userID
    
    usersRows = size(users,1);
    answer = false;
    for n = 1:usersRows
        if (users(n) == userId)
            answer = true;
            break;
        end
    end

end

