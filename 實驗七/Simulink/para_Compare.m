clc
clear

P5_list = [0.25 ,0.5, 0.75, 1.0, 1.25]; % 可以加入更多值
figure;
hold on;

legend_entries = strings(1, length(P5_list)); % 預先建立 legend 內容

for i = 1:length(P5_list)
    P5 = P5_list(i);
    G = tf([1], [0.8/(100*P5) 1]);
    h = bodeplot(G);
    setoptions(h, 'FreqUnits', 'Hz'); % 顯示 Hz（可選）
    legend_entries(i) = sprintf("P5 = %.2f", P5); % 生成 legend 字串
end

grid on;
legend(legend_entries); % 動態加 legend
