function octave = makeOctave(length_, Fs, indices)
    frequencies = [0 2 3 5 7 8 10 12];
    t = 0:(1/Fs):(length_-1/Fs);
    t_pause = 0:(1/Fs):(0.5-1/Fs);
    pause = 0 * t_pause;
    
    octave = zeros(8, length(t) + length(pause));     
    for i = indices
         octave(i,:) = note(frequencies(i), length_, Fs);
    end
end
