function [value_map, trajectory] = wavefront1(map, start, end_point)

value_map = map;

[r,c] = size(value_map);

value = 2;

value_map(end_point(1), end_point(2)) = 2;

%Create an empty stack to 
stack = [];

%Assign the end point as the initial element in the stack
stack = [stack; [end_point(1), end_point(2)]];

%neighbourhood matrix
neighbour = [0,1;1,1;1,0;1,-1;0,-1;-1,-1;-1,0;-1,1];

%Iterate over the map until stack becomes empty again
while(~isempty(stack))
    
    %No. of rows in stack will be the no. of iterations
    row = size(stack);
    
    %count the iterations
    count = 1;
    
    for i = 1:row(1)
        
        i
        size(stack)
        %get the indices of the top pixel and set its potential
        index = stack(i,:);
        value_map(index(1), index(2)) = value;
        
        for k = 1:8
            %get each of the neighbour and add it to the stack if not
            %already present
            index_new = index + neighbour(k,:);
            
            %We use 'ismember' and 'all' functions to determine if the
            %current index is already present in the stack.
            vector = ismember(stack, index_new, 'rows');
            
            %vector is a column vector with a value '1' at wherever the
            %index is present. take the complement of vector so that it
            %contains all 1s if the value is not already present and check
            %using 'all()'
            vector = ~vector;
            
            if(value_map(index_new(1),index_new(2)) == 0) && (all(vector) == 1)
                stack = [stack; index_new];
            end
            
        end
        
        count = count + 1;
    end
    
    %increment the potential for the next iteration
    value = value + 1
    %delete the executed elements/rows from the stack
    stack(1:count,:) = [];
    
end

    trajectory = 1;

end