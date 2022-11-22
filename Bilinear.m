clc;
clear all;
close all;

Ap = 0.6;
As = 0.1;
wp = 0.35 * pi;
ws = 0.7 * pi;
t = 1;

ohmp = (2 / t) * tan(wp / 2);
ohms = (2 / t) * tan(ws / 2);

den = 2 * log10(ohms / ohmp);
nump1 = ((1 / (As^2)) - 1);
nump2 = ((1 / (Ap^2)) - 1);
num = log10(nump1 / nump2)
order = ceil(num / den)

disp('for lpf = 1')
disp('for hpf = 2')
disp('for bsf = 3')
disp('for bpf = 4')

type = 3;

switch type
    case 1
        ohmc = ohmp / (As^(1 / (2 * order)));
        wc = 2 * atan(ohmc / 2);
        [b, a] = butter(order, wc / pi);
    case 2
        ohmc = ohmp / (As^(1 / (2 * order)));
        wc = 2 * atan(ohmc / 2);
        [b, a] = butter(order, wc / pi, 'high');
    case 3
        ohmc1 = ohmp / (Ap^(1 / (2 * order)));
        ohmc2 = ohmp / (As^(1 / (2 * order)));
        wc1 = 2 * atan(ohmc1 / 2);
        wc2 = 2 * atan(ohmc2 / 2);
        wc = [wc1 wc2]
        [b, a] = butter(order, wc / pi);
    case 4
        ohmc1 = ohmp / (Ap^(1 / (2 * order)));
        ohmc2 = ohmp / (As^(1 / (2 * order)));
        wc1 = 2 * atan(ohmc1 / 2);
        wc2 = 2 * atan(ohmc2 / 2);
        wc = [wc1 wc2]
        [b, a] = butter(order, wc / pi, 'stop');
    otherwise
        disp('error')
end

[h, w] = freqz(b, a, 128)
plot(w / pi, 20 * log10(abs(h)))
