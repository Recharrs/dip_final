% I: original image (3D, type single)
% blurSize: size of averaging filter (odd number prefered)
% Is: segmented image, only foreground is colored (3D)
function [If1, If2, It1, It2] = segmentation(I)
    % Make sure the image is in type single
    I = im2single(I);
    Ib = I;
    
    % Blur the color image
    % blurSize: size of averaging filter (odd number prefered)
    blurSize = 7;
    for i = 1 : 3
        Ic = I(:, :, i);
        Ib(:, :, i) = blurImage(Ic, blurSize);
    end
    
    % Apply K-means segmentation algorithm
    Is = kMeansSegment(Ib);
    
    % Thresholding the blurred image, make 2 pictures
    % One with only foreground, one eith only background
    % thre: threshold
    thre = 1;
    It1 = thresholding(Is, thre, 1);
    It2 = thresholding(Is, thre, 0);
    
    % Fill holes in the thresholded images
    It1 = imfill(It1, 'holes');
    It2 = imfill(It2, 'holes');
    
    % Color the selected region only for the 2 pictures
    If1 = noBackground(I, It1);
    If2 = noBackground(I, It2);
end