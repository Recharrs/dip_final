% I: original image (3D)
% J: Style image (3D)
% S: Segment result (2D)
% alpha: Ratio
% Inew: result (3D)
function Inew = mixImage(I, J, S, alpha)
    I = im2single(I);
    J = im2single(J);
    
    [M, N, D] = size(I);
    Inew = I;
    for x = 1 : M
        for y = 1 : N
            if S(x, y) == 1
                Inew(x, y, :) = alpha * J(x, y, :) + (1 - alpha) * I(x, y, :);
            else
                Inew(x, y, :) = alpha * I(x, y, :) + (1 - alpha) * J(x, y, :);
            end
        end
    end
end