% I: original image (3D, type single)
% blurSize: size of averaging filter (odd number prefered)
% Is: segmented image, only foreground is colored (3D)
function [Is1, Is2, It1, It2] = segmentation(I)
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
    
    % Color the selected region only for the 2 pictures
    Is1 = noBackground(I, It1);
    Is2 = noBackground(I, It2);
end