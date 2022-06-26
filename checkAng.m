function str = checkAng(folderAdd,targetAng)
ang=targetAng;

sourcePath=folderAdd;
Files = dir([sourcePath,'*.jpg']);
for i = 1:length(Files)
   if Files(i).isdir == 1       
   else
       img=imread([sourcePath,Files(i).name]);
       timg=bImageTarget(img);
       a=tAngle(timg);
       diff(i)=abs(ang-a);
       %disp(strcat(num2str(a),"  -  ",num2str(ang)," =  ",num2str(diff)));
   end 
end
mAng=min(diff);  % match angle
%disp(mAng);
result = find(diff==mAng);
fname=Files(result).name; 
%str=append(sourcePath,num2str(result),'.jpg');
str=append(sourcePath,num2str(fname));
end

