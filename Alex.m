clc
clear all
close all
matlabpath='C:\Users\NoorRahman\Documents\MATLAB\SAR\Img\TrainSet\'
data=fullfile(matlabpath,'EOC');
train=imageDatastore(data,'IncludeSubfolders',true,'LabelSource','foldernames');
count=train.countEachLabel;

%load network
net=alexnet;
layers=[imageInputLayer([128 128 1])
    net(1:end-3)
 fullyConnectedLayer(3)
 softmaxLayer 
 classificationLayer()
 ]

% Training
opt=trainingOptions('sgdm','Maxepoch',20,'InitialLearnRate',0.0001)
training=trainNetwork(train,layers,opt);

sourcePath=('C:\Users\NoorRahman\Documents\MATLAB\SAR\Img\TestSet\EOC30Less\ZSU_23_4\');
Files = dir([sourcePath,'*.jpg']);
for i = 1:length(Files)
a=imread([sourcePath,Files(i).name]);
out=classify(training,a);
arr(i,:)=out;
fname(i,:)=Files(i).name;
%figure,imshow(a);
%title(string(out));
end

