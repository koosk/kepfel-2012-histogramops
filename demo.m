function demo
I = imread('pictures/lena_std.tif');
figure, imhist(I(:,:,1))
figure, imhist(I(:,:,2))
figure, imhist(I(:,:,3))
%szines kepre nincs kozvetlenul hisztogram. szinezessel el lehet erni.
%egy jo pelda van ezen a linken: http://www.mathworks.com/matlabcentral/fileexchange/4875-color-image-histogram

I2 = imread('pictures/Unequalized_Hawkes_Bay_NZ.jpg');
stretched = histogramstretch(I2);
figure, imshow(stretched)

%Masodik parameterben az uj kep hisztogramjaban szereplo kulonbozo ertekek
%szamat lehet megadni. Kb. egyforma sok lesz minden intenzitasbol.
j = histeq(I2(:,:,1),200);
figure, imshow(j);


%Adaptiv hisztogram kiegyenlites (CLAHE)
clahe = adapthisteq(I);
figure, imshow(clahe);

I3 = imread('pictures/moo2.GIF');
lh = local_histeq(I3, 15);
figure, imshow(lh);

%ez valami borzaszto lassu, de jobban nez ki a hisztrogramja
%lh2 = local_histeq2(I,256,3);
%figure, imshow(lh2);

clahe = adapthisteq(I3);
figure, imshow(clahe);

end
