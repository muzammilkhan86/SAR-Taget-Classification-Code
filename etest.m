clear all;
clc;



sourcePath=[pwd,'\SAR\Img\TestSet\EOC30\2S1\'];
Files = dir([sourcePath,'*.jpg']);
for i = 1:length(Files)
   if Files(i).isdir == 1       
   else

   img=imread([sourcePath,Files(i).name]);
       
testImg=bImageTarget(img);
targetAng=tAngle(testImg);

%------------------------- For BMP2 ------------------
s1sourcePath=([pwd,'\SAR\Img\TrainSet\EOC\2S1\']);
 s1Img=checkAng(s1sourcePath,targetAng);
 s1templateImg=imread(s1Img);
 s1templateImg=bImageTarget(s1templateImg);
 s1sim=corr2(testImg,s1templateImg);

%------------------------- For BTR70 ------------------
brdmsourcePath=([pwd,'\SAR\Img\TrainSet\EOC\BRDM_2\']);
brdmImg=checkAng(brdmsourcePath,targetAng);
brdmtemplateImg=imread(brdmImg);
brdmtemplateImg=bImageTarget(brdmtemplateImg);
brdmsim=corr2(testImg,brdmtemplateImg);
%------------------------- For T72 ------------------
zsusourcePath=([pwd,'\SAR\Img\TrainSet\EOC\ZSU_23_4\']);
zsuImg=checkAng(zsusourcePath,targetAng);
zsutemplateImg=imread(zsuImg);
zsutemplateImg=bImageTarget(zsutemplateImg);
zsusim=corr2(testImg,zsutemplateImg);

if s1sim>brdmsim && s1sim>zsusim
    target='2S1';
elseif brdmsim>s1sim && brdmsim>zsusim
    target='BRDM_2';
else
    target='ZSU_23_4';
end

ftarget{i,:}={target};
fname{i,:}={Files(i).name};
   end
   end
%montage({bmp2templateImg,testImg})
