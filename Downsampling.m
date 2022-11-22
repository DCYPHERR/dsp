clc;
clear all;
close all;
syms a b c d e f;
x = [1 2 a b 3 4 c d 5 6 e f 7 8];
M1 = 2;
M2 = 3;
i = 1;
j = 1;

for index = 1:M1:length(x)
    y1(i) = x(index);
end

for index = 1:M2:length(x)
    y2(j) = x(index);
    j = j + 1;
end

x
y1
y2
