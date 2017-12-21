function output = apply( con_im , style_im , k)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    [m,n,d] = size(con_im);
    style_re = imresize(style_im,[m n]);
    output_d = con_im*k+style_re*(1-k);
    output=floor(output_d);
    
end

