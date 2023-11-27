function [ output_I ] = Compute_Max(I, K)

    [i, j] = size(I);
    padzero = padarray(I, [(floor(K(1)/2)), (floor(K(2)/2))], 0, 'both');

    for x = 1:i
        for y = 1:j
            p = padzero(x:x+K(1)-1, y:y+K(2)-1);
            p_res = reshape(p ,1 ,K(1)*K(2));
            p_sort= sort(p_res);
            % construct the new image
            output_I(x,y) = p_sort(ceil(end));
        end
    end

end

