
%{
ch1 = ddeinit('excel', 'scope_13.csv');
T1 = ddereq(ch1, 'r3c1:r2002c1');
V1 = ddereq(ch1, 'c2r3:r2002c2');

plot(T1, V1);
%}
clc;
csvName = 'acmpe_18.csv';

data = readtable(csvName);
data_matrix = readmatrix(csvName);
head(data)
size(data_matrix)
% 讀取數據（假設 firstCSV 是 table 格式）
cleanCSV = rmmissing(data);  % 刪除含 NaN 的行

x = cleanCSV.Var1;  % X 軸數據（時間）
y1 = cleanCSV.Var2; % 第一組信號
y2 = cleanCSV.Var3; % 第二組信號

figure;
plot(x, y1, 'b', 'LineWidth', 1.5); % 藍色線代表 Var2
hold on;
plot(x, y2, 'r', 'LineWidth', 1.5); % 紅色線代表 Var3
hold off;

xlabel('Time (s)');  % X 軸標籤
ylabel('Voltage (V)');  % Y 軸標籤（示波器數據）
title('Differeniate Square Wave');  
legend('Output', 'Input');  
grid on;
