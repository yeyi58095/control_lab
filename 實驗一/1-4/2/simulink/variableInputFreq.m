clc;

load_system('OneFour_2_block')  % 載入 Simulink 模型
freqs = [0.1, 0.5, 1, 2, 5];  % 定義不同頻率
outputResults = [];


% 取得輸出數據的 Dataset
outputDataset = outputResults.getElement(1); % 取得第一個信號的數據
time = outputDataset.Values.Time;  % 取得時間軸
data = outputDataset.Values.Data;  % 取得對應的輸出數據

% 繪製信號輸出
figure;
plot(time, data);
xlabel('Time (s)');
ylabel('Output Voltage (V)');
title('Time vs. Output Voltage');
grid on;
