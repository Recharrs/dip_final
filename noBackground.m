% I: original image (3D)
% J: thresholded image for comparison (2D)
% Inew: result (3D)
function Inew = noBackground(I, J)
    [M, N, D] = size(I);
    Inew = I;
    for x = 1 : M
        for y = 1 : N
            if J(x, y) < 1
                Inew(x, y, :) = 0;
            end
        end
    end
end