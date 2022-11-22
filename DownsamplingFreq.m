clc;
clear all;
close all;
t = -10:1/100:10
w = linspace(-10 * pi, 10 * pi, length(t))
Mvec = [1 2 3 4 5 6]

for i = 1:length(Mvec)
    yn = zeros(1);
    Ts = Mvec(i) * (1/6)
    ts = -10:Ts:10
    n = ts ./ Ts
    yn = (sinc(ts)).^2
    figure(1)
    subplot(3, 2, i)
    stem(ts, yn)
    xlabel('ts (sec)')
    ylabel('Sinc^2(M*ts')
    legend('102015178 Harkirat')
    title(['Downsampling factor M = ' num2str(Mvec(i)) ' for Sinc^2(t)'])
    xsw = zeros(1, length(w))

    for k = 1:length(w)
        xsw(k) = sum(yn .* exp(-j .* w(k) .* n));
    end

    figure(2)
    subplot(3, 2, i)
    plot(w, abs(xsw))
    xlabel('\omega (radian)')
    ylabel('F[Sinc^2(M*ts)]')
end
