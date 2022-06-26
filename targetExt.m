function target = targetExt(img)

pic=imread(img); 
 
pic_heq=histeq(pic);

h=fspecial('average',9);
pic_filt=imfilter(pic_heq,h);

bw=im2bw(pic_filt,0.8);
target=bwareaopen(bw,20);

end

