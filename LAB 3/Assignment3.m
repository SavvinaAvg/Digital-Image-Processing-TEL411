% Avgousti Savvina 2018030200
% Maragkoudaki Magdalini 2017030169

clc; clear; close all;

% creating the filter
gFilter = fspecial('gaussian',[15,15],20);

i = imread('lena_gray_512.tif');
figure;
subplot(2,3,2); imshow(i)
title('Original Photo')

% padding the image with zeros.
i_pad = padarray(i,[2,2],0,'both');
%imshow(i_pad);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Exercise 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculating the convolution
conv1_1 = convolution(i_pad, gFilter);
subplot(2,3,4); imshow(conv1_1)
title('Convolution using the "convolution" function.')

% Calculating the MSE
err1_1 = immse(conv1_1, i); 
fprintf('The Mean-squared Error using our function is %0.4f\n', err1_1);
% Calculating the PSNR
rat1_1 = psnr(conv1_1, i);
fprintf('The Peak Signal-to-Noise Ratio using our function is %0.4f\n', rat1_1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Exercise 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculating the convolution
[x,y] = size(i);
conv1_2 = uint8(conv2(double(i_pad), gFilter, 'valid'));
conv1_2_1 = imresize(conv1_2, [x y]);
%conv1_2 = conv1_2(3:end-2, 3:end-2);
subplot(2,3,5); imshow(conv1_2_1)
title('Convolution using the "conv2" function.')

% Calculating the MSE
err1_2 = immse(conv1_2_1, i); 
fprintf('The Mean-squared Error using conv2 is %0.4f\n', err1_2);
% Calculating the PSNR
rat1_2 = psnr(conv1_2_1, i);
fprintf('The Peak Signal-to-Noise Ratio using conv2 is %0.4f\n', rat1_2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Exercise 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculating the convolution
conv1_3 = uint8(imfilter(i, gFilter, 'conv'));
conv1_3_1 = imresize(conv1_3, [x y]);
subplot(2,3,6); imshow(conv1_3_1)
title('Convolution using the "imfilter" function.')

% Calculating the MSE
err1_3 = immse(conv1_3_1, i); 
fprintf('The Mean-squared Error using imfilter is %0.4f\n', err1_3);
% Calculating the PSNR
rat1_3 = psnr(conv1_3_1, i);
fprintf('The Peak Signal-to-Noise Ratio using imfilter is %0.4f\n', rat1_3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Exercise 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculating the fft2() & ifft()
fft1_4_1 = fft2(i);
fft1_4_2 = fft2(gFilter,x,y);
fft1_4 = fft1_4_1.*fft1_4_2;
figure;
subplot(1,2,1); imshow(fft1_4)
title('Convolution using the "fft2" function.')

fft1_5 = uint8(ifft2(fft1_4));
subplot(1,2,2); imshow(fft1_5)
title('Convolution using the "ifft2" function.')

% Calculating the MSE
err1_4 = immse(fft1_5, i); 
fprintf('The Mean-squared Error using fft2 & ifft2 is %0.4f\n', err1_4);
% Calculating the PSNR
rat1_4 = psnr(fft1_5, i);
fprintf('The Peak Signal-to-Noise Ratio using fft2 & ifft2 is %0.4f\n', rat1_4);
