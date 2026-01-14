% Kyle Kasmiersky
% Airplane design - Chakraborty
% design circular dependancy loop - 1/13/26
%--------------------------------------------------------------------------
clc; clear; close all

cruiseDP = 28; %crusie cynamic pressure
ultLF = 4.5; %ultimate load factor
TToCRatio = 0.12; % thicness to chord

wing.QCS = 0; % quarter chord sweep
wing.AR = 5; % aspect Ratio
wing.TaperRatio = 1;

Htail.QCS = 0;
Htail.AR = 3;
Htail.TaperRatio = 0.6;

Vtail.AR = 2;
Vtail.QCS = 15;
Vtail.TaperRatio = 0.5;

Wfuel = 300;
W_S = 14.7;
WPL = 500;
Htail.VC = 0.7; %volume coefficient
Vtail.VC = 0.04;
WnoseG = 30;
WmainG = 74;
Welse = 1300;

% needed for loop ------------------------------

Wwing = 0;
Whtail = 0;
Wvtail = 0;

Wsum = (Wfuel+WPL+WnoseG+WmainG+Welse+Wwing+Wvtail+Whtail);
Lfuse = 4.37*Wsum^0.23;

%preliminary guesses
xwing = 0.3*Lfuse;
xvtail = 0.8*Lfuse;
xhtail = 0.8*Lfuse;
xng = 1;
xmg = 0.7*Lfuse;
xcg = 0.5*Lfuse;
xcgold = 0;
exitflag = true;
%-- soln ------------------------------------------
i = 1;
while exitflag

    % find S by summing weights, and wing loading
Wsum = (Wfuel+WPL+WnoseG+WmainG+Welse+Wwing+Wvtail+Whtail);
Swing = Wsum/W_S;

Lfuse = 4.37*Wsum^0.23;

b = sqrt(wing.AR*Swing);

lam = wing.TaperRatio;

Cbar = (2/3)*(2*Swing/(b*(1+lam)))*((1+lam+lam^2)/(1+lam));

Shtail = Htail.VC*Cbar*Swing/(.60*Lfuse);

Svtail = Vtail.VC*b*Swing/(.60*Lfuse);


Wwing = 0.036*(Swing^0.758)*(wing.AR/(cosd(wing.QCS)^2))^0.6 ...
    *cruiseDP^0.006*wing.TaperRatio^0.04*(100*TToCRatio/cosd(wing.QCS))^-0.3...
    *(ultLF*Wfuel*0.55)^0.49;

Whtail = 0.016*(ultLF*Wfuel*0.55)^0.414*cruiseDP^0.168*Shtail^0.896...
    *(100*TToCRatio/cosd(wing.QCS))^-0.12*(wing.AR/cosd(Htail.QCS)^2)^0.043...
    *Htail.TaperRatio^-0.02;

Wvtail = 0.073*(ultLF*Wfuel*0.55)^0.376*cruiseDP^0.122*Svtail^0.873...
    *(100*TToCRatio/cosd(Vtail.QCS))^-0.49*(wing.AR/cosd(Vtail.QCS)^2)^0.357...
    *Vtail.TaperRatio;

Wsum = Welse + Wfuel + Whtail + WmainG + WnoseG + WPL + Wvtail + Wwing;

% undefined weights placed at wing's cg;
xcg = (Welse*xcg + Wfuel*xcg + Whtail*xhtail + WmainG*xmg + WnoseG*xng + WPL*xcg + Wvtail*xvtail + Wwing*xwing)/Wsum;

xwing = xcg-0.15*Cbar;

xmg = (100*xcg - 15)/85;

xhtail = xwing+.60*Lfuse;
xvtail = xwing+.60*Lfuse;

wingloc(i) = xwing;

CGloc(i) = xcg;

mgloc(i) = xmg;

if abs(xcgold-xcg) < 0.001
    exitflag = false;
end

xcgold = xcg;

i = i+1;
end

figure

plot(1:length(wingloc),wingloc,DisplayName="wing location (ft)")
hold on
plot(1:length(wingloc),mgloc,DisplayName="Main gear Location (ft)")
plot(1:length(wingloc),CGloc,DisplayName="CG location(ft)")
yline(xvtail,DisplayName="vert tail",Color="r")
yline(xhtail,DisplayName="htail",Color="g")
yline(xng,DisplayName="nose gear",Color="b")
legend
xlabel("iteration number")
ylabel("fueslage station")