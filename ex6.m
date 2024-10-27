%I installed the image package from the website https://gnu-octave.github.io/packages/image/
%pkg install image-2.14.0.tar.gz

pkg load image;

%============================================
%Ex 6 - Octave (ex2 - Matlab)
%============================================

%1.
clf;
clear;

%2.
I = imread('test_2.jpg');
figure(1); imshow(I); title("test.png");

%3.
I_Gray = rgb2gray (I);
figure(2); imshow(I_Gray); title('rgb2gray');

%4.
p = interp2 (I_Gray, [48, 534], [45, 327]);

%5.

hold on
figure (3); imshow (I_Gray);
plot([48, 534], [45, 327], '-g')
hold off

%6.
figure (4); plot(p); title('plot p');

%7.
mean(mean(p))

%============================================
%Ex 6 - Octave (ex3 - Matlab)
%============================================

% 1.
I = imread('apollo.png');
figure(5); imshow(I)

% 2.
I = medfilt2 (I, [7,7]) ;
figure(6),imshow (I); title ('Median Filter');

% 3.
F_gauss = imfilter(I, fspecial ('gaussian'));
figure(7); imshow(I), title("Median filter + Gauss")

% 4.
I = wiener2 (I, [9 9]);
figure(8); imshow(I), title("Median filter + Gauss + Wiener")

% 5.
F_unsharp = fspecial ('unsharp', 0.2);
I = imfilter (I, F_unsharp);
figure(9); imshow(I), title("Median Filter + Gauss +Wiener + Unsharp")

% 6.
F_Laplace = fspecial ('Laplacian');
I = imfilter (I, F_Laplace);
figure(10); imshow(I), title("Median Filter + Gauss +Wiener + Unsharp + Laplace")
