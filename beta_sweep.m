function beta_sweep(s_0, i_0, r_0, beta, gamma, alpha, num_week)

clf
hold on;
beta_range=0:.1:1;

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



