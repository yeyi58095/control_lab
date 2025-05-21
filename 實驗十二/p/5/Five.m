
%{
ch1 = ddeinit('excel', 'scope_13.csv');
T1 = ddereq(ch1, 'r3c1:r2002c1');
V1 = ddereq(ch1, 'c2r3:r2002c2');

plot(T1, V1);
%}
clc;
csvName = ['scope_1.csv'];
data = readtable(csvName);
data_matrix = readmatrix(csvName);
head(data);
size(data_matrix);
% 讀取數據（假設 firstCSV 是 table 格式）
cleanCSV = rmmissing(data);  % 刪除含 NaN 的行

x = cleanCSV.Var1;  % X 軸數據（時間）
y1 = cleanCSV.Var2; % 第一組信號
y2 = cleanCSV.Var3; % 第二組信號

e = exp(1);

figure;
plot(x, y1, 'b', 'LineWidth', 1.5); % 藍色線代表 Var2
hold on;

plot(x, y2, 'r', 'LineWidth', 1.5); % 紅色線代表 Var3
hold off;


xlabel('Time (s)');  % X 軸標籤
ylabel('Voltage (V)');  % Y 軸標籤（示波器數據）
title(' ');  
legend('Output', 'Input');  
grid on;

% 設定時間與信號
t = x;       % 時間
y_in = y1;  % 輸出信號
y_out = y2;   % 輸入信號



% 找到輸入訊號上升沿
threshold = (max(y_in) + min(y_in)) / 2;  % 設定中間值作為觸發點
rising_idx = find(diff(y_in > threshold) == 1); % 找到輸入信號上升點

% 計算時間常數 tau
tau_values = [];  % 存儲每次的時間常數

for i = 1:length(rising_idx)
    t_start = t(rising_idx(i));   % 階躍變化的起始時間
    V_initial = y_out(rising_idx(i)); % 初始電壓
    V_final = max(y_out);  % 最終穩態電壓 (假設為最大值)
    
    % 計算 63.2% 電壓點
    V_tau = V_final - (V_final - V_initial) * (1 / exp(1));
    
    % 找到響應達到 V_tau 的時間點
    tau_idx = find(y_out(rising_idx(i):end) >= V_tau, 1) + rising_idx(i) - 1;
    t_tau = t(tau_idx); % 時間常數點
    
    % 計算時間常數
    tau = t_tau - t_start;
    tau_values = [tau_values, tau];
end

% 顯示結果
disp(['Time Constants: ', num2str(tau_values)]);
mean_tau = mean(tau_values);
disp(['Average Time Constant: ', num2str(mean_tau)]);



