% 清除變數並載入 Simulink 模型
clc;
clear all;
model_name = 'varParam_laplace'
load_system(model_name);  % 替換為你的 Simulink 檔案名稱

% 設定不同的頻率值
freq_values = [0.5 0.4 0.3 0.2 0.1];  % 測試不同頻率
num_tests = length(freq_values);

figure;  % 開啟新圖表視窗

for i = 1:num_tests
    % 設定 f 值
    f = freq_values(i);
    assignin('base', 'f', f);  % 將 f 設定到 Base Workspace
    
    set_param(model_name, 'SimulationCommand', 'start'); 
   pause(1);

    % 運行 Simulink 模型
    simOut = sim(model_name, 'StopTime', '10');  % 10秒模擬
    
    % 獲取 Simulink 輸出的數據
    t = time;  % 時間軸
    tri_wave = triangleWave;  % 取出三角波數據
    
    % 建立子圖，每個 f 一張
    subplot(num_tests, 1, i);

    plot(t, tri_wave, 'b', t, diff_result, 'r');
    ylim([-5, 5]);
yticks(-10:0.5:10)
    xlabel('Time (s)');
    ylabel('Amplitude');
    title(sprintf('Triangular Wave (f = %d Hz)', f));
    grid on;
end

% 總標題
sgtitle('Triangular Waves for Different Frequencies');
