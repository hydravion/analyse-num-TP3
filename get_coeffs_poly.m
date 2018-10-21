function c = get_coeffs_poly(nodes,data,poly_type,rest_args)
%get_coeffs_poly returns the coefficients of the lagrangian, newtonian or
%Hermite polynomial.
%   get_coeffs_poly 

switch poly_type
    case "Lagrange"
        % create an array with the LKs (one in each row) and
        % multiply it with the y's of data to get a row vector of coefficients.
    
        LKs=[];
        n = length(data);

        for k = 1:n
            LKs=vertcat(LKs,coeff_LK(k,nodes)); % creates an array whose rows contain
                                                % the coefficients of the LK's
        end

        c = data*(LKs); % The matrix product of data with LKs returns the coefficients of
                        % the lagrangian polynomial.
                
    case "Newton"
        % compute the coefficients of the polynomials c0, c1(x-x0),
        % c2(x-x0)(x-x1), ... and store them in the array coeffs_polys.
        % Add the respective coefficients of those polynomials and return
        % the coefficients of the newtonian polynomial.
        
        
        % initialization
        n = length(nodes);
        coeffs_polys = zeros(n); % array of polynomials

        cks = differences_divisees([nodes;data]); % compute the ck's
        
        for k = 1:n % for each poly
            c_tmp = cks(k)*poly(nodes(1:k-1)); % compute ck*coeffs[(x-x0)(x-x1)...(x-x_{k-1})]
            len_c_tmp = length(c_tmp);
            coeffs_polys(k,[n-len_c_tmp+1:n]) = c_tmp; % add the coeffs to the kth row of the array
        end

        c = ones(1,n)*coeffs_polys; % sum the coefficients along the columns
        
    case "Hermite"
        z = rest_args;
        nodes = data(1,:);
        data = data(2,:);
        n = length(data)+length(z);
        coeffs_polys = zeros(n); % array of polynomials

        cks = differences_divisees_hermite([nodes;data],z); % compute the ck's
        
        for k = 1:length(cks) % for each poly
            c_tmp = cks(k)*poly(nodes(1:k-1)); % compute ck*coeffs[(x-x0)(x-x1)...(x-x_{k-1})] % CHANGER ICI ? PAGE WIKI HERMITE
            len_c_tmp = length(c_tmp);
            coeffs_polys(k,[n-len_c_tmp+1:n]) = c_tmp; % add the coeffs to the kth row of the array
        end

        c = ones(1,n)*coeffs_polys; % sum the coefficients along the columns
end

end

