s = tf('s');
a = 1;
b = 2;
D = 3;

sys = (s + D) / (s * (s + a));

figure(1)
rlocus(sys)

figure(2)
K = 9.9;
sys_cl = feedback(K * sys, 1);
step(sys_cl)