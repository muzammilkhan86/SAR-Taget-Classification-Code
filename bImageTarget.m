function target = bImageTarget(img)
 

pic_heq=histeq(img);
h=fspecial('average',5);
pic_filt=imfilter(pic_heq,h);


bw=im2bw(pic_filt,0.8);

bw2=bwareaopen(bw,30);

se = strel('diamond',7);
target=imclose(bw2,se);

end

