clc
clear

P5 = 0.5

G = tf([1], [0.8/(100*P5) 1]);
figure;
bodeplot(G); % 比 bode() 更靈活
grid on
