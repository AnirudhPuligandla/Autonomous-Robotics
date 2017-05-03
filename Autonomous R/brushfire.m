function [value_map] = brushfire(map)

[r,c] = size(map);

value_map = map;

%potential label
value = 1;

%Run the iterations until all the elements are non zero
while(nnz(value_map) ~= r*c)  
    
    %Iterate over the map
    for i=2:r-1
        for j=2:c-1
            
            %Change only the values that are non zero
            if (value_map(i,j) == 0)
                if (value_map(i-1,j-1) == value) || (value_map(i-1,j) == value) || (value_map(i-1,j+1) == value) || (value_map(i,j-1) == value) || (value_map(i,j+1) == value) || (value_map(i+1,j-1) == value) || (value_map(i+1,j) == value) || (value_map(i+1,j+1) == value)
                    value_map(i,j) = value + 1;
                end
            end

        end
    end
    
    value = value + 1;
end

no_of_iterations = value - 1

end