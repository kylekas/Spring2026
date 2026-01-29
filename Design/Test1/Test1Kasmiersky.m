% Kyle Kasmiersky
% Test 1 Script
% Aircraft Design - Chakraborty
%--------------------------------------------------------------------------
clc; clear; close all

%% Make Matrix
b1 = 2;
b2 = 2;

alpha1 = 1;
beta1 = 0;
gamma1 = 0;
delta1 = 0;

alpha2 = 0;
beta2 = 0;
gamma2 = 0;
delta2 = 2;

N_ba = 2;
N_tg = 2;

eta_m = 2;
eta_ba = 2;
eta_gb = 2;
eta_gen = 2;


S = zeros(17,17);
S(1:9,1:9) = eye(9,9);
S(10,1:9) = ones(1,9);
S(10,12:13) = -eta_m.*[1 1];
S(11,10:12) = [N_ba 0 -1];
S(12,10:17) = [N_ba/eta_ba 1 0 0 0 0 0 -eta_ba];
S(13,14:15) = [eta_gb -1];
S(14,15:16) = [eta_gen -1];
S(15,16:17) = [N_tg -1];
S(15,13) = -1;
S(16,12:17) = [alpha1 beta1 gamma1 0 0 delta1];
S(17,12:17) = [alpha2 beta2 gamma2 0 0 delta2];

%vector
     %Plp1-8, Pcp
Pp = [0,0,0,0,0,0,0,0,250];
    %b1,b2
b = [b1,b2];
BHE = [Pp,zeros(1,6),b]';

%% Constraint 1

% Prc = 0
%

%BHE and matrix
b1 = 0;
b2 = 0;

alpha1 = 1; %P1
beta1 = 0;  %P2
gamma1 = 0; %Pts
delta1 = 0; %Prc

alpha2 = 0;
beta2 = 0;
gamma2 = 0;
delta2 = 1;

N_ba = 4;
N_tg = 2;

eta_m = 0.9;
eta_ba = 0.97;
eta_gb = 0.98;
eta_gen = 0.9;


%matrix
S = zeros(17,17);
S(1:9,1:9) = eye(9,9);
S(10,1:9) = ones(1,9);
S(10,12:13) = -eta_m.*[1 1];
S(11,10:12) = [N_ba 0 -1];
S(12,10:17) = [N_ba/eta_ba 1 0 0 0 0 0 -eta_ba];
S(13,14:15) = [eta_gb -1];
S(14,15:16) = [eta_gen -1];
S(15,16:17) = [N_tg -1];
S(15,13) = -1;
S(16,12:17) = [alpha1 beta1 gamma1 0 0 delta1];
S(17,12:17) = [alpha2 beta2 gamma2 0 0 delta2];

%vector
     %Plp1-8, Pcp
Pp = [0,0,0,0,0,0,0,0,250];
    %b1,b2
b = [b1,b2];
BHE = [Pp,zeros(1,6),b]';

Constraint(1,:) = (S\BHE)'

%% constraint 2
b1 = 0;
b2 = 20;

alpha1 = 1; %P1
beta1 = 0;  %P2
gamma1 = 0; %Pts
delta1 = 0; %Prc

alpha2 = 0;
beta2 = 0;
gamma2 = 0;
delta2 = 1;

N_ba = 4;
N_tg = 2;

eta_m = 0.9;
eta_ba = 0.97;
eta_gb = 0.98;
eta_gen = 0.9;

S = zeros(17,17);
S(1:9,1:9) = eye(9,9);
S(10,1:9) = ones(1,9);
S(10,12:13) = -eta_m.*[1 1];
S(11,10:12) = [N_ba 0 -1];
S(12,10:17) = [N_ba/eta_ba 1 0 0 0 0 0 -eta_ba];
S(13,14:15) = [eta_gb -1];
S(14,15:16) = [eta_gen -1];
S(15,16:17) = [N_tg -1];
S(15,13) = -1;
S(16,12:17) = [alpha1 beta1 gamma1 0 0 delta1];
S(17,12:17) = [alpha2 beta2 gamma2 0 0 delta2];

%vector
     %Plp1-8, Pcp
Pp = [0,0,0,0,0,0,0,0,240];
    %b1,b2
b = [b1,b2];
BHE = [Pp,zeros(1,6),b]';

Constraint(2,:) = (S\BHE)'

%% constraint 3
b1 = 0;
b2 = 0;

alpha1 = 1; %P1 %isolated battery
beta1 = 0;  %P2
gamma1 = 0; %Pts
delta1 = 0; %Prc

alpha2 = 0;
beta2 = 0;
gamma2 = 0;
delta2 = 1; % isolated battery

N_ba = 4;
N_tg = 1; % one tg failed

eta_m = 0.9;
eta_ba = 0.97;
eta_gb = 0.98;
eta_gen = 0.9;

S = zeros(17,17);
S(1:9,1:9) = eye(9,9);
S(10,1:9) = ones(1,9);
S(10,12:13) = -eta_m.*[1 1];
S(11,10:12) = [N_ba 0 -1];
S(12,10:17) = [N_ba/eta_ba 1 0 0 0 0 0 -eta_ba];
S(13,14:15) = [eta_gb -1];
S(14,15:16) = [eta_gen -1];
S(15,16:17) = [N_tg -1];
S(15,13) = -1;
S(16,12:17) = [alpha1 beta1 gamma1 0 0 delta1];
S(17,12:17) = [alpha2 beta2 gamma2 0 0 delta2];

%vector
     %Plp1-8, Pcp
Pp = [0,0,0,0,0,0,0,0,180]; % consumes 180 kw
    %b1,b2
b = [b1,b2];
BHE = [Pp,zeros(1,6),b]';

Constraint(3,:) = (S\BHE)'

