clc;clear all;close all;

imageRows = 128;
imageCols =128;

rgbImage = imresize(imread('SOB_B_A-14-22549G-100-021(adenosis).png'), [imageRows,imageCols]);

redChannel = rgbImage(:,:,1);             %%two dimensinal matrix covert in single coloumn
greenChannel = rgbImage(:,:,2);
blueChannel= rgbImage(:,:,3);

data = double([redChannel(:),greenChannel(:),blueChannel(:)]);  %%convert the matrix form into the one coloumn vector

noOfClasses = 5;
population = 10;
generation = 100;
cp = 0.7;
mp = 0.3;

[bestFitness, chrom] = GeneticAlgo(population, generation, cp, mp, noOfClasses, data);

labelMat = Lable(chrom, data, noOfClasses);
labelMat = reshape(labelMat ,size(rgbImage,1),size(rgbImage,2));
clusteredImage = label2rgb(labelMat);       %%label matrix to rgb image and mapped

subplot(1,2,1),imshow(rgbImage), hold all, subplot(1,2,2), imshow(clusteredImage);