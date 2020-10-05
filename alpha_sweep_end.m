function alpha_sweep_end(s_0, i_0, r_0, beta, gamma, alpha, num_week)

alpha_range = 0.05:0.05:0.25;
end_list = [];

for beta = alpha_range
   [S, I, R, W, w] = simulation(s_0, i_0, r_0, beta, gamma, alpha, num_week);
   end_list = [end_list w];
end

clf
hold on
plot(alpha_range, end_list);
xlabel("Resusceptible Rate")
ylabel("Weeks Until Outbreak End")
hold off
[alpha_range; end_list]
end
