function result = scaleUp(S, input_name)
    Img = double(imread(input_name));
    N = size(Img, 1);
    M = size(Img, 2);
    new_N = S * N;
    new_M = S * M;

    result = zeros(new_N, new_M);
    for i = 1:new_N
        for j = 1:new_M
            index1 = helper(S, i);
            index2 = helper(S, j);
            result(i,j) = Img(index1, index2);
        end
    end
    result = uint8(result);

    function x = helper(S, index)
        x = 1 + floor((index - 1) / S);
    end
end