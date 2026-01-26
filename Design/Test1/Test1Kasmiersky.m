% Kyle Kasmiersky
% Test 1 Script
% Aircraft Design - Chakraborty
%--------------------------------------------------------------------------
clc; clear; close all

%% variables

b1 = 2;
b2 = 2;

alpha1 = 2;
beta1 = 2;
gamma1 = 2;
delta1 = 2;

alpha2 = 2;
beta2 = 2;
gamma2 = 2;
delta2 = 2;

N_ba = 2;
N_tg = 2;

eta_m = 2;
eta_ba = 2;
eta_gb = 2;
eta_gen = 2;
eta_tg = 2;

S = zeros(17,17);
S(1:9,1:9) = eye(9,9);
S(10,1:9) = ones(1,9);
S(10,12:13) = -eta_m.*[1 1];
S(11,10:12) = [N_ba 0 -1];
S(12,10:17) = [N_ba/eta_ba 1 0 0 0 0 0 -eta_ba];
S(13,14:15) = [eta_gb -1];
S(14,15:16) = [eta_gen -1];
S(15,16:17) = [eta_tg -1];
S(16,12:17) = [alpha1 beta1 gamma1 0 0 delta1];
S(17,12:17) = [alpha2 beta2 gamma2 0 0 delta2];