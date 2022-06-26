
clear
clc
sourcePath=([pwd,'\SAR\Img\TrainSet\EOC\ZSU_23_4\']);
Files = dir([sourcePath,'*.jpg']);
for i = 1:length(Files)
    
   if Files(i).isdir == 1   
     
   else
    img=imread([sourcePath,Files(i).name]);
    timg=bImageTarget(img);
    angles(i,:)=tAngle(timg);
    fileName(i,:)=Files(i).name;
   end
   
end