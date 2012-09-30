function res = histogramstretch(im, max_value = 255)
	[n, m, t] = size(im);
	res = [];
	for layer = [1:t]
		h = histogram(im, layer, max_value+1);
		minv = 0;
		maxv = max_value;
		for a = [1:size(h,2)]
			if h(a) ~= 0
				maxv = a;
				if minv == 0
					minv = a;
				end
			end
		end
		tmp = ((im(:,:,layer) - minv).*(max_value/(maxv-minv)));
		if size(res, 1) == 0
			res = tmp;
		else
			res = cat(3, res, tmp);
		end
	end
end
