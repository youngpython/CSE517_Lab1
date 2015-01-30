function [indices,dists]=findknn(xTr,xTe,k);
% function [indices,dists]=findknn(xTr,xTe,k);
%
% Finds the k nearest neighbors of xTe in xTr.
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with m column-vectors of dimensionality d
% k = number of nearest neighbors to be found
% 
% Output:
% indices = kxm matrix of where indices(i,j) is the i^th nn of xTe(:,j)
% dists = Euclidean distances to the respective nearest neighbors
%

%%
%compute all distances 
alldists = l2distance(xTr, xTe);
%alldists is nbym, n is xTr rows, m is xTe cols
%sort distances in ascending order in eacdgsdh column
%sorting by nearest neighbor of each xTe vec (in cols) in all of the xTr vectors
[sorted_dists, nn_index_vals] = sort(alldists);
%reduce sorted nearest neighbor dist and index matrices to k rows
knn_dists = sorted_dists(1:k,:);
knn_indices = nn_index_vals(1:k,:);

dists = knn_dists;
indices = knn_indices;
%indices(2,3)=5 means that 5th vec in xTr, xTr(:,5) is 2nd
%closest nn to xTe(:,3) <- 3rd column vec in xTe

% demo that above code works:
%A = 5*rand(5,7);
%[sorted_A,A_index_vals] = sort(A);
%sorted_A;
%k=3;
%Ann_dists = sorted_A(1:k,:)
%Ann_indices = A_index_vals(1:k,:)	
%%	%
	
