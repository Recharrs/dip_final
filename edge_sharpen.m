function output = edge_sharpen(input, coeff);
	threshold = [0.01,0.25];
	input = im2single(input);
	edges = edgeDetect(input,threshold);
	output = input + coeff.*edges;
	output = im2single(output);
end