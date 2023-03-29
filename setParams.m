function params = setParams(opts)    
     if ~isfield(opts,'Fs'); opts.Fs= 1000; end % initiate sampling rate to 1000 Hz;
    params = opts;
    
end