[music, fs] = audioread('music.wav');
x = music;
g1 = 10;
g2 = 1;
g3 = 1;
g4 = 1;
music_equalized = equalize(x, g1, g2, g3, g4);
audiowrite('music_mod.wav', music_equalized, fs);
sound(music_equalized, fs);