function diff = fdiff(n,x)
   if (mod(n,4) == 0)
       diff = sin(x);
   elseif(mod(n,4) == 1)
        diff = cos(x);
   elseif(mod(n,4) == 2)
        diff = -1 * sin(x);
   else
       diff = -1 * cos(x);
   end
end

