Ex1;
N = 501;
M = 401;
Egg_s1 = Egg;
Egg_s2 = Egg;
Egg_s3 = Egg;

% flip image upside-down
for n = 1:N
    for m = 1:M
        Egg_s1(N - n + 1,m) = Egg(n, m);
    end
end
% imshow(Egg_s1);

% mirror the image
for n = 1:N
    for m = 1:M
        Egg_s2(n, M - m + 1) = Egg(n, m);
    end
end
% imshow(Egg_s2);

% flip and mirror
for n = 1:N
    for m = 1:M
        Egg_s3(N - n + 1, M - m + 1) = Egg(n, m);
    end
end
imshow(Egg_s3);