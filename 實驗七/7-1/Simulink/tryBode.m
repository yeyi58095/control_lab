clc
clear
G = tf([10 , exp(1), pi], [1, pi, 0.51, i*i])
bode(G)