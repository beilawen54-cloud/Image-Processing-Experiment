% Selina Fang, Belle Wen, Amy Tang - MTH261 Midterm Project

%% ------------------- Pre-Processing -------------------------

ImJPG = imread ('zhuzhuxia.jpg'); % load the jpg file in the folder
[m ,n , l ]= size(ImJPG) % check the dimensions of the obtained array

maxImJPG = max(ImJPG(:)) % finds the max and min values of colors
minImJPG = min(ImJPG(:)) 

figure
imshow (ImJPG) % display the image

%% ------------------- Manipulate The Image -------------------------
Red = ImJPG (: ,: ,1); % obtain and display the red channel
figure
imshow(Red)
title('Red Channel')

Green = ImJPG(:,:,2); % obtain and display the green channel
figure
imshow(Green)
title('Green Channel')

Blue = ImJPG(:,:,3); % obtain and display the blue channel
figure
imshow(Blue)
title('Blue Channel')

% -------------------------------------------------------
% Create gray matrix to convert the image to gray scale
GrayMatrix = [1/3 1/3 1/3;1/3 1/3 1/3;1/3 1/3 1/3];

for i = 1:m
    for j = 1:n
        PixelColor = reshape(double(ImJPG(i,j,:)),3,1);
        ImJPG_Gray(i,j,:) = uint8(GrayMatrix * PixelColor);
    end
end

figure
imshow (ImJPG_Gray)
title('Gray Scale')

% -------------------------------------------------------
% Reproduce the code above with Sepia matrix
SepiaMatrix =[0.393 ,0.769 ,0.189;0.349 ,0.686 ,0.168;0.272 ,0.534 ,0.131];

for i =1: m
    for j =1: n
    PixelColor = reshape (double(ImJPG (i ,j ,:) ),3,1) ;
    ImJPG_Sepia (i ,j ,:) = uint8 ( SepiaMatrix * PixelColor );
    end
end

figure
imshow (ImJPG_Sepia)
title('Sepia Filter')

% -------------------------------------------------------
% Reproduce the code above with red Filter matrix
FilterMatrix =[1,0,0;0,0,0;0,0,0];

for i =1: m
    for j =1: n
    PixelColor = reshape (double(ImJPG (i ,j ,:) ),3,1) ;
    ImJPG_Filter (i ,j ,:) = uint8 ( FilterMatrix  * PixelColor );
    end
end

figure
imshow (ImJPG_Filter)
title('Red Filter')

% -------------------------------------------------------
% Reproduce the code above with matrix exchanging red and blue channel
DiaMatrix=[0,0,1;0,1,0;1,0,0];

for i =1: m
    for j =1: n
    PixelColor = reshape (double(ImJPG (i ,j ,:) ),3,1) ;
    ImJPG_Dia (i ,j ,:) = uint8 ( DiaMatrix  * PixelColor );
    end
end

figure
imshow (ImJPG_Dia)
title('Red-Blue Filter')

% -------------------------------------------------------
% hue rotation
A = [0.213, 0.715, 0.072;0.213, 0.715, 0.072;0.213, 0.715 ,0.072];
B = [0.787, -0.715, -0.072;-0.213, 0.285, -0.072;-0.213, -0.715, 0.928];
C = [0.213, -0.715, 0.928;0.143 ,0.140, -0.283;-0.787, 0.715 ,0.072];

% Experimenting with degree of pi/4
theta1 = pi/4;   
HueMatrix = A + cos(theta1)*B + sin(theta1)*C;

for i = 1:m
    for j = 1:n
        PixelColor = reshape(double(ImJPG(i, j, :)), 3, 1);
        ImJPG_Hue1(i, j, :) = uint8(HueMatrix * PixelColor);
    end
end

figure
imshow (ImJPG_Hue1)
title('Hue rotation with pi/4')

% Experimenting with degree of pi
theta2 = pi;
HueMatrix = A + cos(theta2)*B + sin(theta2)*C;

for i = 1:m
    for j = 1:n
        PixelColor = reshape(double(ImJPG(i, j, :)), 3, 1);
        ImJPG_Hue2(i, j, :) = uint8(HueMatrix * PixelColor);
    end
end

figure
imshow (ImJPG_Hue2)
title('Hue rotation with pi')

% -------------------------------------------------------
% Green Filter
ColorMatrix =[0,0,0;0,1,0;0,0,0];

for i =1: m
    for j =1: n
    PixelColor = reshape (double(ImJPG (i ,j ,:) ),3,1) ;
    ImJPG_Color1 (i ,j ,:) = uint8 ( ColorMatrix  * PixelColor );
    end
end

figure
imshow (ImJPG_Color1)
title('Green Filter')

% -------------------------------------------------------
% Blue Filter
ColorMatrix =[0,0,0;0,0,0;0,0,1];

for i =1: m
    for j =1: n
    PixelColor = reshape (double(ImJPG (i ,j ,:) ),3,1) ;
    ImJPG_Color2 (i ,j ,:) = uint8 ( ColorMatrix  * PixelColor );
    end
end

figure
imshow (ImJPG_Color2)
title('Blue Filter')

% -------------------------------------------------------
% Running the following commands

