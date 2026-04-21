% Test 2
% Kasmiersky
% Prof. Chakraborty, Aero 4720
%--------------------------------------------------------------------------
clc; clear; close all

%% Case 1 - full fuel & bomb loaded

% assume symmetry

% note, i guessed n_x is load factor 8 g, and i applied it to the rest of the masses.
% i applied 8 g to all the masses to make them shear forces

y = 0:0.5:10;

Lconst = 8.*9.81.*(23000./(10.*pi))./1000; % 1000 because KN

Mconst = -8.*1200./(60.*1000); % again, 1000 for KN

Fconst = -3000.*8./1000;

bomb = -2000.*8./1000;

V = zeros(1,length(y)); 


for i = length(y):-1:1

    if y(i) > 6

        L(i) = Lconst.*sqrt(1-(y(i)./10).^2); %KN/m
        W(i) = Mconst.*(8-0.4.*y(i)); %KN/m
        

        V(i) = L(i)+W(i);
        M(i) = trapz(y,V);

    elseif y(i) > 3.5

        L(i) = Lconst.*sqrt(1-(y(i)./10).^2); %KN
        W(i) = Mconst.*(8-0.4.*y(i));
        

        V(i) = L(i)+W(i)+bomb;
        M(i) = trapz(y,V);

    else
        L(i) = Lconst.*sqrt(1-(y(i)./10).^2); %KN
        W(i) = Mconst.*(8-0.4.*y(i));
        
        fuel(i) = Fconst.*(1 - y(i)./4);
        
        V(i) = L(i)+W(i)+fuel(i)+bomb;
        M(i) = trapz(y,V);
    end
    

end
figure
hold on


subplot(1,2,1)
hold on
plot(y,V,DisplayName="Shear Force")
plot(y,M,DisplayName="Moment")
xlabel("span (meters)")
ylabel("KiloNewtons or Kilonewton-meters")
title("bombs/fuel")
legend

V1 = V;
M1 = M;

%% case 2 - 

y = 0:0.5:10;

Lconst = 9.81.*(23000./(10.*pi))./1000; % 1000 because KN

Mconst = -9.8.*1200./(60.*1000); % again, 1000 for KN

Fconst = 0;

bomb = 0;

V = zeros(1,length(y)); 


for i = length(y):-1:1

    if y(i) > 6

        L(i) = Lconst.*sqrt(1-(y(i)./10).^2); %KN/m
        W(i) = Mconst.*(8-0.4.*y(i)); %KN/m
        

        V(i) = L(i)+W(i);
        M(i) = trapz(y,V);

    elseif y(i) > 3.5

        L(i) = Lconst.*sqrt(1-(y(i)./10).^2); %KN
        W(i) = Mconst.*(8-0.4.*y(i));
        

        V(i) = L(i)+W(i)+bomb;
        M(i) = trapz(y,V);

    else
        L(i) = Lconst.*sqrt(1-(y(i)./10).^2); %KN
        W(i) = Mconst.*(8-0.4.*y(i));
        
        fuel(i) = Fconst.*(1 - y(i)./4);
        
        V(i) = L(i)+W(i)+fuel(i)+bomb;
        M(i) = trapz(y,V);
    end
    

end

subplot(1,2,2)
hold on
plot(y,V,DisplayName="Shear Force")
plot(y,M,DisplayName="Moment")
xlabel("span (meters)")
ylabel("KiloNewtons or Kilonewton-meters")
title("no bombs/fuel")
legend

V2 = V;
M2 = M;

Results = table(y',V1',M1',V2',M2','VariableNames',{'SpanwiseLocation','Case1V','Case1M','Case2V','Case2M'})
