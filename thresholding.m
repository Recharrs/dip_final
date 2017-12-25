% input: original image (type single)
% output: thresholded image (type single)
% belowThreValue: the value assigned for pixels below threshold
function output = thresholding(input, threshold, belowThreValue)
    [M, N] = size(input);
    output = zeros(M, N);
    for x = 1 : M
        for y = 1 : N
            if input(x, y) < threshold 
                output(x, y) = belowThreValue;
            else
                output(x, y) = 1 - belowThreValue;
            end
        end
    end
end