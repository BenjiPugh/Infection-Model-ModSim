function beta_sweep_end(s_0, i_0, r_0, beta, gamma, alpha, num_week)

beta_range = 0.005:0.005:0.125;
end_list = [];

for beta = beta_range
   [S, I, R, W, w] = simulation(s_0, i_0, r_0, beta, gamma, alpha, num_week);
   end_list = [end_list w];
end

clf
hold on
plot(beta_range, end_list);
xlabel("Infection Rate")
ylabel("Weeks Until Outbreak End")
title(['alpha = ', num2str(alpha),' gamma = ', num2str(gamma)])
hold off
[beta_range; end_list]
end
