function beta_sweep(s_0, i_0, r_0, beta, gamma, alpha, num_week)
%beta_sweep Advance a SIR model one timestep
%
% Usage
%   beta_sweep(s_0, i_0, r_0, beta, gamma, alpha, num_week)
% 
% Arguments
%   s_0 = initial number of susceptible individuals
%   i_0 = initial number of infected individuals
%   r_0 = initial number of recovered individuals
%   
%   beta = infection rate parameter
%   gamma = recovery rate paramter
%   alpha = resusceptibility rate parameter
%
%   num_week = what week it is numerically
%
% Preconditions
%   Must have variables  s_0,i_0,r_0,beta,gamma,alpha, num_week
%Postconditions
%   Plots the infections per week based each iteration of beta
clf
hold on;
beta_range=0.01:.01:.1;

for beta = beta_range
   [S, I, R, W, w] = simulation(s_0, i_0, r_0, beta, gamma, alpha, num_week);
    plot(W, I);
end


xlabel("Week")
ylabel("Infected Persons")


title(['alpha = ', num2str(alpha),' gamma = ', num2str(gamma)])

lgd = legend(string(beta_range));
lgd.Title.String = 'beta';
lgd.Location = 'northeast';



