
function equalized = equalize(x, g1, g2, g3, g4)
    % LPF = order: 4; cutoff: 0.2 * pi
    [b_1, a_1] = butter(4, 0.2);
    % BPF1 = order : 4; cutoff: [pi/5, 2pi/5]
    [b_2, a_2] = butter(4, [0.2 0.4]);
    % BPF2 = order: 4; cutoff: [2pi/5, 2pi/3]
    [b_3, a_3] = butter(4, [0.4 2/3]);
    % HPF = order: 4; cutoff: [2pi/3, 1]
    [b_4, a_4] = butter(4, 2/3, 'high');
    
    x1 = filter(b_1, a_1, x);
    x2 = filter(b_2, a_2, x);
    x3 = filter(b_3, a_3, x);
    x4 = filter(b_4, a_4, x);
    fvtool(g1 * b_1, a_1, g2 * b_2, a_2, g3 * b_3, a_3, g4 * b_4, a_4);
    equalized = (g1 .* x1) + (g2 .* x2) + (g3 .* x3) + (g4 .* x4);
    