%% constraint 4 _ Pts = 226.7574 repeating
b1 = 226.7574;
b2 = 0;

alpha1 = 0; %P1 
beta1 = 0;  %P2
gamma1 = 1; %Pts Turboshaft operating at rated power
delta1 = 0; %Prc

alpha2 = 0;
beta2 = 0;
gamma2 = 0;
delta2 = 1; % no recharge

N_ba = 4;
N_tg = 2;  

eta_m = 0.9;
eta_ba = 0.97;
eta_gb = 0.98;
eta_gen = 0.9;

S = zeros(17,17);
S(1:9,1:9) = eye(9,9);
S(10,1:9) = ones(1,9);
S(10,12:13) = -eta_m.*[1 1];
S(11,10:12) = [N_ba 0 -1];
S(12,10:17) = [N_ba/eta_ba 1 0 0 0 0 0 -eta_ba];
S(13,14:15) = [eta_gb -1];
S(14,15:16) = [eta_gen -1];
S(15,16:17) = [N_tg -1];
S(15,13) = -1;
S(16,12:17) = [alpha1 beta1 gamma1 0 0 delta1];
S(17,12:17) = [alpha2 beta2 gamma2 0 0 delta2];

%vector
     %Plp1-8, Pcp
Pp = [75,75,75,75,75,75,75,75,0]; % lift prop75, cp 0
    %b1,b2
b = [b1,b2];
BHE = [Pp,zeros(1,6),b]';


Constraint(4,:) = (S\BHE)'



%% constraint 5
b1 = 226.7574;
b2 = 0;

alpha1 = 0; %P1 
beta1 = 0;  %P2
gamma1 = 1; %Pts Turboshaft operating at rated power
delta1 = 0; %Prc

alpha2 = 0;
beta2 = 0;
gamma2 = 0;
delta2 = 1; % no recharge

N_ba = 4;
N_tg = 1; % one turbo failed

eta_m = 0.9;
eta_ba = 0.97;
eta_gb = 0.98;
eta_gen = 0.9;

S = zeros(17,17);
S(1:9,1:9) = eye(9,9);
S(10,1:9) = ones(1,9);
S(10,12:13) = -eta_m.*[1 1];
S(11,10:12) = [N_ba 0 -1];
S(12,10:17) = [N_ba/eta_ba 1 0 0 0 0 0 -eta_ba];
S(13,14:15) = [eta_gb -1];
S(14,15:16) = [eta_gen -1];
S(15,16:17) = [N_tg -1];
S(15,13) = -1;
S(16,12:17) = [alpha1 beta1 gamma1 0 0 delta1];
S(17,12:17) = [alpha2 beta2 gamma2 0 0 delta2];

%vector
     %Plp1-8, Pcp
Pp = [75,75,75,75,75,75,75,75,0];
    %b1,b2
b = [b1,b2];
BHE = [Pp,zeros(1,6),b]';


Constraint(5,:) = (S\BHE)'


%% constraint 6
b1 = 226.7574;
b2 = 0;

alpha1 = 0; %P1
beta1 = 0;  %P2
gamma1 = 1; %Pts turboshafts operate nominally
delta1 = 0; %Prc

alpha2 = 0;
beta2 = 0;
gamma2 = 0;
delta2 = 1; % rate of charge is equal to zero

N_ba = 3; % one battery failed
N_tg = 2;

eta_m = 0.9;
eta_ba = 0.97;
eta_gb = 0.98;
eta_gen = 0.9;

S = zeros(17,17);
S(1:9,1:9) = eye(9,9);
S(10,1:9) = ones(1,9);
S(10,12:13) = -eta_m.*[1 1];
S(11,10:12) = [N_ba 0 -1];
S(12,10:17) = [N_ba/eta_ba 1 0 0 0 0 0 -eta_ba];
S(13,14:15) = [eta_gb -1];
S(14,15:16) = [eta_gen -1];
S(15,16:17) = [N_tg -1];
S(15,13) = -1;
S(16,12:17) = [alpha1 beta1 gamma1 0 0 delta1];
S(17,12:17) = [alpha2 beta2 gamma2 0 0 delta2];

%vector
     %Plp1-8, Pcp
Pp = [75,75,75,75,75,75,75,75,0]; % cruise prop off, hover prop 75
    %b1,b2
b = [b1,b2];
BHE = [Pp,zeros(1,6),b]';

Constraint(6,:) = (S\BHE)'

%% constraint 7
b1 = 226.7574;
b2 = 0;

alpha1 = 0; %P1
beta1 = 0;  %P2
gamma1 = 1; %Pts
delta1 = 0; %Prc

alpha2 = 0;
beta2 = 0;
gamma2 = 0;
delta2 = 1;

N_ba = 4;
N_tg = 2;

eta_m = 0.9;
eta_ba = 0.97;
eta_gb = 0.98;
eta_gen = 0.9;

S = zeros(17,17);
S(1:9,1:9) = eye(9,9);
S(10,1:9) = ones(1,9);
S(10,12:13) = -eta_m.*[1 1];
S(11,10:12) = [N_ba 0 -1];
S(12,10:17) = [N_ba/eta_ba 1 0 0 0 0 0 -eta_ba];
S(13,14:15) = [eta_gb -1];
S(14,15:16) = [eta_gen -1];
S(15,16:17) = [N_tg -1];
S(15,13) = -1;
S(16,12:17) = [alpha1 beta1 gamma1 0 0 delta1];
S(17,12:17) = [alpha2 beta2 gamma2 0 0 delta2];

%vector
     %Plp1-8, Pcp
Pp = [0,133,133,133,133,133,133,0,0];
    %b1,b2
b = [b1,b2];
BHE = [Pp,zeros(1,6),b]';

Constraint(7,:) = (S\BHE)'