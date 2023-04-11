function filtered_data = iaz2112filterdata(data)
%FILTER_EEG Applies a highpass filter and a notch filter to remove DC drift,60Hz power line noise, & 120Hz Harmonic of power line.
% data is a matrix of size (n_channels x n_samples)

fs = 1000;   % Sampling frequency in Hz
f_high = 0.5;   % Highpass cutoff frequency in Hz
order_high = 4;   % Filter order
[b_high, a_high] = butter(order_high, f_high/(fs/2), 'high');   % Design the highpass filter using Butterworth method

f_notch = 60;   % Notch frequency in Hz
f_notch_width = 5;   % Notch frequency width in Hz
order_notch = 25;   % Filter order
[b_notch, a_notch] = iirnotch(f_notch/(fs/2), f_notch_width/(fs/2), order_notch);   % Design the notch filter using IIR method

f_notch2 = 120;   % Notch frequency in Hz
f_notch_width2 = 5;   % Notch frequency width in Hz
order_notch2 = 30;   % Filter order
[b_notch2, a_notch2] = iirnotch(f_notch2/(fs/2), f_notch_width2/(fs/2), order_notch2);   % Design the notch filter using IIR method

n_channels = size(data, 1); % number of channels
filtered_data = zeros(size(data)); % initialize filtered data matrix

for i = 1:n_channels
    y1 = filtfilt(b_high, a_high, data(i,:)); % apply highpass filter
    y2 = filtfilt(b_notch, a_notch, y1); % apply notch filter
    y3 = filtfilt(b_notch2, a_notch2, y2); % apply second notch filter
    filtered_data(i,:) = y3; % store filtered data
end

end
