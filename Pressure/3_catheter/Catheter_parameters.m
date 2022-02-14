%% catheter characteristics
l = 0.5; %length in meter
eta = 0.678; % Dyn. Viscosity [mPa*s] 
r = 0.001; %inner radius of the catheter in meter
rho = 1; % density of water [g/(cm^3)]

%% SI
rho = rho * 1000;

eta = eta / 1000;



%% 

Rc = (8 * eta * l) / (pi * r^4); % enter the formula for the Resistance
Lc = (rho * l) / (pi * r^2); % enter the formula for the Inertance
Ct = 1E-10; % enter the formula for the Compliance

f_n = 1 / (2 * pi * sqrt(Lc * Ct)); % enter the formula for the natural frequency
gamma = (Rc / 2) * sqrt(Ct / Lc); % enter the formula for the damping ratio
f_res = f_n * sqrt(1 - gamma^2); % enter the formula for the resonance frequency

