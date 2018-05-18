% part 4: cat and tiger modification
clear all; close all;
scale_down = 8;
scale_up = 1;

% read from files
[y_cat, Fs_cat] = audioread('cat.wav');
[y_tiger, Fs_tiger] = audioread('tiger.wav');

% find time vectors
t_tiger = (0:(length(y_tiger)-1)) * (1/(Fs_tiger));
t_cat = (0:(length(y_cat)-1)) * (1/Fs_cat);

% get time scaled cat-to-tiger sound using resample
y_catTotiger = resample(y_cat, scale_down, scale_up);

% plotting tiger and cat sounds.
figure;
subplot(2, 1, 1)
plot(t_cat, y_cat);
subplot(2, 1, 2)
plot(t_tiger, y_tiger);

% play the result cat-to-tiger sound.
sound(y_catTotiger, Fs_cat);