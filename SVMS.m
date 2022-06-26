clc
clear
close all
warning off
%load fisheriris

%load Features;
%load labels;

load tLablesS;
load slicyf;
load tslicyf;
%X=meas(:,3:4);
%Y=species;

X=slicyf(:,[1:8,10:18]);
Y=tLabelsS;

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
tX=tslicyf(:,[1:8,10:18]);
for a=1 : 274
r1(a,:)=predict(SVMModels{1},tX(a,:));
end
nnz(r1);
nnz(r1)/274


