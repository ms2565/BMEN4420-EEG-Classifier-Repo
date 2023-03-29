function EEG_Classifier()
    
    % Main function to run our Classifier Model

    %% INITIATE PARAMETER STRUCTURE / LOAD AND STORE DATA
    params = setParams(struct);
    params.paths.data = which('standard60.loc');
    fsep = filesep;
    params.paths.data = strrep(params.paths.data,strcat(fsep,'standard60.loc'),'');
    params = loadData(params);
    sub01 = params.data.sub01;
    sub02 = params.data.sub02;
    sub03 = params.data.sub03;
    sub04 = params.data.sub04;
    sub05 = params.data.sub05;
    sub06 = params.data.sub06;
    sub07 = params.data.sub07;
    sub08 = params.data.sub08;
    
    %% DATA PREPROCESSING
    
    % FILTERING (Band-pass, FIR filtering 0.5-40Hz, removal of artifacts - e.g. blinking)

    % FEATURE SELECTION

    % FEATURE NORMALIZATION (z-scoring

    % FEATURE REDUCTION (PCA, Regularization, etc.)    

    % DATA AUGMENTATION ???

    %% CLASSIFICATION (SVM, LDA, Naive, Bayes, LR, K-means, Boosting, etc.)    

end