function [ ] = plotfft( ts, Fs, Fr )
%PLOTFFT Plots the fourier transform of time series data
% Input
% ts: time series data vector
% Fs: sampling frequency
% Fr: highest frequency range to plot on frequency spectrum subplot

Y = fft(ts);
L = length(ts);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f(1:length(f)*2*Fr/Fs), P1(1:length(P1)*2*Fr/Fs))

end