% crops the image by selecting only a portion of the matrix
new1 =ImJPG(100: m-100 , 100: n-70);
figure
imshow (new1)
title('Crop Image')

% flips the image vertically
new2= flip(ImJPG)
figure
imshow (new2)
title('Flip Image')

% rotates the image by 90 degrees counterclockwise
new3=rot90(ImJPG)
figure
imshow (new3)
title('Rotate Image')

% inverts the colors of the image
new4=255-ImJPG
figure
imshow (new4)
title('Inverting Color')

% reducing the intensity of the colors and making the image darker
new5=ImJPG-50
figure
imshow (new5)
title('Reducing Intensity')

% increasing brightness and making the colors appear stronger
new6=uint8 (1.25* ImJPG ) % change the number to see what happens
figure
imshow (new6)
title('Increasing Brightness')

% increasing brightness and making the colors appear stronger
new7=uint8 (2* ImJPG ) % change the number to see what happens
figure
imshow (new7)
title('Increasing Brightness with greater multiple')

% convert the RGB image to a grayscale image
new8 = rgb2gray(ImJPG); 
figure
imshow(new8)
title('Grey Scale')

% transpose the image matrix
new9 = new8'; % transpose the grayscale image
figure
imshow(new9)

% create a horizontal mirror of the image
new10 = flip(new8')'; 
figure
imshow(new10)
title('Flip horizontally')

% -------------------------------------------------------
% Delete one of the colors (RGB) in the image
DeleteBlue = [1 ,0 ,0;0 ,1 ,0;0 ,0 ,0];
for i = 1:m
    for j = 1:n
        PixelColor = reshape(double(ImJPG(i, j, :)), 3, 1);
        ImJPG_DeleteBlue(i, j, :) = uint8(DeleteBlue * PixelColor);
    end
end

figure
imshow (ImJPG_DeleteBlue)
title('Delete Blue')

% -------------------------------------------------------
% Exercise 1
Filter2 = [0.7 ,0.15 ,0.15;0.15 ,0.7 ,0.15;0.15 ,0.15 ,0.7];
for i = 1:m
    for j = 1:n
        PixelColor = reshape(double(ImJPG_Dia(i, j, :)), 3, 1);
        ImJPG_FilterAfterFilter(i, j, :) = uint8(Filter2 * PixelColor);
    end
end

figure
imshow (ImJPG_FilterAfterFilter)
title('Filter After Filter')

% using inv()
InverseFilter = inv(Filter2);
for i = 1:m
    for j = 1:n
        PixelColor = reshape(double(ImJPG_FilterAfterFilter(i,j,:)),3,1);
        ImJPG_Recovered(i,j,:) = uint8(InverseFilter * PixelColor);
    end
end

figure
imshow(ImJPG_Recovered)
title('Recovered Image')

% Exercise 2
gray = rgb2gray(ImJPG);
lum = double(gray)/255;
lum = round(lum*(7-1))/(7-1); 

M1 = [208/255 0 0;0 231/255 0;0 0 32/255];

R1 = uint8(lum .* M1(1,1) .* 255);
G1 = uint8(lum .* M1(2,2) .* 255);
B1 = uint8(lum .* M1(3,3) .* 255);
Art1_TR = cat(3,R1,G1,B1);

M2 = [1.0 0 0;0 0.2 0;0 0 0.8];

R2 = uint8(lum .* M2(1,1) .* 255);
G2 = uint8(lum .* M2(2,2) .* 255);
B2 = uint8(lum .* M2(3,3) .* 255);
Art1_BL = cat(3,R2,G2,B2);

M3 = [0.1 0 0;0 0.9 0;0 0 1.0];

R3 = uint8(lum .* M3(1,1) .* 255);
G3 = uint8(lum .* M3(2,2) .* 255);
B3 = uint8(lum .* M3(3,3) .* 255);
Art1_BR = cat(3,R3,G3,B3);
Art1_BR = fliplr(Art1_BR);

Warhol1 = [ImJPG, Art1_TR;Art1_BL, Art1_BR];

figure
imshow(Warhol1)

% -------------------------------------------------------
% Free - Edge Only
% -------------------------------------------------------

grayDouble = double(new8);
[rows, cols] = size(grayDouble);
manualEdges = zeros(rows, cols);

Gx = [-1 0 1; -2 0 2; -1 0 1]; % Detects horizontal changes
Gy = [-1 -2 -1; 0 0 0; 1 2 1]; % Detects vertical changes

for i = 2:rows-1
    for j = 2:cols-1
        % Get the 3x3 neighborhood of the current pixel
        neighbor = grayDouble(i-1:i+1, j-1:j+1);
        
        % Calculate the gradient in X and Y directions
        valX = sum(sum(Gx .* neighbor));
        valY = sum(sum(Gy .* neighbor));
        
        % Calculate total magnitude
        manualEdges(i,j) = sqrt(valX^2 + valY^2);
    end
end

finalEdgeMap = manualEdges > 50; 

figure
imshow(finalEdgeMap)
title('Blackboard Sketch Style')

% -------------------------------------------------------
% Inverse Edge Version
% -------------------------------------------------------

sketchVersion = ~finalEdgeMap;

figure
imshow(sketchVersion)
title('Inverse Sketch Style')