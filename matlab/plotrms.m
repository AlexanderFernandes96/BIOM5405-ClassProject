x = als11;
y = zeros(1, length(x-1))
for n = 2 : length(x)
    y(n-1) = x(n) - x(n-1);
end

plot(y)    
    