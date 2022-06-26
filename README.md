# SAR-Taget-Classification-Code
Ensemble Classifiers for Enhanced SAR Target Classification in Both Standard and Extended Operating Conditions - Matlab Code
MDClassification

What is this repository for?

MDClassification is a software for the classification of MSTAR dataset based on CNN, SVM, and template matching.  

How do I get set up?

Follow the instructions:

MATLAB_R2019a or above version should be installed on the system.    
Copy the repository folder, SAR inside the MDClassification folder, and paste it into the MATLAB folder in the Documents folder of C: drive or in the folder that is specified by the user during the installation of the MATLAB application.

Usage

1)	Run MATLAB application.
2)	Click on the folder icon “Browse for folder” available on the left side of the MATLAB application address bar.
3)	Open document -> MATLAB and then select SAR folder and then click on the Select Folder button.  
4)	For CNN open the CNN folder and then open Alex.m file and run the file. “matlabpath” variable can be used to change the path for training CNN. “SourcePath” variable can be used to select desired images for classification. 
5)	For SVM open SVM folder. Different features are already extracted and stored in “.mat” files.  fit.m file can be used to run the classification process and at the end of the process, it shows the accuracies of different targets.
6)	For Template Matching open the ASC folder. Run test.m file. 
7)	For results comparison all the data can be transferred to excel file.
