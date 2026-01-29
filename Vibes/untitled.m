clc; clear; close all

dt = 0.01;

t = 0:dt:2;

x0 = 1;



x(1) = x0;
x1(1) = x0;

for i = 1:length(t)



x(i+1) = x(i) + dt*(-x(i));


end


plot(t,x(1:end-1),DisplayName="third order")
hold on
plot(t,exp(-t),DisplayName="func")


prob = ode;
prob.ODEFcn = @(x,t) -1*x;
prob.InitialValue = 1;

sol = solve(prob,0,2);

plot(sol.Time,sol.Solution,DisplayName="ode45")


legend