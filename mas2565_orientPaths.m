function params = mas2565_orientPaths(params)
    fsep = filesep;
    dataPath = params.paths.data;
    pathParts = split(dataPath,fsep);
    masterParts = pathParts(1:end-2);
    master = strjoin(masterParts,fsep);
    params.paths.stem = master;
    params.paths.ICA = fullfile(params.paths.stem,'ICA_EEG_Data');
    params.paths.modData = fullfile(params.paths.stem,'Modified Data');
    params.paths.imputeData = fullfile(params.paths.stem,'Imputed_Data');
    params.paths.BagA = fullfile(params.paths.stem,'Class_A_Bag');
end