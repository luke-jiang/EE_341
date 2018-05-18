% part 3: seashell sound synthesis
clear all; close all;
Ex1;
cos_freq = 200;
%-0.65
decay_factor = -0.65;

% get random signal
rand = randn(1, length(t_whole));

% define two modification functions
cos_mod = cos(2 * pi * cos_freq * t_whole);
exp_mod = 0.2 * exp(decay_factor * t_whole);

% define modified random signal
decay = rand .* cos_mod .* exp_mod;

% plot the result seas
figure;
plot(t_whole, decay);
sound(decay, Fs);