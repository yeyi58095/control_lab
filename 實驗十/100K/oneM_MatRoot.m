clear
clc
model = 'OneM';  % 你的模型名稱
open_system(model);
io = [linio([model '/Gain4'],1,'input');      % 你可以根據 block name 修改
      linio([model '/Gain5'],1,'output')];
linsys = linearize(model, io);
rlocus(linsys), grid on
title('Bode Plot of Transfer Function')