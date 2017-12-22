function [output,inputEq] = color_hist(con_im , style_im )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    inputEq = histeq(con_im);
    output = imhistmatch(inputEq,style_im);
    
end

