function [I,W,w] = alpha_sweep(s_0, i_0, r_0, beta, gamma, alpha, num_week)

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

