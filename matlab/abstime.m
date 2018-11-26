function [abst] = abstime( ts)
    abst = abs(ts - mean(ts));
    plot(abst);