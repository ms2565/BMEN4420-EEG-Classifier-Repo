
clear; clc; close all;
%%if you want to run through different time
%intervals, un comment the code that says TIME
%INTERVALS

%TIME INTERVALS code will return you a vector "auc_values" that is zero
%everywhere excpt for the mm points (in the example case, it's zero
%everywhere except 200, 250, 300, etc etc) and at the mm points is the Az
%value for the system if you only used that time interval. For example, and
%Az value of 0.52 at 200 means that, if you only use the 200-250ms range
%for the regression, the Az value would be 0.52

params = setParams(struct);
params.paths.data = which('standard60.loc');
fsep = filesep;
params.paths.data = strrep(params.paths.data,strcat(fsep,'standard60.loc'),'');
params = loadData(params);


%% CLEANING INPUT DATA

X_EEG_TRAIN = [];
Y_EEG_TRAIN = [];
auc = zeros(1000,1);
for subject = [1 2 3 4 5 7 8] %FUCK SUBJECT 6 (BUT I WILL TRY TO FIGURE OUT A WAY TO INCLUDE)

    sub_name = sprintf('sub%02d', subject);
    X_EEG_TRAIN_sub = eval(sprintf('params.data.%s.X_EEG_TRAIN', sub_name));
    Y_EEG_TRAIN_sub = eval(sprintf('params.data.%s.Y_EEG_TRAIN', sub_name));

    X_EEG_TRAIN = cat(3, X_EEG_TRAIN, X_EEG_TRAIN_sub);
    Y_EEG_TRAIN = [Y_EEG_TRAIN; Y_EEG_TRAIN_sub];
%concatenating the data for the different subjects 
end
% feature normalization
    mu = mean(X_EEG_TRAIN, [1 2]);
    sigma = std(X_EEG_TRAIN, [], [1 2]);
    X_EEG_TRAIN = (X_EEG_TRAIN - mu) ./ sigma;

    %filter each trial/channel separately 
    for ii = 1:size(X_EEG_TRAIN, 3)
    X_EEG_TRAIN(:,:,ii) = iaz2112filterdata(X_EEG_TRAIN(:,:,ii));
    end
 
   %normalization again
    mu = mean(X_EEG_TRAIN, [1 2]);
    sigma = std(X_EEG_TRAIN, [], [1 2]);
    X_EEG_TRAIN_full = (X_EEG_TRAIN - mu) ./ sigma;

%for mm = 200:50:1150      %TIME INTERVALS


X_EEG_TRAIN = X_EEG_TRAIN_full(:, 400:650, :); %indexing through time periods 
%X_EEG_TRAIN = X_EEG_TRAIN_FULL(:, mm:mm+50, :) %% TIME INTERVALS, FEEL
%FREE TO COMMENT OUT ABOVE LINE TO AVOID REDUNDANCY 

pc1y_all = [];

%% LEAVE ONE OUT TESTING WITH LOGISTIC REGRESSION
 for i = 1:size(X_EEG_TRAIN, 3)
        % Set aside one trial as test data
        X_EEG_TEST1 = X_EEG_TRAIN(:, :, i);
        X_EEG_TEST = mean(X_EEG_TEST1, 2);
        Y_EEG_TEST = Y_EEG_TRAIN(i);
        X_EEG_TRAIN_LOO = X_EEG_TRAIN(:, :, [1:i-1, i+1:end]);
        Y_EEG_TRAIN_LOO = Y_EEG_TRAIN([1:i-1, i+1:end]);
        face_samples = squeeze(mean(X_EEG_TRAIN_LOO(:, :, Y_EEG_TRAIN_LOO==1), 2));
        car_samples = squeeze(mean(X_EEG_TRAIN_LOO(:, :, Y_EEG_TRAIN_LOO==0), 2));
        facecar = [face_samples car_samples];
        mean_face = mean(face_samples, 2);
        mean_car = mean(car_samples, 2);
        eps1 = cov(face_samples');
        eps2 = cov(car_samples');
        eps = (eps1+eps2) ./ 2;

        v = eps\((mean_face-mean_car)); %DISCRIMINATION VECTOR

        %PROJECTION
        l = v'*X_EEG_TEST;
        pc1y = 1 ./ (1+exp(-l));
        pc1y_all = [pc1y_all; pc1y];
        
 end
%         [X, Y, T, AUC] = perfcurve(Y_EEG_TRAIN, pc1y_all, 1); % TIME
%         INTERVALS
%         auc_values(mm) = AUC;  %TIME INTERVALS

% end %TIME INTERVALS



% FOR TESTING DIFFERENT TIME INTERVALS, FEEL FREE TO COMMENT THIS OUT
% BECAUSE IT WILL ONLY SHOW YOU THE ROC CURVE FOR THE LAST INTERVAL
[X2,Y2,T2,AUC2] = perfcurve(Y_EEG_TRAIN,pc1y_all,1);
figure();
plot(X2,Y2);
title('ROC Curve: Leave One Out Testing');
ylabel('True Positive Rate')
xlabel('False Positive Rate')
formatspec = 'The Az value after leave-one-out testing is is %4.2f \n';
fprintf(formatspec,AUC2)

