function [dhdt, dvdt, n, CL, R, psidot] = CalcAircraftPerf(V,P,FPA,phi,rho,AC)
%CALCAIRCRAFTPERF Summary of this function goes here
%   Detailed explanation goes here


m = AC.m;
CD0 = AC.CD0;
K1 = AC.K1;
K2 = AC.K2;
CDR = AC.CDR;
S = AC.S;
Fmax = AC.Fmax;
eta_p = AC.eta_p;

W = m*g;

CL = m*g/(0.5*rho*V^2*S);
D = CD0 + K1*CL + K2*CL^2;

T = P*eta_p/V;

dhdt = L - W*cosd(FPA);
dvdt = T - D - W*sind(FPA);







outputArg1 = inputArg1;
outputArg2 = inputArg2;
end