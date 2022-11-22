clc;
clear all;
close all;
N = 32;
n = 0:31
w = 2 * pi / N
x = sin(w * n)
stem(n, x);
k1 = 0:31
g = fft(x, 32);
stem(k1, abs(g))
k = 2
Y = [];
j = k - 1;

for i = 1:length(x)
    Y = [Y x(i)]

    if (i ~= length(x))

        for m = 1:j
            Y = [Y 0]
        end

    end

end

stem(Y)
rs = fft(Y, length(Y))
k = 0:length(Y) - 1
stem(k, abs(rs))
subplot(2, 1, 1)
g = fft(x, 32)
stem(k1, abs(g))
subplot(2, 1, 2)
k = 0:length(Y) - 1;
stem(k, abs(rs));
rs(28) = 0;
rs(29) = 0;
rs(30) = 0;
rs(31) = 0;
rs(32) = 0;
rs(33) = 0;
rs(34) = 0;
rs(35) = 0;
r1 = ifft(rs)
stem(real(r1))
