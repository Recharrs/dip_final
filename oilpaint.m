function output = oilpaint(input, m, n);
	%Define the matrix size of  your convience.	
	input = im2uint8(input);
	output = uint8(zeros([size(input,1)-m,size(input,2)-n,3]));
	%Calculate the histogram for each RGB value.
	for k = 1:3
		for i = 1:size(input,1)-m
			for j = 1:size(input,2)-n
				mymask = input(i:i+m-1,j:j+n-1,k);
				h = zeros(1,256);
				for x = 1:(m*n)
					h(mymask(x)+1) = h(mymask(x)+1)+1;
				end
				%Maximum occurring value and the position is obtained
				[maxvalue,pos] = max(h);
				output(i,j,k) = pos-1;
			end
		end
	end
end