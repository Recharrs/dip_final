function output = final()
	content = imread('content.jpg');
	style = imread('style.jpg');
	style2 = imread('style2.jpg');
	% 1. segmentation
	% [back, seg] = segmentation(content);
	% imwrite(seg, 'segmentation.png');
	% imwrite(back, 'background.png');

	% 2. histogram matching
	restyle = color_hist(content, style);
	% restyle2 = color_hist(content, style2);
	% imwrite(restyle, 'histogram_matching.png');

	% 3. filters
	% sharpen
	sp = edge_sharpen(restyle, 0.1);
	% sp1 = edge_sharpen(restyle, 1);
	% sp2 = edge_sharpen(restyle2, 0.1);
	% imwrite(sp, 'sharpen.png');
	% imwrite(sp1, 'sharpen1.png');
	% imwrite(sp2, 'sharpen2.png');

	% impression
	% blocks = img2blocks(style, 100);
	% blocks2 = img2blocks(style2, 100);
	% newstyle = texture_transfer(double(blocks{1}), double(content), 10, 3, 0.1);
	% imwrite(newstyle, 'texture.png');
	% newstyle2 = texture_transfer(double(blocks2{1}), double(content), 10, 3, 0.1);
	% restyle = im2uint8(restyle);
	% restyle2 = im2uint8(restyle2);
	% newstyle = im2uint8(newstyle);
	% newstyle2 = im2uint8(newstyle2);

	% new = round(0.6 * restyle) + round(0.4 * newstyle);
	% imwrite(new, 'new_texture.png');
	% new2 = round(0.6 * restyle2) + round(0.4 * newstyle2);
	% result = impression(new, 4, 3, 400000);
	% imonly = impression(restyle, 4, 3, 400000);
	% result2 = impression(new2, 4, 3, 400000);
	% imwrite(result, 'impression_new.png');
	% imwrite(imonly, 'imonly.png');
	% imwrite(result2, 'impression2.png');

	% oilpaint
	output = oilpaint(sp, 8, 12);
	% op1 = oilpaint(sp, 4, 4);
	% op2 = oilpaint(sp2, 8, 12);
	imwrite(output, 'oilpaint.png');
	% imwrite(op1, 'oilpaint1.png');
	% imwrite(op2, 'oilpaint2.png');
end