
function c = coeff_LK(k,nodes)%trouvons les coefficients du polynome lk.nodes contient x1,x2,...
 
   
    xk = nodes(k);%prenons le kieme element et gardons-le
    nodes(k) = []; %enlevons le kieme element
    c = poly(nodes);%trouvons les coefficients d'un polynome avec x1,x2,... comme racines
    ensembleDeDenom = xk - nodes;%on construit un ensemble de xk - x1,xk - x2,...
   
    c = c /  prod(ensembleDeDenom) ;%on divise chaque element de c par (xk - x1)*(xk - x2) *...
    
   
end




