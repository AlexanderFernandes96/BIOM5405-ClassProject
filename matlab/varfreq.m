function [varF] = varfreq( ts)
    varF = zeros(1,90000);
    ts = ts - mean(ts);
    w = 200;
    Fs = 300;
    for i = 1 : 90000 - w
        Y = fft(ts(i : i+w));
        P2 = abs(Y/w);
        P1 = P2(1:w/2+1);
        P1(2:end-1) = 2*P1(2:end-1);
        f = Fs*(0:(w/2))/w;
        varF(i) = var(P1);
    end 
    for i = 1: w
        Y = fft([ts(90000-w-i : 90000),ts(1:i)]);
        P2 = abs(Y/w);
        P1 = P2(1:w/2+1);
        P1(2:end-1) = 2*P1(2:end-1);
        f = Fs*(0:(w/2))/w;
        varF(90000 - w + i) = var(P1);
    end
end