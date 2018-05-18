% assignment 3
clear all; close all;


% cat_g = rgb2gray(imread('cat.jpg'));
% imwrite(cat_g, 'cat_g.jpg');

S = 3;
Img1 = scaleDown(S, 'cat_g.jpg');
Img2 = scaleDown2(S, 'cat_g.jpg');
% imshow(Img1);
% imshow(Img2);

imwrite(Img1, 'cat_scaleDown1.jpg');
imwrite(Img2, 'cat_scaleDown2.jpg');



