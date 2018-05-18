[s1, Fs] = audioread('flute-short.wav');
k = -256:255;
n = Fs / 512;
s1_fft = fftshift(fft(s1, 512));
s1_fft_abs = abs(s1_fft);
figure;
semilogy(k*n, s1_fft_abs);
title('Flute N=512');