%Read image
A1 = imread ('apollo.tif'); %read image to matlab
A2 = imread ('apollo.tif'); %read image to matlab
A3 = imread ('apollo.tif'); %read image to matlab
A4 = imread ('apollo.tif'); %read image to matlab
A5 = imread ('apollo.tif'); %read image to matlab
A6 = imread ('apollo.tif'); %read image to matlab
A7 = imread ('apollo.tif'); %read image to matlab
A8 = imread ('apollo.tif'); %read image to matlab
figure(1); imshow(A), title("Apollo.tif");

%Spatial filtration

%Average
w1 = fspecial ('average'); 
G1 = imfilter (A1, w1);
figure(2); imshow(G1), title("Average");

%Disk
w2 = fspecial ('disk'); 
G2 = imfilter (A2, w2);
figure(3); imshow(G2), title("Disk");

%Gaussian
w3 = fspecial ('gaussian'); 
G3 = imfilter (A3, w3);
figure(4); imshow(G3), title("Gaussian");

%Laplacian
w4 = fspecial ('laplacian'); 
G4 = imfilter (A4, w4);
figure(5); imshow(G4), title("Laplacian");

%log
w5 = fspecial ('log'); 
G5 = imfilter (A5, w5);
figure(6); imshow(G5), title("Log");

%prewitt
w6 = fspecial ('prewitt'); 
G6 = imfilter (A6, w6);
figure(7); imshow(G6), title("Prewitt");

%sobel
w7 = fspecial ('sobel'); 
G7 = imfilter (A7, w7);
figure(8); imshow(G7), title("Sobel");

%unsharp
w8 = fspecial ('unsharp'); 
G8 = imfilter (A8, w8);
figure(9); imshow(G8), title("unsharp");

%medlift
I = medfilt2 (A, [4 4]); %Median filter
figure(10); imshow (I); title('Median Filter 4x4')

%Morphological filters

BW = imbinarize(I, 0.25);
figure(11); imshow(BW); title('Black and White Image')

M = bwmorph(BW,'dilate');
figure(12); imshow(M); title('Dilate Filter')

M = bwmorph(BW,'erode');
figure(13); imshow(M); title('Erode Filter')

M = bwmorph(BW,'thin');
figure(14); imshow(M); title('Thin Filter')

M = bwmorph(BW,'fill');
figure(15); imshow(M); title('Fill Filter')
