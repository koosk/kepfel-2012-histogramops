function showhistogram(im, layer)
    if nargin<2
        layer = 1;
    end
	h = histogram(im, layer);
	bar([1:size(h,2)], h);
end
