% I: original image's intensity (type single)
% n: size of averaging filter
% Ib: blurred image
function Ib = blurImage(I, n)
    % averaging filter
    mean = 1 / (n ^ 2) * ones(n);
    
    Ib = conv2(I, mean);
end