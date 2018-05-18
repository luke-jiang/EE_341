clear all;
close all;

Fs = 1;
% N = 32, 128, 512
N = 128;
n = 0:127;
x1 = 1 + cos(2 * pi * 0.25 * n);
x2 = 1 + cos(2 * pi * 0.5 * n);
x3 = 1 + cos(2 * pi * 0.26 * n);

x1_fft = (fft(x1, N));
x1_fft_sh = fftshift(x1_fft);
x2_fft = (fft(x2, N));
x2_fft_sh = fftshift(x2_fft);

x3_fft = (fft(x3, N));
x3_fft_sh = fftshift(x3_fft);


x1_fft_re = abs(x1_fft);
x1_fft_sh_re = abs(x1_fft_sh);
x2_fft_re = abs(x2_fft);
x2_fft_sh_re = abs(x2_fft_sh);
x3_fft_re = abs(x3_fft);
x3_fft_sh_re = abs(x3_fft_sh);
x1_fft_im = angle(x1_fft);
x2_fft_im = angle(x2_fft);

w_period = (2 * pi) / N;
w = (0:(N-1)) * w_period;
w_sh = (-N/2:(N-1)/2) * w_period;

figure;
subplot(2,1,1);
stem(w , x1_fft_re);
subplot(2,1,2);
stem(w_sh, x1_fft_sh_re);

figure;
subplot(2,1,1);
stem(w , x2_fft_re);
subplot(2,1,2);
stem(w_sh, x2_fft_sh_re);

figure;
stem(w_sh, x3_fft_sh_re);
    xlabel('Frequency');
    ylabel('magnitude of X3_fft with N=128');

