function [value_map] = brushfire1(map)

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
    
%             if(row(i)-1 >= 1) && (row(i)-1 <= r) && (col(j)-1 >= 1) && (col(j)-1 <= c) && (value_map((row(i)-1),(col(j)-1)) == 0)
%                 value_map((row(i)-1),(col(j)-1)) = v(n) + 1;
%             elseif(row(i)-1 >= 1) && (row(i)-1 <= r) && (col(j) >= 1) && (col(j) <= c) && (value_map((row(i)-1),col(j)) == 0)
%                 value_map((row(i)-1),col(j)) = v(n) + 1;
%             elseif(row(i)-1 >= 1) && (row(i)-1 <= r) && (col(j)+1 >= 1) && (col(j)+1 <= c) && (value_map((row(i)-1),(col(j)+1)) == 0)
%                 value_map((row(i)-1),(col(j)+1)) = v(n) + 1;
%             elseif(row(i) >= 1) && (row(i) <= r) && (col(j)-1 >= 1) && (col(j)-1 <= c) && (value_map(row(i),(col(j)-1)) == 0)
%                 value_map(row(i),(col(j)-1)) = v(n) + 1;
%             elseif(row(i) >= 1) && (row(i) <= r) && (col(j)+1 >= 1) && (col(j)+1 <= c) && (value_map(row(i),(col(j)+1)) == 0)
%                 value_map(row(i),(col(j)+1)) = v(n) + 1;
%             elseif(row(i)+1 >= 1) && (row(i)+1 <= r) && (col(j)-1 >= 1) && (col(j)-1 <= c) && (value_map((row(i)+1),(col(j)-1)) == 0)
%                 value_map((row(i)+1),(col(j)-1)) = v(n) + 1;
%             elseif(row(i)+1 >= 1) && (row(i)+1 <= r) && (col(j) >= 1) && (col(j) <= c) && (value_map((row(i)+1),col(j)) == 0)
%                 value_map((row(i)+1),col(j)) = v(n) + 1;
%             elseif(row(i)+1 >= 1) && (row(i)+1 <= r) && (col(j)+1 >= 1) && (col(j)+1 <= c) && (value_map((row(i)+1),(col(j)+1)) == 0)
%                 value_map((row(i)+1),(col(j)+1)) = v(n) + 1;
%             end

        end
    end
    
    value = value + 1;
end

no_of_iterations = value - 1

end