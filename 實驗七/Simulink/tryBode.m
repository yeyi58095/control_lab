clc
clear

G = tf([1], [0.8/(100*0.5) 1]);
figure;
bodeplot(G); % 比 bode() 更靈活
grid on


G = tf([1], [0.8/(100*0.5) 1]);

opts = bodeoptions;
opts.FreqUnits = 'rad/s';       % 頻率單位
opts.MagUnits = 'dB';           % 幅度單位
opts.PhaseWrapping = 'on';      % 可選開啟 phase 包裝
opts.Grid = 'on';               % 加網格

figure;
bodeplot(G, opts);
