%%%read the original image
grayImage=imread('HB.jpg');
I=cat(3, grayImage, grayImage, grayImage); 
imshow(I);
pause
%%% read the background
background = imopen(I,strel('disk',15));
figure,imshow(background);
title('background')
pause
%% subtract the original form the background
I2 = I - background;
figure, imshow(I2),title('substracted image')
pause
%% increase the image intensity
I3=rgb2gray(I2);
I3 = imadjust(I3);
figure, imshow(I3);
title('adjustedimage')
pause
%% treshold the image
level = graythresh(I3);
bw = im2bw(I3,level);
bw = bwareaopen(bw, 50);
figure, imshow(bw),title('treshold image')
pause
% Labeled the component(s), and plot the centroid on the original image
% Canny
S5 = edge(I3, 'canny');
imshow(S5);title('Canny Edge Dectection [auto]');
size(S5)
pause
% Find the white color
S6 = S5>180;
imshow(S5);
pause
%%%%Morphology technique, image erosion to erase the unwanted components
se = strel('line',10,90);
I4 = imerode(I3,se);
se = strel('line',10,0);
I4 = imerode(I4,se);
imshow(I4),title('eroded image [auto]')
size(I4)
pause
war=watershed(I4)
imshow(war)
pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%I4 = im2bw(I4);
%%%%%%%%%%%%%Features Detection
corners = detectHarrisFeatures(I4);
[features, valid_corners] = extractFeatures(I4, corners);
figure; imshow(I4); hold on
 plot(valid_corners);
 features
