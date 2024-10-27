clc; %clear command window
clear; %removes variables

%Matrices - defining 
K = [4 0 0 1; 2 1 7 -1; 0 -1 1 2];

%Create a Matrix 0 - 1 - diagonal
M = zeros (3,6)
M = ones (3,4)
M = eye (3,3)

%Loading an image and reading information about a graphic file. 

imfinfo ('test_2.jpg') %read information about a graphic file

I = imread ('test_2.jpg'); %read image to matlab

figure (1); imshow (I); %View(image)

%Image decomposition into color components 

R = I (:,:, 1); 
G = I (:,:, 2); 
B = I (:,:, 3); 

figure (1); imshow (I); %View(image)


%Change into  TCC

I (:,:, 1) = R; 
I (:,:, 2) = G; 
I (:,:, 3) = B; 

%figure (2); imshow (I); %View(image)

%Change into  FCC

I (:,:, 1) = B; 
I (:,:, 2) = G; 
I (:,:, 3) = R; 

%figure (3); imshow (I); %View(image)

%Change of color components  BLUE

I (:,:, 1) = B; 
I (:,:, 2) = G; 
I (:,:, 3) = R; %Change to false color composite 

figure (4); imshow (I); %View(image)

%Change into green
I (:,:, 1) = B; 
I (:,:, 2) = R; 
I (:,:, 3) = G; 

figure (5); imshow (I); %View(image)

%Subset the image 
Fragment = I (250: 300,375: 425, :); 
figure (6); imshow (Fragment); %View(image)

%Checking the dimension of the image array
[WKC] = size (I); 

%Where 
%W - number of rows,  K - number of columns,  
%C - number of channels.

%Convert image types 
Fragment1 = rgb2gray (I) ; %- conversion of an RGB image into a grayscale image, 
figure (7); imshow (Fragment1); %View(image)

% conversion of a grayscale image into a binary image, threshold range 
 
%Fragment2 = im2bw(Fragment1, threshold);
%figure (8); imshow (Fragment2); %View(image)

% matrix to image conversion. 

%Fragment3 = mat2gray (I)
%figure (9); imshow (Fragment3); %View(image)

%Image arithmetic 

%imadd (I, J)  %- adding images, 
%imsubtract (I, J) %- image subtraction, 
%imcomplement (I) %- compute image complement.

%Basic arithmetic and statistical functions 
mean (R) 
mean (mean (R)) 

%Pixel brightness conversion using imadjust function 

%imhist (I)
%J = imadjust (I, [low_in, high_in], [low_out, high_out], gamma)

%[low_in, high_in] - vector defining the input range of the brightness levels, 
%[low_out, high_out] - vector defining the output range of brightness levels, 
%gamma - exponential "gamma" correction factors 

%Brightness profile 

%p = improfile (I, [XA, XB], [YA, YB]) - a function that determines the brightness levels along defined 
%line.  
%The function returns the vector P storing the brightness of successive pixels along the profile. 
%The plot function is used to display the matrix content in the form of a graph e.g.: 
%plot (p, '- g') 
%The '-g' means that the profile will be drawn as a green line 


