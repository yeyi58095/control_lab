clc
clear

% P5_list = [0.5, 0.75, 1.0, 1.25]; % 可加入更多值
figure;
hold on;

legend_entries = strings(1, 10); % 預先建立 legend 字串

for i = 1:10
    % P5 = P5_list(i);
    G = tf([37.4544], [1 2 * (0.306 + 0.1 * i - 0.1) * 6.12 37.4544]);
    h = bodeplot(G);
    setoptions(h, 'FreqUnits', 'Hz'); % 顯示 Hz
    legend_entries(i) = sprintf("zeta = %.2f", 2 * (0.306 + 0.1 * i - 0.1) * 6.12);
end

grid on;
legend(legend_entries); % 顯示對應圖例
