function diff = gdiff(n, x)
     diff = (1 / 2) * factorial(n) * (-1)^n * ((x - 1)^(-(n + 1)) - (x + 1).^(-(n + 1)));
end

