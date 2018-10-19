function y = erreur_n(afun,n,x)
    y=afun(x);
    lagrange=lagrangepoly(x,y);
    pn=polyval(lagrange,x);
    max_lagrange=max(abs(pn-y));
    
    pn = barycentre(x,y,x);
    max_bary = max(abs(pn - y));
    
                                                          
    y = [max_lagrange max_bary];

end

