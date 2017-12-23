function output = apply( con_im , style_im , k)
    [m,n,d] = size(con_im);
    style_re = imresize(style_im,[m n]);
    output_d = con_im*k+style_re*(1-k);
    output=floor(output_d);
end

