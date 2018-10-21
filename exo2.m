data = [0 1 2 3 4 ; 0 1 4 9 16];
z = [0 0 0 0 0];
%differences_divisees_hermite(data,z)

g = @(x) 2*x.^3+x-1;

% figure
% plot_poly(g,0:1/100:1,5,"Newton","Uniform")
% 
% 

poly_coeffs = get_coeffs_poly([],data,"Hermite",z);

interval = 0:1/100:1;
x_poly = interval; % x's and y's to plot the polynomial (for the plot)
y_poly = polyval(poly_coeffs,x_poly);

% we plot f, the polynomial and the nodes
figure
plot(interval,g(interval),'b--',x_poly,y_poly,'r')