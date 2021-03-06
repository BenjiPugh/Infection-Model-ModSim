function [S, I, R, W, w] = simulation(s_0, i_0, r_0, beta, gamma, alpha, num_steps)
% Simulate a SIR model
%
% Usage
%   [S, I, R, W] = simulation(s_0, i_0, r_0, beta, gamma, num_steps)
%
% Arguments
%   s_0 = initial number of susceptible individuals
%   i_0 = initial number of infected individuals
%   r_0 = initial number of recovered individuals
%
%   beta = infection rate parameter
%   gamma = recovery rate paramter
%   alpha = resusceptible rate parameter
%
%   num_steps = number of simulation steps to simulate
%
% Returns
%   S = simulation history of susceptible individuals; vector
%   I = simulation history of infected individuals; vector
%   R = simulation history of recovered individuals; vector
%   W = simulation week; vector
%   w = week ending wave one, result of calling end_check

% Setup
S = zeros(1, num_steps);
I = zeros(1, num_steps);
R = zeros(1, num_steps);
W = 1 : num_steps;
s = s_0;
i = i_0;
r = r_0;

% Store initial values
S(1) = s;
I(1) = i;
R(1) = r;


% Run simulation
for step = 2 : num_steps
    [s, i, r] = week_update(s, i, r, beta, gamma, alpha);
    S(step) = s;
    I(step) = i;
    R(step) = r;
end


%Calculate the end of wave 1
[w] = end_check(I);


end