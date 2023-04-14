function postOpData = mas2565_eeglab(data)
    EEG = pop_importdata('dataformat', 'matlab', 'nbchan', size(data.sub01.X_EEG_TRAIN, 1), 'data', data.sub01.X_EEG_TRAIN, 'srate', data.Fs, 'pnts', size(data.sub01.X_EEG_TRAIN, 2));
    EEG = pop_chanedit(EEG,'load', {'standard60.loc' 'filetype' 'autodetect'});
    EEG = pop_runica(EEG,'icatype','runica');
    EEG = pop_selectcomps(EEG,[1:20]);
    pop_selectcomps(EEG, 'comps', 1:size(EEG.icawinv,2));
    EEG = pop_subcomp(EEG,find(EEG.reject.gcompreject));
end