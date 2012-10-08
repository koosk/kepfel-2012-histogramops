function histo = histogram(im, layer, max_value)
    if nargin<2
        layer = 1;
    end
    if nargin<3
        max_value = 256;
    end
	histo = zeros(1, max_value);
	for a = im(:,:,layer)
		histo(1,a+1) = histo(1,a+1) + 1;
	end
end
