function mas2565_exportData(params, subjData, expPath)    
    nTrial = subjData.nTrial;
    n_TRAIN = subjData.n_TRAIN;
    n_TRAIN_FACE = subjData.n_TRAIN_FACE;
    n_TRAIN_CAR = subjData.n_TRAIN_CAR;
    n_TEST = subjData.n_TEST;
    X_EEG_TRAIN = subjData.X_EEG_TRAIN;
    Y_EEG_TRAIN = subjData.Y_EEG_TRAIN;
    X_EEG_TEST = subjData.X_EEG_TEST;
    save(fullfile(expPath,strcat(params.toImpute,'.mat')),"nTrial","n_TRAIN","n_TRAIN_FACE","n_TRAIN_CAR","n_TEST","X_EEG_TRAIN","Y_EEG_TRAIN","X_EEG_TEST");
end