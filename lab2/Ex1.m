clear all; close all;

Fs = 8000;
t_whole = 0:(1/Fs):(2-1/Fs);
t_half = 0:(1/Fs):(1-1/Fs);
t_quarter = 0:(1/Fs):(0.5-1/Fs);
pause = 0 * t_quarter;
frequencies = [0 2 3 5 7 8 10 12];

% Part 1: implementing an octave
octave_whole = makeOctave(2, Fs, 1:4);
octave_quarter = makeOctave(0.5, Fs, 5:8);

% octane test
% sound([octave_whole(1,:), octave_whole(2,:), octave_whole(3,:), octave_whole(4,:), octave_quarter(5,:), octave_quarter(6,:), octave_quarter(7,:), octave_quarter(8,:)], Fs);



