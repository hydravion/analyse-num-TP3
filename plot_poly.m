function plot_poly(f,interval,number_nodes, poly_type,interval_type, rest_args)
%plot_poly plots a function f and its lagrangian or newtonian polynomial
%   plot_poly 

switch interval_type
    case "Uniform"
        nodes = linspace(interval(1),interval(length(interval)),number_nodes); % find the nodes (ex: [0:1/5:1])
    case "Chebyshev"
        chebyshev_nodes = @(k,n) cos((2*k+1)*pi/(2*n+2)); % the formula
        
        n = number_nodes;
        indices = linspace(0,n,n+1);
        nodes = chebyshev_nodes(indices,n); % we apply the formula to k = 0,...,n
end

data = f(nodes);

switch poly_type
    case "Lagrange"
        poly_coeffs = get_coeffs_poly(nodes,data,"Lagrange"); % coefficients of Lagrangian polynomial
    case "Newton"
        poly_coeffs = get_coeffs_poly(nodes,data,"Newton");
    case "Hermite"
        z = rest_args;
        poly_coeffs = get_coeffs_poly(nodes,data,"Hermite",z);
end

x_poly = interval; % x's and y's to plot the polynomial (for the plot)
y_poly = polyval(poly_coeffs,x_poly);
x_nodes = nodes;
y_nodes = polyval(poly_coeffs,x_nodes); %x's and y's to plot the nodes as circles


% we plot f, the polynomial and the nodes
plot(interval,f(interval),'b--',x_poly,y_poly,'r',x_nodes,y_nodes,'bo')

end

