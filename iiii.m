clc
clear all
close all
 
imageinput;
imagefiles = dir('new/*.jpg');
nfiles=length(imagefiles);
path = cd;

for i=1:nfiles
    currentfilename = imagefiles(i).name;
    gg = strcat('\new\',currentfilename);
    
ffname=strcat(path,gg);
imshow(ffname);

animaldetect;


end


movefile new/*.jpg input;