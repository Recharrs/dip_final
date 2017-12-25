% I: original image's intensity (type single)
% n: size of averaging filter
% Ib: blurred image
function Ib = blurImage(I, n)
    % averaging filter
    mean = 1 / (n ^ 2) * ones(n);
    
    % mirror padding
    I = padarray(I, [floor(n / 2), floor(n / 2)], 'symmetric', 'both');
    [M, N] = size(I);
    
    % convolution with the averaging filter
    Ib = conv2(I, mean);
    Ib = Ib((1 + floor(n / 2)) : (M - floor(n / 2)), (1 + floor(n / 2)) : (N - floor(n / 2)));
end