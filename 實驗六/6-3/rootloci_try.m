clear 
clc
s = tf('s');
tau = 0.51;
K_m  = 307;
D = 0.1;

sys =   (s + D) / (s * s * (tau *s + 1));

figure(1)
rlocus(sys)

figure(2)
K = 0.358;
sys_cl = feedback(K * sys, 1);
step(sys_cl)

k_p = K / K_m
k_i = k_p * D