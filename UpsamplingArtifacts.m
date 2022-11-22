clc;
clear all;
close all;

f = [0 0.250 0.500 0.7500 1];
a = [1.0000 0.5000 0 0 0];

nf = 512;
b = fir2(nf - 1, f, a);
Hx = fftshift(freqz(b, 1, nf, 'whole'));

omega = -pi:2 * pi / nf:pi - 2 * pi / nf;
plot(omega / pi, abs(Hx))
grid
xlabel('\times\pi rad\sample')
ylabel('Magnitude')

y = upsample(b, 2);
Hy = fftshift(freqz(y, 1, nf, 'whole'));

hold on
plot(omega / pi, abs(Hy))
hold off
legend('Original', 'Upsampled')
text(0.65 * [-1 1], 0.45 * [1 1], ["\leftarrow Imaging" "Imaging \rightarrow"], ...
    'HorizontalAlignment', 'center')
