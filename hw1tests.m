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
rand('seed',234123423523);
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
acc_ = analyze('acc', 1:1000, 1:1000);
if (acc_ ~= 1.0)
    r = r + 1;
    s{length(s) + 1} = ['You cheated. Heres the code: ', fileread('analyze.m')];
end;

x=[[1,0,0,1];[0 1 0 1]];
y=[1 1 2 2];

if ~(all(knnclassifier(x,y,x,1)==y))
	r=r+1;				% set output conditions and exit
	s{length(s)+1}='Error with XOR data set. ';
end;

D=[ 0    78    24
    78     0    78
    24    78     0];
if (norm(l2distance(magic(3)).^2-D)>eps*1000)
    r=r+1;
	s{length(s)+1}='Distances inaccurate.'
end;	

if analyze('acc',[1 2 3 4],[1 2 3 0])~=0.75,
    r=r+1;
	s{length(s)+1}='Analyze function incorrect.'
end;	

v = randi(5,100,1);
unique_labels = unique(v);
% Value - # occurrences
counts_of_labels = [unique_labels histc(v,unique_labels)];
a = [1 26;2 26; 3 35; 4 26; 6 35]
most_common_label = max(a(:,2));
num_of_labels_that_satisfy_mode = find(a(:,2) == most_common_label);
if (length(num_of_labels_that_satisfy_mode)>1)
    %no clear mode!
    %fall back on k=1
    pred(
end;

if (max(a)==

%% fill in code here
