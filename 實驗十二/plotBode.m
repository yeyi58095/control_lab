clear
clc

model = 'PoleZeroAndFreqResp';  % 你的模型名稱
open_system(model);
io = [linio([model '/Gain3'],1,'input');      % 你可以根據 block name 修改
      linio([model '/Gain2'],1,'output')];
linsys = linearize(model, io);
bode(linsys), grid on
title('Bode Plot of Transfer Function')