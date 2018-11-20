% Load and source data set
source_path;
[als, control, hunt, park, train_name, train_age, train_height, train_weight, train_gender, train_GS] = load_train_data('./train/');

% Example
Fs = 300; % Sampling frequency = 300 Hz
als11 = als(1, :, 1); % als subject 1 foot 1
ctrl11 = control(1, :, 1); % control subject 1 foot 1
hunt11 = hunt(1, :, 1); % hunt subject 1 foot 1
park11 = park(1, :, 1); % park subject 1 foot 1

% Remove DC Offset
als11 = als11 - mean(als11);
ctrl11 = ctrl11 - mean(ctrl11);
hunt11 = hunt11 - mean(hunt11);
park11 = park11 - mean(park11);

figure(1)
plotfft(als11, Fs, 1.4); % Plot data between 0 - 10 Hz
hold on;
plotfft(ctrl11, Fs, 1.4);
plotfft(hunt11, Fs, 1.4);
plotfft(park11, Fs, 1.4);
hold off
title("Frequency Spectrum of Gait Speed")
xlabel("Frequency (Hz)")
ylabel("Amplitude")
legend("Als sub1 leg1", "Ctrl sub1 leg1", "Hunt sub1 leg1", "Park sub1, leg1")
