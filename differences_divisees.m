function c = differences_divisees(data)
n = length(data(1,:));
x = data(1,:);% regarde ca apres
y = data(2,:);
%initialisation de dd(differences divisees)
dd = zeros(n,n);%attention! on commence toutes les indices de 1 et pas de 0 comme le cours
for i = 1:n%faisons une boucle pour intialiser la premiere colonne de dd
    dd(1,i) = y(i);%la premiers colonne de la matrice dd(differences divisees est les y)
end

c = zeros(1,n);%initialisation de c
c(1) = y(1);%initialisation de c
for i = 2:n
    for j = 1:(n - (i - 1))
        dd(i,j) =( dd((i - 1),j) - dd((i - 1),j + 1)  ) /  (x(j) - x(j + (i - 1))  );%la formule pour calculer difference
        %divisee de i  en utilisant les differneces divisee de i - 1
    end
    c(i) = dd(i,1);%la premiere colonne de dd nous donne les coeffi
    
end

end