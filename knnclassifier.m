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
    
    % Use the "ties" array to find the modes (including any ties) for each
    % column - each cell in "ties" contains a vector of all the numbers
    % tied for mode
    [modes,freq,ties] = mode(knn_predicted_labels);
    
    % The following code is intended to fall back on the first nearest
    % neighbor (k=1) in the case of a tie in column modes.  The goal is to
    % take a mutated matrix of the predicted labels, where each cell in
    % "ties" that contains a tie is zeroed out, and add it with a mutated
    % matrix in the row of 1st nearest neighbors, where each cell is zeroed
    % out if its corresponding index in the "ties" array is not.
    
    % Perform the aforementioned mutation on "ties"
    preds_temp = cellfun(@(X) iif(length(X)==1, @() X(1), true, @() 0), ties);
    tied_indices = find(preds_temp == 0);
    
    % Obtain the correct indices to zero out in the predicted labels
    k_is_one_indices = 1:size(knn_predicted_labels,2);
    k_is_one_indices(tied_indices) = [];
    
    % Perform the mautation on the predicted labels, and sum the two.
    nearest_neighbors = knn_predicted_labels(1,:);
    nearest_neighbors(k_is_one_indices) = 0;
    preds = preds_temp + nearest_neighbors;
end;