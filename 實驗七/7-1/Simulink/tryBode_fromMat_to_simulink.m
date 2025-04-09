clear
clc
model = 'TryBode_Simulink';  % 你的模型名稱
open_system(model);
io = [linio([model '/Sum'],1,'input');      % 你可以根據 block name 修改
      linio([model '/Transfer Fcn'],1,'output')];
linsys = linearize(model, io);
bode(linsys), grid on
