% Kyle Kasmiersky
% professor Luo - Vibes
% Homework 4
%--------------------------------------------------------------------------
clc; clear; close all

t = 0:0.1:40;

x1 = (15/(57*i)).*exp(3.*i.*t) - (15/(57*i)).*exp(-3.*i.*t) - (9/19).*sin(10.*t./3);

figure("Name","3b")

plot(t,x1)
grid on
xlabel("time t")
ylabel("position x")


% fig 2

x2 = exp(3.*i.*t)./(36*i) - exp(-3.*i.*t)./(36*i) - t.*cos(3.*t)./6;

figure('Name',"3c")

plot(t,x2)
grid on 
xlabel("time t")
ylabel("position x")
