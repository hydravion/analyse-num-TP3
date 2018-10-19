function w = weight(x)

    w = [];
    n  = length(x) ;
       for i = [1 : n ]
           prod = 1;
           for j = [1 : n ]
               if (i ~= j)
                   prod = prod * (x(i) - x(j));
               end
           end
           w = [w 1 /prod];
       end
       
end

