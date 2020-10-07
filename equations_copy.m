
function [s_n, i_n, r_n, infected] = equations_copy(s, i, r, beta, r_time, s_time, infected_list, week)
% fcn_step Advance an SIR model one timestep
%
% Usage
%   [s_n, i_n, r_n] = fcn_step(s, i, r, beta, gamma)
% 
% Arguments
%   s = current number of susceptible individuals
%   i = current number of infected individuals
%   r = current number of recovered individuals
%   r_time = time it takes to recover
%   
% 
% Returns
%   s_n = next number of susceptible individuals
%   i_n = next number of infected individuals
%   r_n = next number of recovered individuals

%   infected r_time ago (number of people who will recover this week)
if (week > r_time)
    recovered = infected_list(1,(week - r_time));
else
    recovered = 0;
end
%   infected r_time + s_time ago (number of people who will become
%   resusceptible this week)
if (week > r_time + s_time)
    resusceptible = infected_list(1,(week - r_time - s_time));
else
    resusceptible = 0;
end

% compute new infections
infected = (beta * i * s);


% Enforce invariants
total = s + i + r;
infected = min(s, infected); % Cannot infect more people than current s
infected = min(total - i, infected); % Cannot infect more than total
recovered = min(i, recovered); % Cannot recover more people than current i
recovered = min(total - r, recovered); % Cannot recover more than total

% Update state
s_n = s - infected + resusceptible;
i_n = i + infected - recovered;
r_n = r + recovered - resusceptible;


   



% This way of enforcing invariants does not actually conserve persons!
%s_n = max(s_n, 0);
%i_n = max(i_n, 0);
%r_n = max(r_n, 0);
    
end