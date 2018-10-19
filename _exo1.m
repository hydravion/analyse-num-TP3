%f
n = 14;

bary_cheby = [];
lagrange_cheby = [];
b_cheby= [];

bary_equi = [];
lagrange_equi = [];
b_equi= [];
  for i = [3:n]
        cheby = chebychev();
        max = erreur_n((@(x) sin(x)), i, cheby);
        lagrange_cheby = [lagrange_cheby max(1)];
        bary_cheby = [bary_cheby max(2)];
        if 
  end
%g
n = 14;
bary_cheby = [];
lagrange_cheby = [];
b_cheby= [];

bary_equi = [];
lagrange_equi = [];
b_equi= [];
  for i = [3:n]
      
  end
  

