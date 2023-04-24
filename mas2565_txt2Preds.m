function y = mas2565_txt2Preds(params, model, subj)
    model_subjPreds = dir(fullfile(params.paths.bag_dir,model));
    % load subj predictions text file
    fID = fopen(fullfile(params.paths.bag_dir,model,strcat(subj,'.txt')),'r');
    predsCellArr = textscan(fID, '%d', 'Delimiter', '\n');
    predsArr = predsCellArr{1};
    fclose(fID);
    y = predsArr;
end