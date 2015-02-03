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
    % Anonymous function acting as a conditional operator, since MATLAB 
    % lacks a built-in one (we borrowed the iif function from an official 
    % blog from mathworks.com
    iif = @(varargin) varargin{2*find([varargin{1:2:end}], 1, 'first')}();
    [modes,freq,ties] = mode(knn_predicted_labels);
    preds_temp = cellfun(@(X) iif(length(X)==1, @() X(1), true, @() 0), ties);
    tied_indices = find(preds_temp == 0);
    kisone_indices = 1:size(knn_predicted_labels,2);
    kisone_indices(tied_indices) = [];
    nearest_neighbors = knn_predicted_labels(1,:);
    nearest_neighbors(kisone_indices) = 0;
    preds = preds_temp + nearest_neighbors;
    %preds = cellfun(@(X) iif(length(X)==1, @() X(1), true, @() knn_predicted_labels(1, X)), ties); %if length(ties)==1 X(1) else preds(1);
end;