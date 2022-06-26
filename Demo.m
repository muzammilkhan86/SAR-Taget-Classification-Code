% demo with AVIRIS modesto scene scaled down. the image has been scaled down to reduce storage space in this repository demo.
%load('modesto_resize.mat');
im= imread('H8.JPG');
%% Pre-process as needed like band selection and de-noising algorithms

%% Runing ILS-DLA for 50 iterations at 10 atoms and maximum of 3 atoms per pixel...
disp('Running ILS-DLA...');
%[dictionary, sparseRep, t] = ILSDLA(reflectance, 10, 50, 3);
%save('/results/outputILSDLA', 'dictionary', 'sparseRep', 't');
[dictionary, sparseRep, t] = ILSDLA(a, 10, 100, 3);
save('outputILSDLA', 'dictionary', 'sparseRep', 't');

%% Runing the K-SVD algorithm for 50 iterations at 10 atoms and maximum of 3 atoms per pixel...
disp('Running K-SVD...');
%[dictionary, sparseRep, t] = KSVD(reflectance, 10, 50, 3);
%save('/results/outputKSVD', 'dictionary', 'sparseRep', 't');

[dictionary, sparseRep, t] = KSVD(a, 3, 100, 3);
save('outputKSVD', 'dictionary', 'sparseRep', 't');