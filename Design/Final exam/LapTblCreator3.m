clc
clear



npts = 89;



Tbl.INDEX = (1:1:npts)';                    % point index
Tbl.SEG = repmat({' '},[npts,1]);           % segment name
Tbl.dt = zeros(npts,1);                     % time increment [sec]
Tbl.t = zeros(npts,1);                      % total time from start [sec]
Tbl.dx = zeros(npts,1);                     % distance increment [m]
Tbl.x = zeros(npts,1);                      % total distance from start [m]
Tbl.h = zeros(npts,1);                      % altitude [m]
Tbl.dhdt = zeros(npts,1);                   % climb rate [m/s]
Tbl.FPA = zeros(npts,1);                    % flightpath angle [deg]
Tbl.V = zeros(npts,1);                      % airspeed [m/s]
Tbl.dVdt = zeros(npts,1);                   % acceleration [m/s/s]
Tbl.HDG = zeros(npts,1);                    % heading [deg]
Tbl.dHDG = zeros(npts,1);                   % heading increment [deg]
Tbl.PHI = zeros(npts,1);                    % bank angle [deg]
Tbl.PSIDOT = zeros(npts,1);                 % turn rate [deg/s]
Tbl.R = zeros(npts,1);                      % turn radius [m], positive for right turn
Tbl.n = zeros(npts,1);                      % load factor
Tbl.CL = zeros(npts,1);                     % lift coefficient
Tbl.P = zeros(npts,1);                      % motor shaft-power output [W]
Tbl.BATT = zeros(npts,1);                   % battery state-of-charge [full = 100%]




AC.m = 8;
AC.CD0 = 0.025;
AC.K1 = 0;
AC.K2 = 0.05;
AC.CDR = 0;
AC.S = 0.6;
AC.Fmax = 0;
AC.eta_p = 0.7;

rho = 1.225;


Tbl = struct2table(Tbl);



% start point
Tbl.SEG(1) = {'START'};
Tbl.V(1) = 20; % velocity
Tbl.h(1) = 50; % alt
Tbl.R(1) = inf; % turn radius
Tbl.BATT(1) = 95; %batt percentage
Tbl.HDG(1) = 360; % heading
Tbl.dx(1) = 15; % distance increment
Tbl.n(1) = 1; % load factor

% segment S1
ns1 = 2:11;
Tbl.SEG(ns1) = {'S1'};
Tbl.dx(ns1) = 15;
Tbl.h(ns1) = 50;
Tbl.R(ns1) = inf;


% segment C1
nc1 = 12:12+12-1;
Tbl.SEG(nc1) = {'C1'};
Tbl.h(nc1) = 50;
Tbl.dHDG(nc1) = 15;

% segment S2
ns2 = nc1(end)+1:nc1(end)+10;
Tbl.SEG(ns2) = {'S2'};
Tbl.dx(ns2) = 15;
Tbl.h(ns2) = 50;
Tbl.R(ns2) = inf;



% segment C2
nc2 = ns2(end)+1:ns2(end)+24;
Tbl.SEG(nc2) = {'C2'};
Tbl.h(nc2) = 50;
Tbl.dHDG(nc2) = -15;


% segment S3
ns3 = nc2(end)+1:nc2(end)+10;
Tbl.SEG(ns3) = {'S3'};
Tbl.dx(ns3) = 15;
Tbl.h(ns3) = 50;
Tbl.R(ns3) = inf;


% segment C3
nc3 = ns3(end)+1:ns3(end)+12;
Tbl.SEG(nc3) = {'C3'};
Tbl.h(nc3) = 50;
Tbl.dHDG(nc3) = 15;

% segment S4
ns4 = nc3(end)+1:nc3(end)+10;
Tbl.SEG(ns4) = {'S4'};
Tbl.dx(ns4) = 15;
Tbl.h(ns4) = 50;
Tbl.R(ns4) = inf;

% finish
Tbl.SEG(ns4(end)) = {'FINISH'};


Tbl.HDG(2:end) = Tbl.HDG(1)+cumsum(Tbl.dHDG(2:end));
% Tbl.HDG(Tbl.HDG<0) = Tbl.HDG(Tbl.HDG<0) + 360;
Tbl.HDG(Tbl.HDG>360) = Tbl.HDG(Tbl.HDG>360) - 360;

