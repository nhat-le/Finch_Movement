function [jumps, crossings] = find_jumps(x, boundary, left, right, margin)
% Returns indices of jumps
start_pt = x(1:end-1);
end_pt = x(2:end);

crossings = (start_pt(:,1) > boundary & end_pt(:,1) < boundary) | ...
                (start_pt(:,1) < boundary & end_pt(:,1) > boundary);
possible_jump = find(crossings);
jumps = x(max(possible_jump - margin, 1)) < left & ...
        x(min(possible_jump + margin, numel(x))) > right | ...
    x(min(possible_jump + margin, numel(x))) < left & ...
    x(max(possible_jump - margin,1)) > right;