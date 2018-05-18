stock = importdata('microsoftstock.txt');
figure;
plot(stock);
hold on;

% 30 days filter - difference equation
a1 = [30];
b1 = ones(1, 29);
y1 = filter(b1, a1, stock);
plot(y1(30:end), 'r');
hold on;

% 30 days filter - impulse
imp = [1 zeros(1, 49)];
h1 = filter(b1, a1, imp);
y2 = conv(stock, h1,'same');
plot(y2(1:1150), 'g');


% plot original
figure;
plot(stock);
hold on;
% first difference filter - difference equation
a2 = [1 zeros(1, 29)];
b2 = [1, -1 zeros(1, 28)];
y3 = filter(b2, a2, stock);
plot(y3, 'r');
hold on;
% first difference filter - impulse
h2 = filter(b2, a2, imp);
y4 = conv(stock, h2, 'same');
plot(y4, 'r');

% directly use "freqz" function to generate filter
figure;
freqz(b1,a1);
figure;
freqz(b2,a2);



