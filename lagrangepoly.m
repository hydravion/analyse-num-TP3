function p = lagrangepoly(nodes, data)%definissons une fonction qui donne les coefficients du polynome de lagrange
  
   
    p = zeros(size(nodes)); %initialisation de p
    coeffsDeLk = zeros(size(nodes));%initialisation de coeffsDeLk

    %L1 = c11x^n+c12x^(n - 1)...
    %L2 = c21x`n+c22x^(n - 1)...
    %.
    %.
    %.
    %----------------------
    %pLagrange= (c11 + c21 +...cn1)* y1 * x^n +...
    %p(1) = (c11 + c21 +...cn1)* y1
    %calculons p qui est les coefficients du polynome de lagrange
    %donc il faut ajoter les coefficients de chaque polynome de lagrange et
    %le pultipier par yi
    for k = 1:length(nodes)
   
      coeffsDeLk = coeff_LK(k,nodes);  %gardons tous les constantes dun lk dans coeffsDeLk
   
      p = p + coeffsDeLk * data(k);%ajoutons les coefficients dun Lk à Lk+1
         
    end
end