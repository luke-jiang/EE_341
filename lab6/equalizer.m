function result = equalizer(G1, G2, G3, G4)
    impulse = [1 zeros(1, 49)];
    
    [b1, a1] = butter(4, 1/5, 'low');
    h1 = filter(b1, a1, impulse);

    [b2, a2] = butter(4, [1/5 2/5], 'bandpass');
    h2 = filter(b2, a2, impulse);

    [b3, a3] = butter(4, [2/5 2/3], 'bandpass');
    h3 = filter(b3, a3, impulse);

    [b4, a4] = butter(4, 2/3, 'high');
    h4 = filter(b4, a4, impulse);

    result = G1 * h1 + G2 * h2 + G3 * h3 + G4 * h4;
end