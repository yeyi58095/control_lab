clc; close all; clear;

% 設定當前資料夾
folderPath = pwd;  % 取得當前工作目錄
csvFiles = dir(fullfile(folderPath, '*.csv'));  % 獲取所有 CSV 檔案

% 檢查是否有 CSV 檔案
if isempty(csvFiles)
    error('No CSV files found in the folder!');
end

% 建立一個存放圖片的資料夾
outputFolder = fullfile(folderPath, 'output_images');
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

% 遍歷所有 CSV 檔案
for k = 1:length(csvFiles)
    % 獲取 CSV 檔名
    csvName = csvFiles(k).name;
    fprintf('Processing: %s\n', csvName);
    
    % 讀取 CSV 檔案
    data = readtable(fullfile(folderPath, csvName));
    
    % 清理 NaN 數據
    cleanCSV = rmmissing(data);
    
    % 確保 CSV 內有足夠數據
    if size(cleanCSV, 2) < 3
        warning('Skipping %s: Not enough columns.', csvName);
        continue;
    end
    
    % 取得 X 軸（時間）和 Y 軸（數據）
    x = cleanCSV.Var1;  % 時間
    y1 = cleanCSV.Var2; % 第一組信號
    y2 = cleanCSV.Var3; % 第二組信號
    
    % 繪製波形
    figure('Visible', 'off'); % 不顯示視窗，加速處理
    plot(x, y1, 'b', 'LineWidth', 1.5); % 藍色線代表 Var2
    hold on;
    plot(x, y2, 'r', 'LineWidth', 1.5); % 紅色線代表 Var3
    hold off;
    
    xlabel('Time (s)');  
    ylabel('Voltage (V)');  
    title(sprintf('Differentiated Square Wave - %s', csvName), 'Interpreter', 'none');  
    legend('Output', 'Input');  
    grid on;

    % 儲存圖片
    saveas(gcf, fullfile(outputFolder, [csvName, '.png'])); 
    close(gcf);  % 關閉圖形窗口，避免記憶體累積
end

fprintf('All CSV files processed. Images saved in %s\n', outputFolder);
