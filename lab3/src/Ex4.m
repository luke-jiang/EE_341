% Assignment 4
clear all; close all;

S = 2;
% use replication
res = scaleUp(S, 'cat_g.jpg');
% imshow(res);
% use interpolation
Img = double(imread('cat_g.jpg'));
Vq = uint8(interp2(Img, S));
imshow(res);

imwrite(res, 'cat_rep.jpg');
imwrite(Vq, 'cat_interp.jpg');

