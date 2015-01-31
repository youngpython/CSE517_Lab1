function output=analyze(kind,truth,preds)	
% function output=analyze(kind,truth,preds)		
%
% Analyses the accuracy of a prediction
% Input:
% kind='acc' classification error
% kind='abs' absolute loss
% (other values of 'kind' will follow later)
% 



switch kind
	case 'abs'
		% compute the absolute difference between truth and predictions
		output=sum(abs(truth-preds))/length(truth);
		
	case 'acc' 
		%compare actual Te labels to labels found w/
        %[indices,dists] = findknn(xTr,xTe,k); 
		%knn_predicted_labels = yTr(indices);
        %predicted_labels = mode(knn_predicted_labels);
        %truth = yTe;
        class_error = sum(truth==preds,2)/length(truth);
        output= class_error;
        
end;

