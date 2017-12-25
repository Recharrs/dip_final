% I: original image (3D, type single)
% blurSize: size of averaging filter (odd number prefered)
% Is: segmented image, only foreground is colored (3D)
function Is = segmentation(I)
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
    
    % Thresholding the blurred image, only the foreground has value 1
    % thre: threshold
    thre = 1;
    It = thresholding(Is, thre, 1);
    
    % If foreground and background is switched, change back
    [M, N] = size(It);
    if It(floor(M / 2), floor(N / 2)) == 0
        It = 1 - It;
    end
    
    % Make the foreground colored only
    Is = noBackground(I, It);
end