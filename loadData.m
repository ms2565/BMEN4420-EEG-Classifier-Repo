function params = loadData(params)
    params.data.sub01 = load(fullfile(params.paths.data,'Subject_1.mat'));
    params.data.sub02 = load(fullfile(params.paths.data,'Subject_2.mat'));
    params.data.sub03 = load(fullfile(params.paths.data,'Subject_3.mat'));
    params.data.sub04 = load(fullfile(params.paths.data,'Subject_4.mat'));
    params.data.sub05 = load(fullfile(params.paths.data,'Subject_5.mat'));
    params.data.sub06 = load(fullfile(params.paths.data,'Subject_6.mat'));
    params.data.sub07 = load(fullfile(params.paths.data,'Subject_7.mat'));
    params.data.sub08 = load(fullfile(params.paths.data,'Subject_8.mat'));
end