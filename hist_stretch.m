function res = hist_stretch( matrix )
% This function looks at the histogram of the image in matrix
% and stretches the histogram by taking the sigmoid function of
% the intensities in the image. The sigmoid is centered at the
% maximum value of the histogram.

% let's find the highest activation in the image
[N X] = hist(matrix(:), 64);
Nmax = max(N(:));
Index = find(N==Nmax);

% We suppose a unimodal histogram, with only one peak
val = X( Index(1) );

% The highest histogram value is centered
matrix = matrix - val;

a = 3;
% We want that the values are included in the interval [-a,a]
mat_min = min( matrix(:) );
mat_max = max( matrix(:) );

max_delta = max( [abs(mat_min) abs(mat_max)] );
matrix = matrix / (max_delta / a);

% Let's now apply the sigmoid function
res = 1./(1+exp(-matrix));

end