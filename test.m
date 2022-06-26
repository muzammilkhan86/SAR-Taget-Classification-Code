%trainSVM();
%testSVM();

%load Feature
 %i=467;
%for a=1:50
%    T72F(a,:)=Feature(i,:);
%   i=i+1;
%end

for a=1 :272
eLabels(a,:)={'2s1'};
end
for a=273 :553
eLabels(a,:)={'BRDM_2'};
end
for a=554 :818
eLabels(a,:)={'ZSU_23_4'};
end
