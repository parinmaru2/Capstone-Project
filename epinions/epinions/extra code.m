% remove_pos = [];
% for i = 1:trust_rows
%     if (isempty(find(users2 == trust.trustnetwork(i,1))))
%         remove_pos = [remove_pos; i];
%     end
% end
% 
% for i = 1:trust_rows
%     if (isempty(find(users2 == trust.trustnetwork(i,2))))
%         remove_pos = [remove_pos; i];
%     end
% end
% 
% remove_pos = unique(remove_pos);
% 
% m2 = trust.trustnetwork(~ismember(1:trust_rows, remove_pos), :);