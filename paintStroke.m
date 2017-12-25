function [canvas] = paintStroke(canvas, x, y, p0, p1, c, rad)
  szIm = size(canvas); szIm = szIm(1:2);
  idx = markStroke(zeros(szIm), p0, p1, rad, 1) > 0;
 
  %% Paint
  if any(idx(:))
      canvas = reshape(canvas, prod(szIm),3);
      xy = y(idx) + szIm(1) * (x(idx)-1);
      canvas(xy, :) = repmat(c(:)', length(xy), 1); 
      canvas = reshape(canvas, [szIm, 3]);
  end
end
