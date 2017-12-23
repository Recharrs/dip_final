function [output] = color_hist(con_im , style_im)
    [m,n,d] = size(con_im);
    output = zeros(m,n,d);
    
    content_R = con_im(:,:,1);
    content_G = con_im(:,:,2);
    content_B = con_im(:,:,3);

    style_R = style_im(:,:,1);
    style_G = style_im(:,:,2);
    style_B = style_im(:,:,3);
    
    inputEq_R = histeq(content_R);
    inputEq_G = histeq(content_G);
    inputEq_B = histeq(content_B);

    output_R = imhistmatch(inputEq_R, style_R);
    output_G = imhistmatch(inputEq_G, style_G);
    output_B = imhistmatch(inputEq_B, style_B);

    output(:,:,1) = output_R;
    output(:,:,2) = output_G;
    output(:,:,3) = output_B;

    output = uint8(output);

end

