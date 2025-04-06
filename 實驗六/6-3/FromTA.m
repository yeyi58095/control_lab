s = tf('s')
a = 0.51
b = 307
D = 0.1

sys = (b * (s + D)) / (s * s * ((a * s) + 1));

figure(1);

rlocus(sys)