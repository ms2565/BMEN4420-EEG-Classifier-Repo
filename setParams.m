function params = setParams(opts)    
    if ~isfield(opts,'data'); opts.data= struct; end % initiate sampling rate to 1000 Hz;
    if ~isfield(opts.data,'Fs'); opts.data.Fs= 1000; end % initiate sampling rate to 1000 Hz;
    params = opts;
    
end