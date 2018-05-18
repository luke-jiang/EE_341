stock = importdata('microsoftstock.txt');
[music, fs] = audioread('music.wav');


% fir = order: 10; cutoff: 0.3 * pi
b_fir = fir1(10, 0.3);
figure;
freqz(b_fir,1);
% butter = order: 10; cutoff: 0.3 * pi 
[b_butter, a_butter] = butter(10, 0.3);
figure;
freqz(b_butter, a_butter);

% making filter via impulse response
imp = [1 zeros(1, 49)]; % the impulse
% impulse response of fir
h_fir = filter(b_fir, 1, imp);
figure;
subplot(2,1,1);
plot(h_fir);
% impulse response of butter
h_butter = filter(b_butter, a_butter, imp);
subplot(2,1,2);
plot(h_butter);

figure;
plot(stock);
hold on;
% implement fir to stock
stock_fir1 = filter(b_fir, 1, stock);
plot(stock_fir1, 'r');
hold on;
% implement butter to stock
stock_butter = filter(b_butter, a_butter, stock);
plot(stock_butter, 'g');

% implement fir to music
music_fir1 = filter(b_fir, 1, music);

% implement butter to music
music_butter = filter(b_butter, a_butter, music);

% play music
%sound(music, fs);
%sound(music_fir1, fs);
%sound(music_butter, fs);

