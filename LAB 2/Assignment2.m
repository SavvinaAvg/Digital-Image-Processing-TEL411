% Avgousti Savvina 2018030200
% Maragkoudaki Magdalini 2017030169

clc; clear; close all;

% Define menu items
menuItems = {'1.Exercise 1 (Mean Filter)', '2.Exercise 2 (Median Filter)', '3.Exercise 3 (Max & Min Filter)'};


while true
    choice = displayMenu(menuItems);
    
    % kernel values
    k1 = 3; k2 = 5; k3 = 9; k4 = 7; k5 = 11;

    if choice == 1
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Exercise 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        % import the images for Mean Filter
        i_mean1_1 = imread('Mean_Image1.jpeg');
        i_mean1 = rgb2gray(i_mean1_1);
        i_mean2 = imread('Mean_Image2.jpeg');
        figure;
        imshow(i_mean1)
        title('1st Original Photo for Mean Filter')
        figure;
        imshow(i_mean2)
        title('2nd Original Photo for Mean Filter')

        % calling the function Compute_Mean() for picture 1 & 2
        mean1_1 = Compute_Mean(i_mean1, k1);
        mean1_2 = Compute_Mean(i_mean1, k2);
        mean1_3 = Compute_Mean(i_mean1, k3);
        figure;
        subplot(1,3,1); imshow(mean1_1)
        title('Mean filter 3x3 picture 1')
        subplot(1,3,2); imshow(mean1_2)
        title('Mean filter 5x5 picture 1')
        subplot(1,3,3); imshow(mean1_3)
        title('Mean filter 9x9 picture 1')

        mean2_1 = Compute_Mean(i_mean2, k1);
        mean2_2 = Compute_Mean(i_mean2, k2);
        mean2_3 = Compute_Mean(i_mean2, k3);
        figure;
        subplot(1,3,1); imshow(mean2_1)
        title('Mean filter 3x3 picture 2')
        subplot(1,3,2); imshow(mean2_2)
        title('Mean filter 5x5 picture 2')
        subplot(1,3,3); imshow(mean2_3)
        title('Mean filter 9x9 picture 2')

    elseif choice == 2
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Exercise 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        % import the images for Median Filter
        i_median1 = imread('Median_Image1.png');
        i_median2 = imread('Median_Image2.png');
        figure;
        imshow(i_median1)
        title('1st Original Photo for Median Filter')
        figure;
        imshow(i_median2)
        title('2nd Original Photo for Median Filter')

        % calling the function Compute_Median() for picture 1 & 2
        median1_1 = Compute_Median(i_median1, [k2 k4]);
        median1_2 = Compute_Median(i_median1, [k1 k1]);
        median1_3 = Compute_Median(i_median1, [k3 k5]);
        figure;
        subplot(1,3,1); imshow(median1_1)
        title('Median filter 5x7 picture 1')
        subplot(1,3,2); imshow(median1_2)
        title('Median filter 3x3 picture 1')
        subplot(1,3,3); imshow(median1_3)
        title('Median filter 9x11 picture 1')

        median2_1 = Compute_Median(i_median2, [k2 k4]);
        median2_2 = Compute_Median(i_median2, [k1 k1]);
        median2_3 = Compute_Median(i_median2, [k3 k5]);
        figure;
        subplot(1,3,1); imshow(median2_1)
        title('Median filter 5x7 picture 2')
        subplot(1,3,2); imshow(median2_2)
        title('Median filter 3x3 picture 2')
        subplot(1,3,3); imshow(median2_3)
        title('Median filter 9x11 picture 2')

    elseif choice == 3
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Exercise 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        % import the images for Min-Max Filter
        i_min_max1_1 = imread('Min Max_Image1.jpeg');
        i_min_max1 = rgb2gray(i_min_max1_1);
        i_min_max2_1 = imread('Min Max_Image2.jpeg');
        i_min_max2 = rgb2gray(i_min_max2_1);
        figure;
        imshow(i_min_max1)
        title('1st Original Photo for Min & Max Filter')
        figure;
        imshow(i_min_max2)
        title('2nd Original Photo for Min & Max Filter')

        % calling the function Compute_Max() for picture 1 & 2
        max1_1 = Compute_Max(i_min_max1, [k1 k2]);
        max1_2 = Compute_Max(i_min_max1, [k2 k2]);
        max1_3 = Compute_Max(i_min_max1, [k4 k4]);
        figure;
        subplot(1,3,1); imshow(max1_1)
        title('Max filter 3x5 picture 1')
        subplot(1,3,2); imshow(max1_2)
        title('Max filter 5x5 picture 1')
        subplot(1,3,3); imshow(max1_3)
        title('Max filter 7x7 picture 1')

        max2_1 = Compute_Max(i_min_max2, [k1 k2]);
        max2_2 = Compute_Max(i_min_max2, [k2 k2]);
        max2_3 = Compute_Max(i_min_max2, [k4 k4]);
        figure;
        subplot(1,3,1); imshow(max2_1)
        title('Max filter 3x5 picture 2')
        subplot(1,3,2); imshow(max2_2)
        title('Max filter 5x5 picture 2')
        subplot(1,3,3); imshow(max2_3)
        title('Max filter 7x7 picture 2')

        % calling the function Compute_Min() for picture 1 & 2
        min1_1 = Compute_Min(i_min_max1, [k1 k2]);
        min1_2 = Compute_Min(i_min_max1, [k2 k2]);
        min1_3 = Compute_Min(i_min_max1, [k4 k4]);
        figure;
        subplot(1,3,1); imshow(min1_1)
        title('Min filter 3x5 picture 1')
        subplot(1,3,2); imshow(min1_2)
        title('Min filter 5x5 picture 1')
        subplot(1,3,3); imshow(min1_3)
        title('Min filter 7x7 picture 1')

        min2_1 = Compute_Min(i_min_max2, [k1 k2]);
        min2_2 = Compute_Min(i_min_max2, [k2 k2]);
        min2_3 = Compute_Min(i_min_max2, [k4 k4]);
        figure;
        subplot(1,3,1); imshow(min2_1)
        title('Min filter 3x5 picture 2')
        subplot(1,3,2); imshow(min2_2)
        title('Min filter 5x5 picture 2')
        subplot(1,3,3); imshow(min2_3)
        title('Min filter 7x7 picture 2')
      
    end
end