function [canvas] = paintStroke(canvas, x, y, p0, p1, c, rad)
  %% Paint a stroke from pixel p0 = (x0, y0) to pixel p1 = (x1, y1)
  %% on the canvas (ny x nx x 3 double array).  
  %% The stroke has rgb values given by c (a 3 x 1 vector, with
  %% values in [0, 1].  The paintbrush is circular with radius rad>0
    
  szIm = size(canvas); szIm = szIm(1:2);
  idx = markStroke(zeros(szIm), p0, p1, rad, 1) > 0;
 
  %% Paint
  if any(idx(:))
      canvas = reshape(canvas, prod(szIm),3);
      xy = y(idx) + szIm(1) * (x(idx)-1);
      canvas(xy, :) = repmat(c(:)', length(xy), 1); 
      canvas = reshape(canvas, [szIm, 3]);
  end
  
  return;
  
