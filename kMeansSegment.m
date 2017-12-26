% I: original image (3D, type single, RGB)
% Is: segmented image
function Is = kMeansSegment(I)
    % Make sure the image is in type single
    I = im2single(I);
    M = size(I, 1);
    N = size(I, 2);
    
    % Convert the image to L*a*b* space
    Ilab = rgb2lab(I);
    
    % Take only a* and  b* and convert it to a 2-column matrix
    Iab = Ilab(:, :, 2 : 3);
    Iab = reshape(Iab, M * N, 2);
    
    % Number of segments
    K = 2;
    
    % Apply K-means algorithm on IMab
    % segID: Segment number for each pixel (1D)
    % segCenter: center pixel for each segment
    [segID, segCenter] = kmeans(Iab, K, 'distance', 'sqEuclidean', 'Replicates', 3);
    
    % Change the image back to 2D matrix
    Is = reshape(segID, M, N);
    
    % Make all value under 1
    Is = Is / K;
end