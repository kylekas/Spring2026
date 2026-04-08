%Homework 2 Kasmiersky, vibrations professor Luo
%--------------------------------------------------------------------------
clc; clear; close all

%% Problem 2a
ta = 0:0.3:10;

xa = zeros(1,length(ta));
%x_0 = 0, leave vector alone

for i = 2:length(ta)
xa(i) = xa(i-1) + 0.3.*(-3.*xa(i-1)+2.*sin(ta(i))+6);
end

%%problem 2b
tb = 0:0.1:10;

xb = zeros(1,length(tb));
%x_0 = 0, leave vector alone

for i = 2:length(tb)
xb(i) = xb(i-1) + 0.1.*(-3.*xb(i-1)+2.*sin(tb(i))+6);
end

%%problem 2c
t = 0:0.1:10;
x1e = (-9/5).*exp(-3.*t)+(3/5).*sin(t)-(1/5).*cos(t) + 2;

figure(Name="problem 2c")
hold on
plot(ta,xa,DisplayName="2a")
plot(tb,xb,DisplayName="2b")
plot(t,x1e,DisplayName="1e analytical")
legend
grid on
ylabel("x")
xlabel("t")

clear

%% 2d
t1 = 0:0.25:2;
t2 = 0:0.2:2;
t3 = 0:0.15:2;
t4 = 0:0.02:2;

x1 = zeros(1,length(t1));
x1(1) = 1;
x2 = zeros(1,length(t2));
x2(1) = 1;
x3 = zeros(1,length(t3));
x3(1) = 1;
x4 = zeros(1,length(t4));
x4(1) = 1;

for i = 2:length(t1)
    x1(i) = x1(i-1) + 0.25.*(-10.*x1(i-1));
end

for i = 2:length(t2)
    x2(i) = x2(i-1) + 0.2.*(-10.*x2(i-1));
end

for i = 2:length(t3)
    x3(i) = x3(i-1) + 0.15.*(-10.*x3(i-1));
end

for i = 2:length(t4)
    x4(i) = x4(i-1) + 0.02.*(-10.*x4(i-1));
end

figure(Name="problem 2d")
hold on
plot(t1,x1,DisplayName="0.25")
plot(t2,x2,DisplayName="0.2")
plot(t3,x3,DisplayName="0.15")
plot(t4,x4,DisplayName="0.02")
legend
grid on
ylabel("x")
xlabel("t")