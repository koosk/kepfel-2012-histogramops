function histo = histogram(im, layer = 1, max_value = 256)
	histo = zeros(1, max_value);
	for a = im(:,:,layer)
		histo(1,a+1)++;
	end
end
