clear all; clean all;
Nrows = 230;                                                 % the number of rows of the image
Mcolumns = 230;                                              % the number of columns of the image
I = imread('C:\Users\magma\Downloads\retriever.tiff');       % loading the image into matlab
imshow(I)
figure(1);
title('The original photo.')

%1st case: row sampling scale 1/2, column sampling scale 1/4
downsamplingA1 = imresize(I, [Nrows*1/2 Mcolumns*1/4], 'nearest');  % interpolation without antialising
downsamplingA2 = imresize(I, [Nrows*1/2 Mcolumns*1/4], 'bilinear');
downsamplingA3 = imresize(I, [Nrows*1/2 Mcolumns*1/4], 'bicubic');
figure(2);
subplot(1,3,1), imshow(downsamplingA1)                              % showing the results in the same figure
title('Downsample with interpolation : nearest')
subplot(1,3,2), imshow(downsamplingA2)
title({'1st case: row sampling scale 1/2, column sampling scale 1/4' ; 'Downsample with interpolation : bilinear'})
subplot(1,3,3), imshow(downsamplingA3)
title('Downsample with interpolation : bicubic')

downsampling1_1 = imresize(I, [Nrows*1/2 Mcolumns*1/4], 'Antialiasing', true);
downsampling1_2 = imresize(I, [Nrows*1/2 Mcolumns*1/4], 'Antialiasing', false);
figure(3);
subplot(1,2,1), imshow(downsampling1_1)
title('Downsample with Antialiasing')
subplot(1,2,2), imshow(downsampling1_2)
title('Downsample with Aliasing')

% upsampling with antialising and interpolation
upsampling1_1_1 = imresize(downsampling1_1, [Nrows*1/2*2 Mcolumns*1/4*4], 'nearest');
upsampling1_1_2 = imresize(downsampling1_1, [Nrows*1/2*2 Mcolumns*1/4*4], 'bilinear');
upsampling1_1_3 = imresize(downsampling1_1, [Nrows*1/2*2 Mcolumns*1/4*4], 'bicubic');
figure(4);
subplot(1,3,1), imshow(upsampling1_1_1)
title('Upsampling with nearest interpolation and Antialiasing')
subplot(1,3,2), imshow(upsampling1_1_2)
title('Upsampling with bilinear interpolation and Antialiasing')
subplot(1,3,3), imshow(upsampling1_1_3)
title('Upsampling with bicubic interpolation and Antialiasing')

% upsampling without antialising and interpolation
upsampling1_2_1 = imresize(downsampling1_2, [Nrows*1/2*2 Mcolumns*1/4*4], 'nearest');
upsampling1_2_2 = imresize(downsampling1_2, [Nrows*1/2*2 Mcolumns*1/4*4], 'bilinear');
upsampling1_2_3 = imresize(downsampling1_2, [Nrows*1/2*2 Mcolumns*1/4*4], 'bicubic');
figure(5);
subplot(1,3,1), imshow(upsampling1_2_1)
title('Upsampling with nearest interpolation and Aliasing')
subplot(1,3,2), imshow(upsampling1_2_2)
title('Upsampling with bilinear interpolation and Aliasing')
subplot(1,3,3), imshow(upsampling1_2_3)
title('Upsampling with bicubic interpolation and Aliasing')

%2nd case: row sampling scale 1/4, column sampling scale 1/2
downsampling2_1 = imresize(I, [Nrows*1/4 Mcolumns*1/2], 'Antialiasing', true);
downsampling2_2 = imresize(I, [Nrows*1/4 Mcolumns*1/2], 'Antialiasing', false);
figure(6);
subplot(1,2,1), imshow(downsampling2_1)
title({'2nd case: row sampling scale 1/4, column sampling scale 1/2' ; 'Downsample with Antialiasing'})
subplot(1,2,2), imshow(downsampling2_2)
title('Downsample with Aliasing')

