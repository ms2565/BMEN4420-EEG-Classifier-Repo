function y1 = iaz2112bandpass(data);
%IAZ2112BANDPASS Returns a discrete-time filter object.


%filter for removal of DC drift
fs = 1000; % sampling frequency in Hz
fc = 0.5; % highpass cutoff frequency in Hz
order = 4; % filter order
[b, a] = butter(order, fc/(fs/2), 'high'); % design the highpass filter using Butterworth method
y1 = filtfilt(b, a, data);
 plot(data)
 hold on
 plot(y1)
legend('unfiltered', 'filtered')


n = length(data);          % number of samples
f = (0:n-1)*(1000/n);     % frequency range
power = abs(y1).^2/n;    % power of the DFT
figure()
plot(f,power)
xlabel('Frequency')
ylabel('Power')

%% 60Hz Notch Filter


Fs = 1000;  % Sampling Frequency


Fpass1 = 50;               % First Passband Frequency
Fstop1 = 55;               % First Stopband Frequency
Fstop2 = 65;               % Second Stopband Frequency
Fpass2 = 70;               % Second Passband Frequency
Dpass1 = 0.0057563991496;  % First Passband Ripple
Dstop  = 0.44668359215;    % Stopband Attenuation
Dpass2 = 0.0057563991496;  % Second Passband Ripple
dens   = 20;               % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass1 Fstop1 Fstop2 Fpass2]/(Fs/2), [1 0 ...
                          1], [Dpass1 Dstop Dpass2]);

% Calculate the coefficients using the FIRPM function.
b2  = firpm(N, Fo, Ao, W, {dens});
y2 = filtfilt(b2, a, y1);
figure()
 plot(data)
 hold on
 plot(y2)
legend('unfiltered', 'filtered')


n = length(data);          % number of samples
f = (0:n-1)*(1000/n);     % frequency range
power = abs(y2).^2/n;    % power of the DFT
figure()
plot(f,power)
xlabel('Frequency')
ylabel('Power')

