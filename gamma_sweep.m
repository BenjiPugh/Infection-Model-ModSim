function gamma_sweep(s_0, i_0, r_0, beta, gamma, alpha, num_week)

clf
hold on;
gamma_range=0:.1:1;

for gamma = gamma_range
   [S, I, R, W, w] = simulation(s_0, i_0, r_0, beta, gamma, alpha, num_week);
    plot(W, I);
end


xlabel("Week")
ylabel("Infected Persons")


title(['beta = ', num2str(beta),' alpha = ', num2str(alpha)])

lgd = legend(string(gamma_range));
lgd.Title.String = 'gamma';
lgd.Location = 'northeast';
