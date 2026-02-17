% Kyle Kasmiersky
% Professor Luo - Aero 4630
% Homework 1 - 1/29/2026
%--------------------------------------------------------------------------
clc; clear; close all;

<<<<<<< HEAD:Vibes/Homework1Kasmiersky.m
%% bii
x = -5:0.01:5;
v = -5:0.01:5;

Fspring = fs(x);

Fdamp = fd(v);

subplot(1,2,1)
plot(x,Fspring)
xlabel("x_s")
ylabel("f_s")
grid on
title("spring force")

subplot(1,2,2)
plot(v, Fdamp)
xlabel("v_d")
ylabel("f_d")
grid on
title("damper force")

%% biii

clear;

fs1 = -6:0.01:6;

xs = invfs(fs1);
vd = invfd(-fs1);

figure
plot(xs,vd)
xlabel("x_s")
ylabel("v_s")
grid on
title("v_s as a funciton of x_s")


%% functions

function vd = invfd(fd)
    for i = 1:length(fd)
        if fd(i) >  0
            vd(i) = 4*fd(i);
        elseif fd(i) <= 0
            vd(i) = fd(i);
        end
    end
end

function xs = invfs(fs)
    for i = 1:length(fs)
        if fs(i) > 4
            xs(i) = 2*fs(i)-5;
        elseif fs(i) <= 4 && fs(i) >= -4
            xs(i) = (0.75)*fs(i);
        elseif fs(i) < -4
            xs(i) = -3;
        end
    end
end


function F = fd(vd)

for i = 1:length(vd)

    if vd(i)>=0
        F(i)= 0.25.*vd(i);
    elseif vd(i) < 0
        F(i) = vd(i);
    end
end
end

function F = fs(xs)

for i = 1:length(xs)
    if xs(i) <= -3
        F(i) = -inf;
    elseif  xs(i) > -3 && xs(i) <= 3
        F(i) = (4/3).*xs(i);
    elseif xs(i) > 3
        F(i) = 0.5.*xs(i) + 2.5;
    end
end
end
=======
[T,a,P,rho,nu,mu] = atmosisa(41475)

v = 600*1.687811;

M = v/a;


.
>>>>>>> 84c892876e4f49acfcbea0e64015fd815edb0cd0:Vibes/Homework 1/Homework1Kasmiersky.m
