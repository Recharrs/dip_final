function output = impression(input, rad, len, iter);

  input = double(input) / 255;

  szIm = size(input);
  szIm = szIm(1:2);

  % Set up x, y coordinate images, and canvas.
  [x y] = meshgrid(1:szIm(2), 1:szIm(1));
  canvas = zeros([szIm, 3]);
  canvas(:) = -1; %% Initially mark the canvas with a value out of range.
  %% Negative values will be used to denote pixels which are unpainted.

  % Random number seed
  rand('seed', 29645);

  % Orientation of paint brush strokes
  theta = 2 * pi * rand(1,1);

  tic;
  for k = 1 : iter
    % Randomly select stroke center
    cntr = floor(rand(2,1) .* [szIm(2); szIm(1)])+1;
    cntr = min(cntr, [szIm(2); szIm(1)]);
    
    % Grab colour from image at center position of the stroke.
    c = reshape(input(cntr(2), cntr(1), :),3,1);
    
    % Set vector from center to one end of the stroke.
    delta = [cos(theta); sin(theta)] * len;
    
    % Add the stroke to the canvas
    canvas = paintStroke(canvas, x, y, cntr - delta, cntr + delta, c, rad);
  end

  output = canvas;
  output = uint8(canvas * 255);

end