function result = scaleDown(S, input_name)
    Img = imread(input_name);
    N = size(Img, 1);
    M = size(Img, 2);
    new_N = floor(N/S);
    new_M = floor(M/S);
    result = Img(1:new_N, 1:new_M);
    n = 0;
    start = ceil(S/2);
    for i = start:(S):new_N * (S) + 1
        n = n + 1;
        m = 0;
        for j = start:(S):new_M * (S) + 1
            m = m + 1;
            result(n, m) = Img(i, j);
        end
    end
end