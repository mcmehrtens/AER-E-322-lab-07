% Lab 7 Prelab Calculations
% AER E 322 Spring 2023
% Matthew Mehrtens
clear,close all;

% Constants
config          = 5;        % []

E_steel         = 29000e3;  % [psi]
sigma_Y_steel   = 35e3;     % [psi]
E_al            = 10000e3;  % [psi]
sigma_Y_al      = 40e4;     % [psi]

B               = 1;        % [in]
H               = 0.25;     % [in]
D               = 1 / 4;    % [in]
R               = D / 2;    % [in]
L_eff           = 0.7*27.5; % [in]

% Set constants
steel = true; % Set this to true for steel; false for aluminum
if steel
    E = E_steel;
    sigma_Y = sigma_Y_steel;
else
    E = E_al;
    sigma_Y = sigma_Y_al;
end

% Calculate Beam
calc_beam = false; % Set this to true for a beam; false for a rod
if calc_beam
    A = B * H; % [in^2]
    P_cr = pi^2 * E * B * H^3 / (12 * L_eff^2); % [lbf]
    slenderness_ratio = 2 * L_eff * sqrt(3 * A / (B * H^3)); % []
else
    A = pi * R^2; % [in^2]
    P_cr = pi^3 * E * R^4 / (4 * L_eff^2); % [lbf]
    slenderness_ratio = 2 * L_eff / R^2 * sqrt(A / pi); % []
end

fprintf("========== Configuration %d ==========\n" + ...
    "P_cr   = %8g [lbf]\n" + ...
    "L/rho  = %8g []\n", [config, P_cr, slenderness_ratio]);