function [S, I, R, W] = simulation(s_0, i_0, r_0, beta, num_week, r_time, s_time)
% fcn_simulate Simulate a SIR model
%
% Usage
%   [S, I, R, W] = fcn_simulate(s_0, i_0, r_0, beta, gamma, num_steps)
%
% Arguments
%   s_0 = initial number of susceptible individuals
%   i_0 = initial number of infected individuals
%   r_0 = initial number of recovered individuals
%
%   beta = infection rate parameter
%   gamma = recovery rate paramter
%
%   num_steps = number of simulation steps to simulate
%
% Returns
%   S = simulation history of susceptible individuals; vector
%   I = simulation history of infected individuals; vector
%   R = simulation history of recovered individuals; vector
%   W = simulation week; vector

% Setup
S = zeros(1, num_week);
I = zeros(1, num_week);
R = zeros(1, num_week);
W = 1 : num_week;

s = s_0;
i = i_0;
r = r_0;

infected_list = zeros(1, num_week);

% Store initial values
S(1) = s;
I(1) = i;
R(1) = r;
infected_list(1) = i;

% Run simulation
for week = 2 : num_week
    [s, i, r, infected] = equations_copy(s, i, r, beta, r_time, s_time, infected_list, week);
    S(week) = s;
    I(week) = i;
    R(week) = r;
    infected_list(week) = infected;
end
infected_list
end
