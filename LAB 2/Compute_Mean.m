function [ output_I1 ] = Compute_Mean(I, K)

    [i, j] = size(I);
    padzero = padarray(I, [(floor(K/2)), (floor(K/2))], 0, 'both'); 

    for x = 2:(i-1)
        for y = 2:(j-1)
            p = padzero(x:x+K-1, y:y+K-1);
            p_res = reshape(p ,1 ,K*K);
            p_sort= sort(p_res);
            % construct the new image
            output_I1(x,y) = uint8(ceil(sum(p_sort(:)))/(K*K)); 
        end
    end
end
