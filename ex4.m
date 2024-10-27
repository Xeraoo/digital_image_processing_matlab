clc;
clear;

%n = 8 
n=8;

%1.
Image= imread('test_4.jpg');

%2.
size(Image)
[nrow, ncol] = size(Image)
figure (1); imshow (Image);

%3.
Image_Antialiasing = imresize(Image,[408 408], "Antialiasing",true);
figure (2); imshow (Image_Antialiasing);

imwrite(Image_Antialiasing,'Image_Antialiasing.jpg');

%4.
Image_crop = imrotate(Image, 38,"crop");
figure (3); imshow (Image_crop);

%5.
Image_nearest = imrotate(Image,38,'nearest');
figure (4); imshow (Image_nearest); title('Nearest interpolation')

Image_bilinear = imrotate(Image,38,'bilinear');
figure (6); imshow (Image_bilinear); title('Biliear interpolation')

Image_bicubic = imrotate(Image,38,'bicubic');
figure (7); imshow (Image_bicubic); title('Bicubic interpolation')

%6.

%Best -> bicubic interpolation method
%Worst -> nearest-neighbor interpolation method

%7.
Image_Antialiasing = improfile (Image_nearest, [1, 576], [1, 576]);
plot (Image_Antialiasing, '- g'); hold on

Image_crop = improfile (Image_bilinear, [1, 576], [1, 576]);
plot (Image_crop, '- r'); hold on

Image_profile_bicubic = improfile (Image_bicubic, [1, 576], [1, 576]);
plot (Image_profile_bicubic, '- b'); hold on


%8.

I6_cat = cat(2,Image_Antialiasing,Image_crop,Image_profile_bicubic);
figure (8); imshow (I6_cat); title('I6')
size2 = size(I6_cat)

%9.
SE = translate(strel(1), [108 108]);
Image_imdilate = imdilate(Image,SE);
figure (8); imshow (Image_imdilate);


%11.
Image_fliplr = fliplr(Image);
Image_fliplr = flipud(Image);
figure (9); imshow (Image_fliplr);

%12.

A = zeros(nrow, n);
B = zeros(n, ncol+2*n);
bind = [B; A Image A; B];
imshow(bind);

%13.
File_Maj = fopen ('Maj_4.txt', 'w');

fprintf(File_Maj, 'n number: 8\n calculated size: %dx %d \n',  size2(1), size2(2));
fclose (File_Maj);


