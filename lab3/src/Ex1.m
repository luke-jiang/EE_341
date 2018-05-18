Egg = imread('egg_g.jpg');
Wanda = imread('wanda_g.jpg');

Hs = (1/9) * [1 1 1; 1 1 1; 1 1 1];
% vertical edge detection conv kernel
H1 = [-1 0 1; -2 0 2; -1 0 1]; 
% horizontal edge detection conv kernel
H2 = [1 2 1; 0 0 0; -1 -2 -1]; 

Egg_blur = conv2(double(Egg), Hs, 'same');
imwrite(uint8(Egg_blur), 'egg_blur.jpg');

Egg_M1 = conv2(double(Egg), H1, 'same');
Egg_M2 = conv2(double(Egg), H2, 'same');
size(Egg_M1)
size(Egg_M2)
Egg_edge = uint8((Egg_M1 .^2 + Egg_M2 .^2) .^ 0.5);
imwrite(Egg_edge, 'Egg_edge.jpg');

% imshow(uint8(Egg));  

Egg_edge_reverse = zeros(501, 401);
for i = 1:501
    for j = 1:401
        Egg_edge_reverse(i,j) = 255 - Egg_edge(i,j);
    end
end
imshow(uint8(Egg_edge_reverse));
        