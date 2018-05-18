% assignment 5
Cat = imread('cat_g.jpg');
N_CAT = size(Cat, 1);
M_CAT = size(Cat, 2);

Hs = (1/9) * [1 1 1; 1 1 1; 1 1 1];
% vertical edge detection conv kernel
H1 = [-1 0 1; -2 0 2; -1 0 1]; 
% horizontal edge detection conv kernel
H2 = [1 2 1; 0 0 0; -1 -2 -1]; 

Cat_blur = conv2(double(Cat), Hs, 'same');
imwrite(uint8(Cat_blur), 'cat_blur.jpg');

Cat_M1 = conv2(double(Cat), H1, 'same');
Cat_M2 = conv2(double(Cat), H2, 'same');
% size(Egg_M1)
% size(Egg_M2)
Cat_edge = uint8((Cat_M1 .^2 + Cat_M2 .^2) .^ 0.5);
imwrite(Cat_edge, 'Cat_edge.jpg');
Cat_scaleDown2 = imread('cat_scaleDown2.jpg');
Cat_s = zeros(N_CAT, size(Cat_scaleDown2, 2));
for i = 1:size(Cat_scaleDown2, 1)
    for j = 1:size(Cat_scaleDown2, 2)
        Cat_s(i,j) = Cat_scaleDown2(i,j);
    end
end

Cat_concat = [Cat_s, Cat_blur, Cat_edge];
imwrite(Cat_concat, 'cat_concat.jpg');

