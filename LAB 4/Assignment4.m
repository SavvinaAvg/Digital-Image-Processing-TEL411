% Avgousti Savvina 2018030200
% Maragkoudaki Magdalini 2017030169

clc; clear all; close all;

im1 = imread('axones1.png');
i1 = rgb2gray(im1);
im2 = imread('axones2.png');
i2 = rgb2gray(im2);
figure;
subplot(2,1,1); imshow(i1)
title('Original Photo Axones1')
subplot(2,1,2); imshow(i2)
title('Original Photo Axones2')

% Denoising the image
% Combination of structural elements & imopen and imclose
se1 = strel('line',5,45);       % line, length 5, angle 45 degrees
se2 = strel('line',5,45);       % line, length 5, angle 45 degrees
im1_op_ln2 = imopen(i1,se1); 
im1_cl_sq2 = imclose(im1_op_ln2,se2); 
figure;
subplot(2,1,1);
imshowpair(i1,im1_cl_sq2,'montage') 
title('Image 1 -> sequential filter: open&close, str. element: line.');
im2_op_ln2 = imopen(i2,se1); 
im2_cl_sq2 = imclose(im2_op_ln2,se2); 
subplot(2,1,2);
imshowpair(i2,im2_cl_sq2,'montage') 
title('Image 2 -> sequential filter: open&close, str. element: line.');

% Enhancement of linear structures
bw1 = edge(im1_cl_sq2, 'Prewitt', [], 'both', 'nothinning');
figure;
subplot(2,1,1)
imshow(bw1);
title('Image 1: Enhancement of linear structures with prewitt');
bw2 = edge(im1_cl_sq2, 'Sobel', [], 'both', 'nothinning');
subplot(2,1,2)
imshow(bw2);
title('Image 1: Enhancement of linear structures with sobel')

bw3 = edge(im2_cl_sq2, 'Prewitt', [], 'both', 'nothinning');
figure;
subplot(2,1,1)
imshow(bw3);
title('Image 2: Enhancement of linear structures with prewitt');
bw4 = edge(im2_cl_sq2, 'Sobel', [], 'both', 'nothinning');
subplot(2,1,2)
imshow(bw4);
title('Image 2: Enhancement of linear structures with sobel')

% Binarization
BW1_dil = imdilate(bw1, strel('diamond', 1));
figure;
subplot(3,1,1)
imshow(BW1_dil);
title('Image 1: Dilated Gradient Mask');
BW1_fill = imfill(BW1_dil, 'holes');
subplot(3,1,2)
imshow(BW1_fill);
title('Image 1: Binary image with filled holes');
BW1_erode = imerode(BW1_fill, strel('line', 11, 30)); 
subplot(3,1,3)
imshow(BW1_erode);
title('Image 1: Eroded Gradient Mask');

BW3_dil = imdilate(bw3, strel('diamond', 1));
figure;
subplot(3,1,1)
imshow(BW3_dil);
title('Image 2: Dilated Gradient Mask');
BW3_fill = imfill(BW3_dil, 'holes');
subplot(3,1,2)
imshow(BW3_fill);
title('Image 2: Binary image with filled holes');
BW3_erode = imerode(BW3_fill, strel('line', 11, 45));
subplot(3,1,3)
imshow(BW3_erode);
title('Image 2: Eroded Gradient Mask');

% Skeletalization
skel1 = bwmorph(BW1_erode,'skel',Inf);
figure;
subplot(2,1,1)
imshow(skel1);
title('Image 1: Skeleton');
skel3 = bwmorph(BW3_erode, 'skel', Inf);
subplot(2,1,2)
imshow(skel3), title('Image 2: Skeleton');

% Connection of the skeleton
i_fin1 = bwmorph(skel1,'skel',Inf);
i_fin1_1 = imfill(i_fin1, 'holes');
i_fin1_2 = bwperim(i_fin1);
figure;
subplot(2,1,1)
imshow(i_fin1_2,'displayrange',[]);
title('Image 1: Skeleton');
subplot(2,1,2)
imshow((double(i1)+335*i_fin1)/(926+335))
title('Image 1: Original Image with the Skeleton');

i_fin3 = bwmorph(skel3,'skel',Inf);
i_fin3_1 = imfill(i_fin3, 'holes');
i_fin3_2 = bwperim(i_fin3_1);
figure;
subplot(2,1,1)
imshow(i_fin3_2,'displayrange',[]);
title('Image 2: Skeleton');
subplot(2,1,2)
imshow((double(i2)+340*i_fin3)/(929+340))
title('Image 2: Original Image with the Skeleton');