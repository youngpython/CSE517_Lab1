function D=l2distance(x1,x2)
% function D=l2distance(x1,x2)
%	
% Computes the Euclidean distance matrix. 
% Syntax:
% D=l2distance(x1,x2)
% Input:
% x1: dxn data matrix with n vectors (columns) of dimensionality d
% x2: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm 
% D(i,j) is the Euclidean distance of x1(:,i) and x2(:,j)
%
% call with only one input:
% l2distance(x1)=l2distance(x1,x1)
%

if (nargin==1) % case when there is only one input (x1)
    G = innerproduct(x1);
    S = repmat(diag(G), width(x1)); % Since G is an innerproduct 
    % matrix, its diagonals represent row-by-row dot products of G
    D = sqrt(S - 2*G + S');
else  % case when there are two inputs (x1,x2)
    G = innerproduct(x1,x2);
    S_x = repmat(diag(innerproduct(x1)), width(x2));
    S_z = repmat(diag(innerproduct(x2))', height(x1));
    D = sqrt(S_x - 2*G + S_z');
end;