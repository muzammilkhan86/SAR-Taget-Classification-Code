clc
clear
close all
warning off
%load fisheriris

load eFeatures;
load eLabels;
load te30Features

%load te30Features;
%load te45Features;
%load te30lFeatures;
%X=meas(:,3:4);
%Y=species;

X=eFeatures(:,[1:8,10:18]);
Y=eLabels;

%figure
%gscatter(X(:,1),X(:,2),Y);
%xlabel('X-axis');
%ylabel('Y-axis');
classes=unique(Y);
ms=length(classes);
SVMModels=cell(ms,1);
for j = 1:numel(classes)
    indx=strcmp(Y,classes(j)); % Create binary classes for each classifier
    SVMModels{j}=fitcsvm(X,indx,'ClassNames',[false true],'Standardize',true,...
        'KernelFunction','polynomial');
end


% e=min(X(:,1)):0.01:max(X(:,1));
% f=min(X(:,2)):0.01:max(X(:,2));
% 
% 
% [x1 x2]=meshgrid(e,f);
% 
% x=[x1(:) x2(:)];
% N=size(x,1);
% Scores=zeros(N,numel(classes));
% for j=1:numel(classes)
%     [~,score]=predict(SVMModels{j},x);
%     Scores(:,j)=score(:,2); % Second column contains positive-class scores
% end
% [~,maxScore]=max(Scores,[],2);
% figure
% gscatter(x1(:),x2(:),maxScore,'cym');
% hold on;
% gscatter(X(:,1),X(:,2),Y,'rgb','.',30);
% title('{\bf SAR Classification Regions}');
% xlabel('X Label');
% ylabel('Y Label');
% axis tight
% hold off

%--------------------------- SOC -----------------
% tX=tFeatures(:,[1:8,10:18]);
% for a=1 :196 
% r1(a,:)=predict(SVMModels{1},tX(a,:));
% end
% nnz(r1);
% nnz(r1)/196
% 
% for a=197:391
% r2(a,:)=predict(SVMModels{3},tX(a,:));
% end
% nnz(r2);
% nnz(r2)/195
% 
% for a=392:586
% r3(a,:)=predict(SVMModels{3},tX(a,:));
% end
% nnz(r3);
% nnz(r3)/195
%-------------------------------------------EOC30 Test-------------------
tX=te30Features(:,[1:8,10:18]);
for a=1 : 283
r1(a,:)=predict(SVMModels{1},tX(a,:));
end
nnz(r1);
nnz(r1)/283

for a=284:561 
r2(a,:)=predict(SVMModels{3},tX(a,:));
end
nnz(r2);
nnz(r2)/278

for a=562:837
r3(a,:)=predict(SVMModels{3},tX(a,:));
end
nnz(r3);
nnz(r3)/276
