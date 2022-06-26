function img = sImageTarget(get_img)

%-------------------denosing---------------------
outim=TVL1denoise(get_img, 1, 20);
 
%-----------------Geting sparse representation----------
%figure; imshow(outim, []);

  [dictionary, sparseRep, t]=KSVD(outim,3,50,3);
  % save('outputKSVD', 'dictionary', 'sparseRep', 't');
 %imshow(rgb2gray(sparseRep));
 sp=sparseRep;
  cc=rgb2gray(sp);
  %imshow(cc);
%-------------------------Adjusting brithness------------
  J = imadjust(cc);
%-------------------------Getting Only Target------------
 
 tImg=im2bw(J,0.8);
 ttImg=bwareaopen(tImg,20);
 
 se = strel('diamond',7);
tttImg=imclose(ttImg,se);
  %montage({im,outim,sp,cc,J,tImage});
%-----------------------------Return Target ----------------
img=tttImg;

end

