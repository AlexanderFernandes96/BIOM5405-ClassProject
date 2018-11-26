function [integ] = integtime( ts)
    integ = zeros(1,90000);
    w = 200;
    Fs = 300;
    for i = 1 : 90000 - w
        integ(i) = trapz(ts(i : i+w));
    end 
    for i = 1: w
        integ(90000 - w + i) = trapz([ts(90000-w-i : 90000),ts(1:i)]);
    end
end