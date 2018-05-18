clear all; close all;
n = 0:255;
x1 = sinc(0.15 * (n - 32));
x2 = x1 .* (-1) .^ n;
x3 = x1 .* cos(2 * pi * 0.2 * n);

N = 1024;
Fs = 1;
X1_fft = fftshift(fft(x1, N));
X2_fft = fftshift(fft(x2, N));
X3_fft = fftshift(fft(x3, N));

w_period = 2*pi*Fs/N;
w = (-0.5*N:0.5*N - 1) * w_period;
X1_magn = abs(X1_fft);
X1_phase = angle(X1_fft);
X2_magn = abs(X2_fft);
X2_phase = angle(X2_fft);
X3_magn = abs(X3_fft);
X3_phase = angle(X3_fft);

figure;
subplot(2, 1, 1);
plot(w, X1_magn);
    xlabel('Frequency');
    ylabel('magnitude of X1_fft');

subplot(2, 1, 2);
plot(w, X1_phase);
    xlabel('Frequency');
    ylabel('phase of X1_fft');


figure;
subplot(2, 1, 1);
plot(w, X2_magn);
    xlabel('Frequency');
    ylabel('magnitude of X2_fft');

subplot(2, 1, 2);
plot(w, X2_phase);
    xlabel('Frequency');
    ylabel('phase of X2_fft');


figure;
subplot(2, 1, 1);
plot(w, X3_magn);
    xlabel('Frequency');
    ylabel('magnitude of X3_fft');

subplot(2, 1, 2);
plot(w, X3_phase);
    xlabel('Frequency');
    ylabel('phase of X3_fft');


