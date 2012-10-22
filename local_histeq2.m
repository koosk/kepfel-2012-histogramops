function R = local_histeq2(I, N, mask_size)
    if nargin<3
        mask_size = 3;
    end
    n = size(I,1);
    m = size(I,2);
    R = zeros(n,m,'uint8');
    offset = uint8(floor(mask_size/2));
    for i = offset+1:n-offset
        for j = offset+1:m-offset
            tmp = histeq(I(i-offset:i+offset,j-offset:j+offset),N);
            R(i,j) = tmp(offset+1,offset+1);
        end
    end
    %TODO a kep szelein nincs futtatva!
end

