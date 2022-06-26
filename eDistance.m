I = imread('bmp2.jpg'); 
%I = rgb2gray(I);
h = imhist(I); % this will have default bins 256
% now second image 
J = imread('bmp2.jpg'); 
%J = rgb2gray(J);
h1 = imhist(J); % this will have default bins 256 
E_distance = sqrt(sum((h-h1).^2))

bb=corr2(h,h1)