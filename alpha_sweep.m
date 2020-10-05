function alpha_sweep(s_0, i_0, r_0, beta, gamma, alpha, num_week)
%
% Usage
%   alpha_sweep(s_0, i_0, r_0, beta, gamma, alpha, num_week)
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
%   Plots the infections per week based each iteration of alpha
clf
hold on;
alpha_range=0:.1:1;

for alpha = alpha_range
   [S, I, R, W, w] = simulation(s_0, i_0, r_0, beta, gamma, alpha, num_week);
    plot(W, I);
end


xlabel("Week")
ylabel("Infected Persons")


title(['beta = ', num2str(beta),' gamma = ', num2str(gamma)])

lgd = legend(string(alpha_range));
lgd.Title.String = 'alpha';
lgd.Location = 'northeast';

