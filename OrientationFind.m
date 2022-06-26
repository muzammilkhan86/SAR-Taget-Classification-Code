sourcePath=[pwd,'\SAR\Img\TrainSet\SOC\T72\'];
Files = dir([sourcePath,'*.tif']);
for i = 1:length(Files)
   if Files(i).isdir == 1       
   else

   img=imread([sourcePath,Files(i).name]);

testImg=bImageTarget(img);

r(i,:)=regionprops(testImg,'Orientation');
arr(i,:)={Files(i).name};
targetAng=tAngle(testImg);
   end
    
   
end