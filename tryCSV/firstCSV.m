
%{
ch1 = ddeinit('excel', 'scope_13.csv');
T1 = ddereq(ch1, 'r3c1:r2002c1');
V1 = ddereq(ch1, 'c2r3:r2002c2');

plot(T1, V1);
%}

clc;
data = readtable('scope_13.csv');  % 讀取 CSV

T1 = data{3:end, 1};  % 從第3行開始讀取第一列（時間）
V1 = data{3:end, 2};  % 從第3行開始讀取第二列（電壓）
V2 = data{3:end, 3};

plot(T1, V1, 'b', T1, V2, 'r'); 
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Oscilloscope Waveform');
grid on;
