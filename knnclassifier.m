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
    preds = mode(knn_predicted_labels); 
end;



% output random result as default (you can erase this code)
%[d,n]=size(xTe);
%[d,ntr]=size(xTr);
%if k>ntr,k=ntr;end;
%un=unique(yTr);
%preds=un(ceil(rand(1,n)*length(un)));

%% fill in code here

