function mas2565_exportModData(params)
    modParams = load(fullfile(params.paths.modData,strcat('modified_data.mat')),"params");
    modData = modParams.params.data;
    dataFields = fieldnames(modData);
    for i = 2:length(dataFields)
        subj = dataFields{i};
%             subject_data = icaData.(subj);
        nTrial = modData.(subj).nTrial;
        n_TRAIN = modData.(subj).n_TRAIN;
        n_TRAIN_FACE = modData.(subj).n_TRAIN_FACE;
        n_TRAIN_CAR = modData.(subj).n_TRAIN_CAR;
        n_TEST = modData.(subj).n_TEST;
        X_EEG_TRAIN = modData.(subj).X_EEG_TRAIN;
        Y_EEG_TRAIN = modData.(subj).Y_EEG_TRAIN;
        X_EEG_TEST = modData.(subj).X_EEG_TEST;
        save(fullfile(params.paths.modData,strcat(subj,'.mat')),"nTrial","n_TRAIN","n_TRAIN_FACE","n_TRAIN_CAR","n_TEST","X_EEG_TRAIN","Y_EEG_TRAIN","X_EEG_TEST");
    end
end