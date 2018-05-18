% part 4: cat and tiger modification
clear all; close all;
scale_down = 1;
scale_up = 4;

% read from files
[y, Fs] = audioread('twinkle.txt_result.wav');

% find time vectors
t_y = (0:(length(y)-1)) * (1/Fs);

% get time scaled cat-to-tiger sound using resample
y_res = resample(y, scale_down, scale_up);

% play the result cat-to-tiger sound.
sound(y_res, Fs);
audiowrite('twinkle_scal.wav', y_res, Fs);