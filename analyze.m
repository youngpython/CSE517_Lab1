function output=analyze(kind,truth,preds)	
% function output=analyze(kind,truth,preds)		
%
% Analyses the accuracy of a prediction
% Input:
% kind='acc' classification error
% kind='abs' absolute loss
% (other values of 'kind' will follow later)
% 

EPSILON = 1e-14;

switch kind
	case 'abs'
		% compute the absolute difference between truth and predictions
		output=sum(abs(truth-preds))/length(truth);
		
	case 'acc' 
		% compute the percent of labels which differed between truth and 
        % predictions - find # of pairs of labels whose values do not fall
        % within a tolerance, and get its ratio over the total # of label
        % pairs
        class_error = sum(abs(truth-preds)<EPSILON,2)/length(truth);
        output= class_error;
        
end;

