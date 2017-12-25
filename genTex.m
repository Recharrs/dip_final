function tex = genTex( style )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    blocks = img2blocks(style, 64);
    tex = genTexture(blocks{1}, 1024);

end

