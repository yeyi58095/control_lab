% 負載數據
load = 1:7;

% 穩態電壓數據
V1 = [1, 1, 1, 1, 1, 1, 1];
V3 = [3, 3, 3, 3, 3, 3, 3];
V5 = [5, 5, 5, 5, 5, 5, 5];
V7 = [7, 7, 7, 7, 7, 7, 7];
V9 = [9, 9, 9, 9, 9, 9, 9];

% 馬達轉速數據 (rpm)
rpm1 = [37.12, 36.48, 33.92, 30.72, 27.52, 24.96, 22.72];
rpm3 = [82.88, 80.48, 76.8, 69.76, 60.48, 54.72, 50.24];
rpm5 = [136.96, 135.04, 125.76, 112.64, 101.76, 89.6, 82.24];
rpm7 = [187.84, 184, 170.88, 154.88, 133.76, 115.84, 103.68];
rpm9 = [212.8, 208.32, 187.84, 157.12, 136.32, 110.08, 103.68];

% 圖1：負載 vs. 穩態電壓
figure;
plot(load, V1, 'o-', 'LineWidth', 2, 'DisplayName', '1V');
hold on;
plot(load, V3, 'o-', 'LineWidth', 2, 'DisplayName', '3V');
plot(load, V5, 'o-', 'LineWidth', 2, 'DisplayName', '5V');
plot(load, V7, 'o-', 'LineWidth', 2, 'DisplayName', '7V');
plot(load, V9, 'o-', 'LineWidth', 2, 'DisplayName', '9V');
hold off;
xlabel('負載');
ylabel('穩態電壓 (V)');
title('負載 vs. 穩態電壓');
legend('show');
grid on;

% 圖2：負載 vs. 馬達轉速
figure;
plot(load, rpm1, 'o-', 'LineWidth', 2, 'DisplayName', '1V');
hold on;
plot(load, rpm3, 'o-', 'LineWidth', 2, 'DisplayName', '3V');
plot(load, rpm5, 'o-', 'LineWidth', 2, 'DisplayName', '5V');
plot(load, rpm7, 'o-', 'LineWidth', 2, 'DisplayName', '7V');
plot(load, rpm9, 'o-', 'LineWidth', 2, 'DisplayName', '9V');
hold off;
xlabel('負載');
ylabel('馬達轉速 (rpm)');
title('負載 vs. 馬達轉速');
legend('show');
grid on;
