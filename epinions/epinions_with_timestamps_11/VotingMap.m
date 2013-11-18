% Construct a map that stores UserId as key and a vector of 28 elements as
% value.
% The 1st 27 values in the vector are number of ratings in the respective
% 27 categories by that user. While the last value in the vector is the
% total number of ratings by that user.
map =  containers.Map('KeyType','uint32','ValueType','any');
% map(1) = [1, 2, 3];
% map(1)map(1);

% Loading ratings dataset and calculating its number of rows and columns.
ratings = load('rating_with_timestamp.mat');
rows = size(ratings.rating,1);
cols = size(ratings.rating,2);

for i=1:rows
    key = ratings.rating(i,1);
    value = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    if(~isKey(map,key))
        map(key) = value;
    end
    
    value = map(key);
    value(ratings.rating(i,3)) = value(ratings.rating(i,3)) + 1; 
    map(key) = value;
    
end

myKeys = keys(map);

myValues = values(map);