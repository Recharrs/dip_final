% IM: original 3D color image
function [R, G, B, I] = getRGBI(IM)
    % Find IM's RGB
    R = IM(:, :, 1);
    G = IM(:, :, 2);
    B = IM(:, :, 3);
    
    % Find IM's Intensity
    I = 1 / 3 * (R + G + B);
end