Ex1;

% Part 2: quality improvement
[t_a, ADSR_a] = ADSR(2, Fs, 1/8, 1/4, 1/2, 1.5, 1);
figure;
plot(t_a, ADSR_a);
    xlabel('t');
    ylabel('volume');
    title('ADSR window function');
overlap = 200;

% implementing two octaves (whole and half)
octave_whole = makeOctave(2, Fs, 1:8);  % 5 * lenSeg
octave_half = makeOctave(1, Fs, 1:8);   % 3 * lenSeg
octave_quarter = makeOctave(0.5, Fs, 1:8); % 2 * lenSeg

% get ADSR windows
[t_1, ADSR_whole] = ADSR(2, Fs, 1/8, 1/8, 1/2, 1.3, 1);
[t_2, ADSR_half] = ADSR(1, Fs, 1/8, 1/8, 1/2, 1.3, 1);
[t_3, ADSR_quarter] = ADSR(0.5, Fs, 1/8, 1/8, 1/2, 1.3, 1);
whole_mod = [ADSR_whole, pause];
half_mod = [ADSR_half, pause];
quarter_mod = [ADSR_quarter, pause];

for i = 1:8
    octave_whole(i,:) = octave_whole(i,:) .* whole_mod;
    octave_half(i,:) = octave_half(i,:) .* half_mod;
    octave_quarter(i,:) = octave_quarter(i,:) .* quarter_mod;
end

lenWhole = 20000 - 4000 - overlap;
lenHalf = 12000 - 4000 - overlap;
lenQuart = 8000 - 4000 - overlap; 
sound([octave_whole(1,1:lenWhole), octave_whole(2,1:lenWhole), octave_half(3,1:lenHalf), octave_half(4,1:lenHalf), octave_quarter(5,1:lenQuart), octave_quarter(6,1:lenQuart), octave_quarter(7,1:lenQuart), octave_quarter(8,1:lenQuart)], Fs);