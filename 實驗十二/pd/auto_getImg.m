clc
model = 'pd_controller';
load_system(model);

frequencies = [0.1 0.3 0.5 0.6 0.7 0.75 0.8 0.9 1 3 5];

for f = frequencies
    omega = 2 * pi * f;

    % 設定 Sine Wave 頻率
    set_param([model '/Sine Wave'], 'Frequency', num2str(omega));

    % 動態設定模擬時間
    if f > 1
        simTime = 2;
    else
        simTime = 10;
    end


    % 設定並執行模擬
    simOut = sim(model, ...
        'StopTime', num2str(simTime), ...
        'ReturnWorkspaceOutputs', 'on');

    % 取得 input/output 時間與資料
    input_t = simOut.input_data.time;
    input_y = simOut.input_data.signals.values;
    output_y = simOut.output_data.signals.values;

    % 確保資料夾存在
    folderName = sprintf('./%.3g/Simulink', f);
    if ~exist(folderName, 'dir')
        mkdir(folderName);
    end

    %% 混合圖
    fig = figure('Visible', 'off');
    plot(input_t, input_y, 'r', 'LineWidth', 3); hold on;
    plot(input_t, output_y, 'b', 'LineWidth', 3);
    legend({'input', 'output'});
    xlabel('Time [s]');
    ylabel('Amplitude');
    title(sprintf('Input & Output (f = %.2f Hz)', f));
    grid on;
    saveas(fig, fullfile(folderName, 'input_output.png'));
    close(fig);

    %% input 圖
    fig = figure('Visible', 'off');
    plot(input_t, input_y, 'r', 'LineWidth', 3);
    legend({'input'});
    xlabel('Time [s]');
    ylabel('Amplitude');
    title(sprintf('Input (f = %.2f Hz)', f));
    grid on;
    saveas(fig, fullfile(folderName, 'input.png'));
    close(fig);

    %% output 圖
    fig = figure('Visible', 'off');
    plot(input_t, output_y, 'b', 'LineWidth', 3);
    legend({'output'});
    xlabel('Time [s]');
    ylabel('Amplitude');
    title(sprintf('Output (f = %.2f Hz)', f));
    grid on;
    saveas(fig, fullfile(folderName, 'output.png'));
    close(fig);

    fprintf('%.2f Hz → 已完成三圖，模擬時間 %.1f 秒\n', f, simTime);
end

close_system(model, 0);
