%============================================

%============================================
clear; % Clear variables
clc; % Clear screen
%============================================

%============================================
% Get student number
n = input('Enter your student number: ');
%============================================

%============================================
% Open output file for writing
output_file = fopen('output.txt', 'w');
%============================================

%============================================
% Loop through image numbers
for i = 1:10
    % Load image
    img = imread(sprintf('%d.JPG', i));
    
    % Filter image
    if mod(n, 2) == 1
        % Use averaging filter
        filter_size = 3;
        filter = fspecial('average', filter_size);
    elseif mod(n, 2) == 0
        % Use Gaussian filter
        filter_size = 5;
        sigma = 1.5;
        filter = fspecial('gaussian', filter_size, sigma);
    end
    
    if mod(n, 3) == 0
        % Use 3x3 filter mask
        filter_size = 3;
    elseif mod(n, 4) == 0
        % Use 7x7 filter mask
        filter_size = 7;
    else
        % Use 5x5 filter mask
        filter_size = 5;
    end
    
    filtered_img = imfilter(img, filter, 'symmetric');
    
    % Determine siren light color
    red_channel = filtered_img(:, :, 1);
    green_channel = filtered_img(:, :, 2);
    blue_channel = filtered_img(:, :, 3);
    
    % Check if red or green light is on
    if max(red_channel(:)) > max(green_channel(:))
        light_color = 'red';
    else
        light_color = 'green';
    end
    
    % Write result to output file
    fprintf(output_file, '%d %s\n', i, light_color);
end
%============================================

%============================================
% Close output file
fclose(output_file);
%============================================