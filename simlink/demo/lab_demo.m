clc;
plot(time, input, 'r', time, output, '.b')
axis([0 10 -3 3])
xlabel('time(sec)')
ylabel("amplitude")
title('lab demo')
legend('input', 'output')
grid