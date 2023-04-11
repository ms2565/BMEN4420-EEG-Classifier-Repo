clear; clc; close all
params = setParams(struct);
    params.paths.data = which('standard60.loc');
    fsep = filesep;
    params.paths.data = strrep(params.paths.data,strcat(fsep,'standard60.loc'),'');
    params = loadData(params);
data = params.data.sub01.X_EEG_TRAIN;
trial12 = [data(30, :, 1) data(30, :, 2)];

% Fs = 1000;  % Sampling Frequency
% 
% N      = 8;    % Order
% Fpass1 = 0.5;  % First Passband Frequency
% Fpass2 = 40;   % Second Passband Frequency
% Apass  = 2;    % Passband Ripple (dB)
% 
% % Construct an FDESIGN object and call its CHEBY1 method.
% h  = fdesign.bandpass('N,Fp1,Fp2,Ap', N, Fpass1, Fpass2, Apass, Fs);
% Hd = design(h, 'cheby1');

% y = bandpass(trial1,[0.5 40],1000);
% Fs = 1000;  % Sampling Frequency
% 
% N     = 500;  % Order
% Fstop = 0;    % Stopband Frequency
% Fpass = 1;    % Passband Frequency
% Wstop = 1;    % Stopband Weight
% Wpass = 1;    % Passband Weight
% dens  = 20;   % Density Factor
% 
% % Calculate the coefficients using the FIRPM function.
% b  = firpm(N, [0 Fstop Fpass Fs/2]/(Fs/2), [0 0 1 1], [Wstop Wpass], ...
%            {dens});
% Hd = dfilt.dffir(b);
% 
% Fs = 1000;  % Sampling Frequency
% 
% 
% Fpass1 = 50;               % First Passband Frequency
% Fstop1 = 55;               % First Stopband Frequency
% Fstop2 = 65;               % Second Stopband Frequency
% Fpass2 = 70;               % Second Passband Frequency
% Dpass1 = 0.0057563991496;  % First Passband Ripple
% Dstop  = 0.44668359215;    % Stopband Attenuation
% Dpass2 = 0.0057563991496;  % Second Passband Ripple
% dens   = 20;               % Density Factor
% 
% % Calculate the order from the parameters using FIRPMORD.
% [N, Fo, Ao, W] = firpmord([Fpass1 Fstop1 Fstop2 Fpass2]/(Fs/2), [1 0 ...
%                           1], [Dpass1 Dstop Dpass2]);
% 
% % Calculate the coefficients using the FIRPM function.
% b2  = firpm(N, Fo, Ao, W, {dens});
% FIR_Filter = dfilt.dffir(b);
% % [EOF]
% y1 = filtfilt(b, 1, trial12);
% plot(trial12)
% hold on
% plot(filtfilt(b2, 1, y1))
% legend('unfiltered', 'filtered')


fs = 1000; % sampling frequency in Hz
fc = 0.5; % highpass cutoff frequency in Hz
order = 5; % filter order
[b, a] = butter(order, fc/(fs/2), 'high'); % design the highpass filter using Butterworth method
y1 = filtfilt(b, a, trial12);
 plot(trial12)
 hold on
 plot(y1)
legend('unfiltered', 'filtered')
n = length(trial12);          % number of samples
f = (0:n-1)*(1000/n);     % frequency range
power = abs(y1).^2/n;    % power of the DFT
figure()
plot(f,power)
xlabel('Frequency')
ylabel('Power')
%xlim([0 1])