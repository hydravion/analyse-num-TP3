function c = differences_divisees_hermite(data,z)
%differences_divisees_hermite returns the divided differences of a list of n (xi,yi)
%   differences_divisees iteratively computes divided differences for a
%   list of n (xi,yi) and stores them in an array. It then returns the diagonal
%   of the array as a row vector.
%   INPUT: data=[x1 x2 ... xn ; y1 y2 ... yn], z=[z1 z2 ... zn] or z=[z1 z2 ... zn ; index_z1 index_z2 ... index_zn]
%   OUTPUT: c (the divided differences)

    function divided_diff = initialize_array_divided_diff()
    % initialize_array_divided_diff 
    %
        array = zeros(n);
        y = data(2,:);
        for k = 1:length(z)
            m = z(2,k)+k-1;
            y = [y(1:m), y(m), y(m+1:length(y))];
        end
        array(:,1) = y; % first column of divided_diff is vector of yi
        
        divided_diff = array;
    end

    function divided_diff = get_divided_diff(m,k,div_diff)
    % get_divided_diff computes divided differences using the formula seen in
    %   class. It looks up divided differences of lesser degrees in the array
    %   divided_diff and x's in data.
        
        if k == 2 && div_diff(m,k-1) == div_diff(m-1,k-1)
            divided_diff = z(1,m/2);
        else
            divided_diff = (div_diff(m,k-1)-div_diff(m-1,k-1)) / (y(1,m)-y(1,m-k+1));
        end
    end

    % initialization
    size_z = size(z);
    if size_z(1) == 1 % add indices to z if they weren't given explicitly
        z = [z ; 1:1:length(z)]; % (eg. turns z=[13 21 7] into z=[13 21 7 ; 1 2 3])
    end
    
    n = length(data)+length(z);
    divided_diff = initialize_array_divided_diff(); % array of divided differences as in the lecture notes
    y = transpose(divided_diff(:,1));

    for k = 2:n
        for m = k:n
            divided_diff(m,k) = get_divided_diff(m,k,divided_diff); % computes the divided differences iteratively
        end
    end

    % The diagonal of divided_diff contains the ck's used in Newton's formula
    c = transpose(diag(divided_diff)); % returns the diagonal of the array as a row vector

end
