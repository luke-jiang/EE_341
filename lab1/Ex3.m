[y, fs] = audioread('cat.wav');
zero = zeros(length(y), 1);
z = [y; zero; 2*y; zero; (1/2)*y];
sound(z, fs);
audiowrite('result.wav', z, fs)