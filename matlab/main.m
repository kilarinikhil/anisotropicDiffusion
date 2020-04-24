img = imread('images/image2.jpg');
% enable this for image2 only to convert from rgb to grayscale
img = rgb2gray(img);
% normalize the values
img = img/max(img(:));
img = double(img);

numIter = 20;% number of iterations
lambda = 0.21; %should be in the range of 0 to 0.25
k = 0.2;% finetune this to control diffusion rate
outImg = anisoDiff(img,numIter,lambda,k);
imshow(outImg,[]);