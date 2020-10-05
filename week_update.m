function [s_n, i_n, r_n] = week_update(s, i, r, beta, gamma, alpha)
% week_update Advance a SIR model one timestep
%
% Usage
%   [s_n, i_n, r_n] = week_update(s,i,r,beta,gamma,alpha)
% 
% Arguments
%   s = current number of susceptible individuals
%   i = current number of infected individuals
%   r = current number of recovered individuals
%   
%   beta = infection rate parameter
%   gamma = recovery rate paramter
%   alpha = resusceptibility rate parameter
% 
% Returns
%   s_n = next number of susceptible individuals
%   i_n = next number of infected individuals
%   r_n = next number of recovered individuals
%
% Preconditions
%   Must have variables  s,i,r,beta,gamma,alpha
%Postconditions
%   Result of week update stored in s_n, i_n, and r_n

% compute new infections, recoveries, and susceptibilities
infected = beta * i * s;
recovered = gamma * i;
resusceptible = alpha * r;
    
% Enforce invariants
total = s + i + r;
infected = min(s, infected); % Cannot infect more people than current s
infected = min(total - i, infected); % Cannot infect more than total
recovered = min(i, recovered); % Cannot recover more people than current i
recovered = min(total - r, recovered); % Cannot recover more than total

% Update state
s_n = s - infected + resusceptible;
i_n = i + infected - recovered;
r_n = r + recovered- resusceptible;

    
end