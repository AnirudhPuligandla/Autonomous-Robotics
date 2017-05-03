function [path_smooth]=smooth(map,path,vertices,delta)

end_index = path(length(path));
q_end = vertices(end_index,:); % Initially, q_end is the goal point
path_smooth = [end_index];
while end_index ~= path(1)
    % Update start_vertex
    for i = 1 : length(path) - 1
        start_index = path(i);
        q_start = vertices(start_index,:);
        
        % Get the unit vector from q_start to q_end
        v = q_end - q_start;
        v_norm = norm(v);
        v = v ./ norm(v);
        
        sep_num = floor(v_norm / delta);
        % q_start and q_end is near enough, q_end can be directly updated
        if sep_num == 0
            end_index = start_index;
            q_end = vertices(end_index,:);
            path_smooth = [end_index,path_smooth];
            break;
        else
            ob = 0;
            for j = 1 : sep_num
                q_middle = floor(q_start + j * delta .* v);
                if map(q_middle(1), q_middle(2)) ~= 0
                    ob = 1;
                    break;
                end
            end
            % Free space between two q_start and q_end
            if ob == 0
                end_index = start_index;
                q_end = vertices(end_index,:);
                path_smooth = [end_index,path_smooth];
                break;
            end
        end
            
    end
end