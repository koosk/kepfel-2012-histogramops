function R = local_histeq(I, mask_size)
%http://angeljohnsy.blogspot.hu/2011/06/local-histogram-equalization.html
    R = I;
    midp_idx = round(mask_size^2/2);

    inc = 0;
    for i = 1:mask_size
        for j = 1:mask_size
            inc = inc + 1;
            if (inc == midp_idx)
                padM = i-1;
                padN = j-1;
                break;
            end
        end
    end
    P = padarray(I, [padM, padN]);


    for i = 1:size(P,1)-((padM*2)+1)
        for j = 1:size(P,2)-((padN*2)+1)
            cdf = zeros(256,1);
            inc = 1;
            for x = 1:mask_size
                for y = 1:mask_size
                    if (inc == midp_idx)
                        ele = P(i+x-1, j+y-1) + 1;
                    end
                    pos = P(i+x-1, j+y-1) + 1;
                    cdf(pos) = cdf(pos) + 1;
                    inc = inc + 1;
                end
            end

            %cdf szamitas
            for l = 2:256
                cdf(l) = cdf(l) + cdf(l-1);
            end
            R(i,j) = round(cdf(ele)/mask_size^2*255);
         end
    end
end

