function showhistogram(im, layer = 1)
	h = histogram(im, layer);
	bar([1:size(h,2)], h);
end
