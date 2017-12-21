% input: original image (type single)
% output: thresholded image (type single)
function output = thresholding(input, threshold)
    [M, N] = size(input);
    output = zeros(M, N);
    for x = 1 : M
        for y = 1 : N
            if input(x, y) < threshold 
                output(x, y) = 0;
            else
                output(x, y) = 1;
            end
        end
    end
end