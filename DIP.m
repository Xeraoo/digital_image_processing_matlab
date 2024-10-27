clc;
clear;

%============================================
%Read a image to matlab
%============================================
Image = imread("test.jpg");
figure;
imshow(Image);
title('Raw Image')

%============================================
%1. Scale the image
%============================================

n = 3; %number of n 
img_scaled = imresize(Image, 1/n);

figure;
imshow(img_scaled);
title(sprintf('Image after scaling %d times', n));

% Calculate the size before and after
size_before = size(Image)
size_after = size(img_scaled)


%============================================
%2. Binary image and displey
%============================================

grey_image = rgb2gray(Image);
figure;
imshow(grey_image);
title('Grey Image')

binary_image = im2bw(grey_image, 0.3);
figure;
imshow(binary_image);
title('Image after binarization')

%============================================
%3. Filtration and histogram
%============================================

%Histogram before filtration
figure;
imhist(Image);
title('Histogram before filtration');

% filtration
w = fspecial('log');
filtered_img = imfilter(Image, w);

% histogram after filtratioon
figure;
imhist(filtered_img);
title('Histogram after filtration');

% Image before and after filtration
figure;
subplot(1,2,1);
imshow(Image);
title('Image before filtration');
subplot(1,2,2);
imshow(filtered_img);
title('Image after filtration');

%============================================
%4. Profile 
%============================================

% Wczytaj obraz
image = imread("test.jpg");

% Pobierz wymiary obrazu
[height, width, ~] = size(image);

% 1 Profil
x1 = width;
y1 = 1;
x2 = 1;
y2 = height;
profile1 = improfile(image, [x1, x2], [y1, y2]);

% Narysuj linię profilu 1
figure;
imshow(image);
hold on;
plot([x1, x2], [y1, y2], 'r', 'LineWidth', 2);

% 2 Profil
x1 = 1;
y1 = floor(height/2);
x2 = width;
y2 = floor(height/2);
profile2 = improfile(image, [x1, x2], [y1, y2]);

% Narysuj linię profilu 2
plot([x1, x2], [y1, y2], 'b', 'LineWidth', 2);
hold off;



%============================================
%5. Frame 
%============================================

Image = imread("test.jpg");

% Size of Image
[row, col, ~] = size(Image);

% Size of line
n = 3;

% Size of frame
frame_width = 10;

% Create a freame around a image
img_with_frame = uint8(zeros(row+2*frame_width, col+2*frame_width, 3));
img_with_frame(frame_width+1:row+frame_width, frame_width+1:col+frame_width, :) = Image;

% Create a line of intersection
x1 = floor(col/2) - n/2;
y1 = frame_width + 1;
x2 = x1 + n;
y2 = row + frame_width;

line_coords = [x1 y1; x2 y2];

% Displey a result
figure;
imshow(img_with_frame);
hold on;
rectangle('Position', [frame_width, frame_width, col, row], 'LineWidth', 2, 'EdgeColor', 'blue');
line(line_coords(:,1), line_coords(:,2), 'LineWidth', 2, 'Color', 'blue');
hold off;