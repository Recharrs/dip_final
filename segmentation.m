% IM: original image (3D, type single)
% blurSize: size of averaging filter (odd number prefered)
% threshold: threshold for foreground
% Is: segmented image, only foreground is colored (3D)
function Is = segmentation(IM, blurSize, threshold)
    % Make sure the image is in type single
    IM = im2single(IM);
    
    % Get the RGB and Intensity for IM
    [R, G, B, I] = getRGBI(IM);
    
    % Blur the image
    Ib = blurImage(I, blurSize);
    
    % Thresholding the blurred image, only the foreground has value 1
    It = thresholding(Ib, threshold, 1);
    
    % Make the foreground colored only
    Is = noBackground(IM, It);
end