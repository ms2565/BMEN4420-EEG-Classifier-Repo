function icaData = mas2565_eeglab(data, params)
    icaData = data;
    dataFieldNames = fieldnames(data);
    for i = 2:length(dataFieldNames)
        subj = dataFieldNames{i};        
        EEG = pop_importdata('dataformat', 'matlab', 'nbchan', size(data.(subj).X_EEG_TRAIN, 1), 'data', data.(subj).X_EEG_TRAIN, 'srate', data.Fs, 'pnts', size(data.(subj).X_EEG_TRAIN, 2));
        EEG = pop_chanedit(EEG,'load', {'standard60.loc' 'filetype' 'autodetect'});
        EEG = pop_runica(EEG,'icatype','runica');
        ICs = eeg_getdatact(EEG, 'component', [1:20]);        
        icaData.(subj).X_EEG_TRAIN = ICs;
%         icaData.(subj).X_EEG_TEST;
        icaData.(subj).Y_EEG_TRAIN = data.(subj).Y_EEG_TRAIN;
        subject_data = icaData.(subj);
        nTrial = subject_data.nTrial;
        n_TRAIN = subject_data.n_TRAIN;
        n_TRAIN_FACE = subject_data.n_TRAIN_FACE;
        n_TRAIN_CAR = subject_data.n_TRAIN_CAR;
        n_TEST = subject_data.n_TEST;
        X_EEG_TRAIN = subject_data.X_EEG_TRAIN;
        Y_EEG_TRAIN = subject_data.Y_EEG_TRAIN;
        X_EEG_TEST = subject_data.X_EEG_TEST;
        save(fullfile(params.paths.ICA,strcat(subj,'.mat')),"nTrial","n_TRAIN","n_TRAIN_FACE","n_TRAIN_CAR","n_TEST","X_EEG_TRAIN","Y_EEG_TRAIN","X_EEG_TEST");
    end
end
