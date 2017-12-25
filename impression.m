function output = impression(input, rad, len, iter);
  tic;
  input = double(input) / 255;
  [m, n, d] = size(input);

  % Set up x, y coordinate images, and canvas.
  [x y] = meshgrid(1:n, 1:m);
  output = zeros([m, n, 3]);
  output(:) = -1; 

  % Orientation of paint brush strokes
  theta = 2 * pi * rand(1,1);

  rad_init = rad;
  len_init = len;
  for k = 1 : iter
    rad = floor(mod(rand * 100, rad_init)) ;
    len = floor(mod(rand * 100, len_init)) ;
    
    % Randomly select stroke center
    cntr = floor(rand(2,1) .* [n; m])+1;
    cntr = min(cntr, [n; m]);
    
    % Grab colour from image at center position of the stroke.
    c = reshape(input(cntr(2), cntr(1), :),3,1);
    
    % Set vector from center to one end of the stroke.
    delta = [cos(theta); sin(theta)] * len;
    
    % Add the stroke to the canvas
    output = paintStroke(output, x, y, cntr - delta, cntr + delta, c, rad);
  end
  
  % in uint8 form
  output = uint8(output * 255);
  toc;
end