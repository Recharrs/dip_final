function tex = genTexture(patch, output_size);
  [m, m, d] = size(patch);
  tex = zeros(output_size, output_size, d);
  for i = 1 : output_size / m
    for j =  1 : output_size / m
      tex((i-1)*m+1:i*m, (j-1)*m+1:j*m, 1:d) = patch;
    end
  end
  tex = uint8(tex);
end