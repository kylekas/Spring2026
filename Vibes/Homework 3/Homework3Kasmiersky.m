% Kyle Kasmiersky
% Professor Luo - structures 3
% Homework 3
%--------------------------------------------------------------------------
clc; clear; close all

%% Problem 5e

 t = 0:0.001:40;
 dt = 0.001;

 x0=0;
 v0=0;

 x = zeros(1,length(t));
 v = zeros(1,length(t));

 const = -4/0.5;

 for i = 2:length(t)
 x(i) = x(i-1) + dt.*(v(i-1));
 v(i) = v(i-1) + dt.*(const.*x(i-1) - 9.81);
 end

figure()

sgtitle("x and v of mass")

subplot(1,2,1)
plot(t,x)
xlabel("t (sec.)")
ylabel("x (meters)")
grid on

subplot(1,2,2)
plot(t,v)
xlabel("t (sec.)")
ylabel("v (meters/sec.)")
grid on

clear

%% Problem 5f
 t = 0:0.001:40;
 dt = 0.001;

 x0=0;
 v0=0;

 x = zeros(1,length(t));
 v = zeros(1,length(t));

 const = -4/0.5;

 for i = 2:length(t)
 x(i) = x(i-1) + dt.*(v(i-1));
 v(i) = sin(2.8.*t(i));
 end

figure()

sgtitle("x and v of mass part f")

subplot(1,2,1)
plot(t,x)
xlabel("t (sec.)")
ylabel("x (meters)")
grid on

subplot(1,2,2)
plot(t,v)
xlabel("t (sec.)")
ylabel("v (meters/sec.)")
grid on