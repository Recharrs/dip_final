function blocks = img2blocks(image, patch_size);
  
  row_size = patch_size * ones(1, floor(size(image, 1) / patch_size));
  col_size = patch_size * ones(1, floor(size(image, 2) / patch_size));
  
  crop_image = zeros(sum(row_size), sum(col_size), 3);
  crop_image = image(1:sum(row_size),1:sum(col_size),1:end) ;

  blocks = mat2cell(crop_image, row_size, col_size, 3);
end