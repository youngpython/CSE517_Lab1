function preds=knnclassifier(xTr,yTr,xTe,k)
% function preds=knnclassifier(xTr,yTr,xTe,k);
%
% k-nn classifier 
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with m column-vectors of dimensionality d
% k = number of nearest neighbors to be found
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%
[indices,dists] = findknn(xTr,xTe,k); 
knn_predicted_labels = yTr(indices);

if (size(knn_predicted_labels,1)==1)
    preds = knn_predicted_labels;
else

   % label_count = label_count(:,2:size(label_count));
    
    %sorted_label_counts = sort(label_count,2,'descend');
   % sorted_label_counts = vertcat(uniqu
    %bool noclearmode = TRUE;
    
        
    %max_num_same_label = max(label_count(:,2:size(label_count(:,2))));
    %max_num_same_label = repmat(max_num_same_label,size(unique_labels));
    %num_of_labels_that_satisfy_mode;
    %[a b c]= find(label_count == max_num_same_label);
    %if (length(num_of_labels_that_satisfy_mode)>1)
    %    preds(i) = knn_predicted_labels(i);
    %end;
    
    %no clear mode!
    %fall back on k=1
    %sort label counts in descending order
    %if first equals second, fall back to k=1 prediction choice
    %preds(i) = knn_predicted_labels;
    preds = mode(knn_predicted_labels);
end;

    %check if modes are all the same for negative matrices (mode finds
    %most occuring value <- takes the minimum one
    %*mode_using_pos_vals = mode(knn_predicted_labels);
    %negative_preds = -1*knn_predicted_labels;
    %negative_mode = mode(-1*knn_predicted_labels)
    %mode_using_neg_vals = -1*negative_mode;
    %[ a b] = 
    
  %  if (mode_using_neg_vals(1,:) ~= mode_using_pos_vals(1,:))
   %     preds(1,:)=knn_predicted_labels(1,:);
  %  end;
    
    
   
%% fill in code here

