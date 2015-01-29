function [r,s]=hw1tests()
% function [r,s]=hw1tests()
%
% Tests the functions from homework assignment 0
% Please make sure that the error statements are instructive. 
%
% Output: 
% r=0 number of tests that broke
% s= statement describing the failed test (s={} if all succeed)
%


% Put in any seed below
rand('seed',31415926535);
% initial outputs
r=0;
s={};

% Example:
% A simple test is to look if the diagonal is all zero
x=rand(10,100); 		% define some random test points
d=diag(l2distance(x));	% extract diagonal of distance matrix
if ~all(d<eps*100)			% if test failed ...
	r=r+1;				% set output conditions and exit
	s{length(s)+1}='Distance from a vector to itself is not zero.';
end;

x=[[1,0];[0,1]];
z=[[0,0];[1,1]];
D=l2distance(x,z);
D2=[[sqrt(2),sqrt(2)];[0,0]];
if ~(max(max(abs(D2-D)))<100*eps)
	r=r+1;				% set output conditions and exit
	s{length(s)+1}='Distances between xor vectors are not correct.';
end;


%% Define your own tests here:
%% fill in code here
