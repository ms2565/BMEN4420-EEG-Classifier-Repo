function mas2565_impute(params)
%     eegChan = 60;
    %% IMPUTE BY MERGE
    params.toImpute = 'sub06';
    otherSubj = 'sub08';
    otherSubjData = params.data.(otherSubj);
    subjData = params.data.(params.toImpute);
    newSubjData = mas2565_mergeImpute(subjData, otherSubjData);
    mas2565_exportData(params, newSubjData, params.paths.imputeData);
    %% IMPUTE WITH RANDOM NOISE
%     dataSize = size(subjData.X_EEG_TRAIN);
%     dataSizeTest = size(subjData.X_EEG_TEST);
%     numChan = dataSize(1);
%     numTimepts = dataSize(2);
%     numTrials = dataSize(3);
%     numTestTrials = dataSizeTest(3);
%     chanDif = eegChan - numChan;   
%     Mat = zeros(chanDif, numTimepts, numTrials);
%     MatTest = zeros(chanDif, numTimepts, numTestTrials);
%     noiseMat = Mat + randn(size(Mat));
%     noiseMatTest = MatTest + randn(size(MatTest));
%     newXTRAIN = cat(1,subjData.X_EEG_TRAIN, noiseMat);
%     newXTEST = cat(1, subjData.X_EEG_TEST, noiseMatTest);
%     subjData.X_EEG_TRAIN = newXTRAIN;
%     subjData.X_EEG_TEST = newXTEST;
%     mas2565_exportData(params, subjData, params.paths.imputeData);
   
end