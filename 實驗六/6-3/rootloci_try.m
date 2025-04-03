s = tf('s');
tau = 0.51;
K_m  = 307;
D = 3;

sys =  (s + D) / (s * (tau *s + 1));
%{
figure(1)
rlocus(sys)
%}
figure(2)
K = 3.86;
sys_cl = feedback(K * sys, 1);
step(sys_cl)