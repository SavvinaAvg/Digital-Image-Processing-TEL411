function [ convImage ] = convolution(I,k)

    g = k(end:-1:1,end:-1:1);  %kernel flip
    [m,n] = size(g);
    [i,j] = size(I);
    
    im = double(I);   %to avoid problems with multiplication
    
    h = zeros(size(im)-2*floor([m n]/2));    %calculate size of h, given padded image and kernel
    for x = 1:size(h,1)
        for y = 1:size(h,2)
            h(x,y) = sum(sum(g.*im(x:x+m-1, y:y+n-1)));     %operation of convolution
        end
    end
    
    convIm = imresize(h, [i-4 j-4]); % the new size is i-4 & j-4 because padarray -> [2,2]
    convImage = uint8(convIm);
end

