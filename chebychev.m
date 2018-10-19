function x = chebychev(n)
    x = [];
        for i= [1 : n + 1]
               x = [x cos(((2 * i + 1)* pi) / (2 * n + 2))]
 
end

