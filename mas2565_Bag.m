function Y_final = mas2565_Bag(params)
    numSubjs = params.numSubjs;
    bag_dir = uigetdir();
    params.paths.bag_dir = bag_dir;
    models = dir(bag_dir);
    % for each subject
    Y_final = cell(1,params.numSubjs);
    for i = 1:numSubjs        
        subj = strcat('sub0',num2str(i));
        % for each model
        y_set = [];
        y_final = [];
        for j = 1:length(models)-2
            model = models(j+2).name;                       
            % Convert prediction txt files to Y_EEG_TRAIN/TEST formatted outputs
            y = mas2565_txt2Preds(params, model, subj);
            y_set = [y_set y];
        end
        %% AVERAGE OVER ALL MODELS     
        y_bagged = mas2565_bagAvg(y_set);
        y_moded = mas2565_bagMode(y_set);
        switch params.bagMode
            case 'train'
                Y_EEG_TRAIN = params.data.(subj).Y_EEG_TRAIN;
%                 [Xcrv, Ycrv, Tcrv, AUC] = perfcurve(y_bagged, Y_EEG_TRAIN, 1);
                [Xcrv, Ycrv, Tcrv, AUC] = perfcurve(y_moded, Y_EEG_TRAIN, 1);
                figure
                plot(Xcrv, Ycrv);
                title(strcat(subj,' ; ', num2str(AUC)));
            case 'test'
                Y_final{1,i} = y_bagged;
%                 mas2565_exportPredictions();
        end
            
    end      

end