upsampling2_1_1 = imresize(downsampling2_1, [Nrows*1/4*4 Mcolumns*1/2*2], 'nearest');
upsampling2_1_2 = imresize(downsampling2_1, [Nrows*1/4*4 Mcolumns*1/2*2], 'bilinear');
upsampling2_1_3 = imresize(downsampling2_1, [Nrows*1/4*4 Mcolumns*1/2*2], 'bicubic');
figure(7);
subplot(1,3,1), imshow(upsampling2_1_1)
title('Upsampling with nearest interpolation and Antialiasing')
subplot(1,3,2), imshow(upsampling2_1_2)
title('Upsampling with bilinear interpolation and Antialiasing')
subplot(1,3,3), imshow(upsampling2_1_3)
title('Upsampling with bicubic interpolation and Antialiasing')

upsampling2_2_1 = imresize(downsampling2_2, [Nrows*1/4*4 Mcolumns*1/2*2], 'nearest');
upsampling2_2_2 = imresize(downsampling2_2, [Nrows*1/4*4 Mcolumns*1/2*2], 'bilinear');
upsampling2_2_3 = imresize(downsampling2_2, [Nrows*1/4*4 Mcolumns*1/2*2], 'bicubic');
figure(8);
subplot(1,3,1), imshow(upsampling2_2_1)
title('Upsampling with nearest interpolation and Aliasing')
subplot(1,3,2), imshow(upsampling2_2_2)
title('Upsampling with bilinear interpolation and Aliasing')
subplot(1,3,3), imshow(upsampling2_2_3)
title('Upsampling with bicubic interpolation and Aliasing')

%3rd case: row sampling scale 1/8, column sampling scale 1/8
downsampling3_1 = imresize(I, 1/8, 'Antialiasing', true);
downsampling3_2 = imresize(I, 1/8, 'Antialiasing', false);
figure(9);
subplot(1,2,1), imshow(downsampling3_1)
title({'3rd case: row sampling scale 1/8, column sampling scale 1/8' ; 'Downsample with Antialiasing'})
subplot(1,2,2), imshow(downsampling3_2)
title('Downsample with Aliasing')

upsampling3_1_1 = imresize(downsampling3_1, 8, 'nearest');
upsampling3_1_2 = imresize(downsampling3_1, 8, 'bilinear');
upsampling3_1_3 = imresize(downsampling3_1, 8, 'bicubic');
figure(10);
subplot(1,3,1), imshow(upsampling3_1_1)
title('Upsampling with nearest interpolation and Antialiasing')
subplot(1,3,2), imshow(upsampling3_1_2)
title('Upsampling with bilinear interpolation and Antialiasing')
subplot(1,3,3), imshow(upsampling3_1_3)
title('Upsampling with bicubic interpolation and Antialiasing')

upsampling3_2_1 = imresize(downsampling3_2, 8, 'nearest');
upsampling3_2_2 = imresize(downsampling3_2, 8, 'bilinear');
upsampling3_2_3 = imresize(downsampling3_2, 8, 'bicubic');
figure(11);
subplot(1,3,1), imshow(upsampling3_2_1)
title('Upsampling with nearest interpolation and Aliasing')
subplot(1,3,2), imshow(upsampling3_2_2)
title('Upsampling with bilinear interpolation and Aliasing')
subplot(1,3,3), imshow(upsampling3_2_3)
title('Upsampling with bicubic interpolation and Aliasing')

%Calculating the MSE
err = immse(upsampling1_1_1, I); % replace 'upsampling1_1_1' with 'upsampling1_1_2' etc.
fprintf('\n The Mean-squared Error is %0.4f', err);

%Calculating the PSNR
rat = psnr(upsampling1_1_1, I); % replace 'upsampling1_1_1' with 'upsampling1_1_2' etc.
fprintf('\n The Peak Signal-to-Noise Ratio is %0.4f', rat);