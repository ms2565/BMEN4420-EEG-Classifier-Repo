function test_pred_accuracy_result()
    clear all;
    %% Loading Staff solution
    load test_gt_reference.mat % loads as test_gt (NOTE EXAMPLE is just all 1's)
    %% Loading Your Predictions
    % below is the name of .mat file you submit,
    % i.e. for group 2 you submit Group2.mat
    % Use the following code to save: save GroupX.mat test_preds
    % ^ Note that the variable name when saving should be test_preds
%     load GroupX.mat
    load EEG_Predictions.mat
%     test_preds = load('EEG_Predictions.mat').Y_TEST;
%     test_gt = test_preds;
    %%
    subject_scores = [];
    total_possible = 0;
    for subj=1:8
        subject_scores = [subject_scores sum(abs(test_gt{subj} - test_preds{subj}))];
        total_possible = total_possible + size(test_gt{subj},2);
    end
    
    total_accuracy = (total_possible - sum(subject_scores))/total_possible*100 % out of 100%
end