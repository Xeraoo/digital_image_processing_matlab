%============================================
clear; % Clear variables
clc; % Clear screen
%============================================

%============================================
% Get student number
n = input('Enter your student number: ');
%============================================

%============================================
% Loop through image numbers
for i = 1:10
    % Load image
    img = imread(sprintf('%d.JPG', i));
    
    % Calculate average brightness at specified pixel
    row = 10 * n;
    column = 10 * n;
    green_channel = img(row, column, 2);
    avg_brightness = mean(green_channel(:));
    
    % Print result
    fprintf('Average brightness at row %d, column %d in image %d: %f\n', row, column, i, avg_brightness);
end
%============================================