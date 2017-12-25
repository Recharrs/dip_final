function [mrkd] = markStroke(mrkd, p0, p1, rad, val)
  szIm = size(mrkd); szIm = szIm(1:2);
  
  nx = szIm(2);
  ny = szIm(1);
  p0 = p0(:);
  p1 = p1(:);
  rad = max(rad,1);
  
  %% Bounding box
  bb0 = floor(min([p0, p1],[], 2)) - rad; 
  bb1 = ceil(max([p0, p1],[], 2)) + rad;
  
  %% Check for intersection of bounding box with image.
  intersect = 1;
  if ((bb0(1) > nx) | (bb0(2) > ny) | ...
      (bb1(1) < 1) | (bb1(2) <1))
    intersect = 0;
  end
  
  if intersect
    %% Crop bounding box.
    bb0 = max([bb0, [1;1]], [], 2); 
    bb0 = min([bb0, [nx; ny]], [], 2);
    bb1 = max([bb1, [1; 1]], [], 2);
    bb1 = min([bb1, [nx; ny]], [], 2);
    
    %% Compute distance d(j,i) to segment in bounding box
    tmp = bb1 - bb0 + 1;
    szBB = [tmp(2), tmp(1)];
    q0 = p0 - bb0 + 1;
    q1 = p1 - bb0 + 1;
    t = q1 - q0;
    nrmt = norm(t);
    
    [x,y] = meshgrid(1:szBB(2), 1:szBB(1));
    d = zeros(szBB);
    d(:) = inf;
    
    if nrmt == 0
      %% Use distance to point q0
      d = sqrt( (x - q0(1)).^2 +(y - q0(2)).^2);
    else
      %% Use distance to segment q0, q1
      t = t/nrmt;
      n = [t(2); -t(1)];
      tmp = t(1) * (x - q0(1)) + t(2) * (y - q0(2));
      idx = (tmp >= 0) & (tmp <= nrmt);
      if any(idx(:))
        d(idx) = abs(n(1) * (x(idx) - q0(1)) + n(2) * (y(idx) - q0(2)));
      end
      idx = (tmp < 0);
      if any(idx(:))
        d(idx) = sqrt( (x(idx) - q0(1)).^2 +(y(idx) - q0(2)).^2);
      end 
      idx = (tmp > nrmt);
      if any(idx(:))
        d(idx) = sqrt( (x(idx) - q1(1)).^2 +(y(idx) - q1(2)).^2);
      end  
    end
    
    %% Pixels within crop box to paint have distance <= rad
    idx = (d <= rad);
    
    %% Mark the pixels
    if any(idx(:))
      xy = bb0(2)-1+y(idx) + szIm(1) * (bb0(1)+x(idx)-2);
      mrkd(xy) = val;
    end 
  end
end
