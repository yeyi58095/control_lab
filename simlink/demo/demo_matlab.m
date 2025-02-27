clc;
plot(time, input, 'r', time, output, '.b', time, integral, '.g', time, diff, '.y')
axis([0 10 -3 3])
xlabel('time(sec)')
ylabel('amplitude')
title('lab_demo')
legend('input', 'output')
grid