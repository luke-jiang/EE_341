function result = scaleDown2(S, input_name)
    Img = double(imread(input_name));
    N = size(Img, 1);
    M = size(Img, 2);
    new_N = floor(N/S);
    new_M = floor(M/S);
    result = Img(1:new_N, 1:new_M);

    for i = 1:new_N * S
        for j = 1:new_M * S
                index1 = help(i, S);
                index2 = help(j, S);
                result(index1, index2) = result(index1, index2) + Img(i, j);
        end
    end
    result = uint8(result ./ S^2);
    
    function x = help(index, S)
        x = 1 + floor((index - 1) / S);
    end

end
