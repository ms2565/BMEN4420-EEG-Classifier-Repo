% Set parameters
clear; clc
params = setParams(struct);
params.paths.data = which('standard60.loc');
fsep = filesep;
params.paths.data = strrep(params.paths.data,strcat(fsep,'standard60.loc'),'');
params = loadData(params);

% Define time indices to extract
t_idx = [390:490, 510:590];

% Extract desired time points for each subject for both X_EEG_TRAIN and X_EEG_TEST data
% Extract desired time points for each subject for both X_EEG_TRAIN and X_EEG_TEST data
for sub_idx = 1:8
    sub_name = sprintf('sub%02d', sub_idx);
    sub_data_train = params.data.(sub_name).X_EEG_TRAIN;
    sub_data_train = sub_data_train(:, t_idx, :); % extract desired time points
    sub_data_test = params.data.(sub_name).X_EEG_TEST;
    sub_data_test = sub_data_test(:, t_idx, :); % extract desired time points
    params.data.(sub_name).X_EEG_TRAIN = sub_data_train;
    params.data.(sub_name).X_EEG_TEST = sub_data_test;
end


% Save modified data to file
save('modified_data.mat', 'params');
