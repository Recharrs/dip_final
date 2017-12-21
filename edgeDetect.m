% im: original image (type single)
function IME = edgeDetect(IM)
    % Find IM's RGB
    R = IM(:, :, 1);
    G = IM(:, :, 2);
    B = IM(:, :, 3);
    
    % Find IM's Intensity
    I = 1 / 3 * (R + G + B);
    [M, N] = size(I);
    
    % Use Laplacian to find IM's edge
    edgeMask = -1 * [0, 1, 0; 1, -4, 1; 0, 1, 0];
    IME = conv2(I, edgeMask);
    IME = IME(1 : M, 1 : N);
end