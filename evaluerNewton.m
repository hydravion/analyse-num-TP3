function a = evaluerNewton(data, c,x)
    n = length(data);
    p = zeros(1,n); %p est l'ensemble des termes du polynome de newton
    p(1) = 1; 
    a = zeros(1,length(x));%initialisation de a
    for j = 1: length(x)%on va evaluer le polynome sur chaque element de x 
        p(1) = 1;
        for i = 1:n - 1
            p(i + 1) = p(i) * (x(j) - data(i)) ;%on crée chaque terme a partir du terme precendent
            %multiplié par x - x(i + 1) comme on voit dans la formule
        end
        p = p .* c; %il faut multiplier chaque terme du polynome de newtonv par les coefficients de newton
        a(j) = sum(p);%on trouve le produit pour x(j)
    end
   
end