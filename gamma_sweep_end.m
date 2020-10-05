function gamma_sweep_end(s_0, i_0, r_0, beta, gamma, alpha, num_week)

gamma_range = 0.1:0.1:0.5
end_list = [];

for gamma = gamma_range
   [S, I, R, W, w] = simulation(s_0, i_0, r_0, beta, gamma, alpha, num_week);
   end_list = [end_list w];
end

clf
hold on
plot(gamma_range, end_list);
xlabel("Recovery Rate")
ylabel("Weeks Until Outbreak End")
hold off
[gamma_range; end_list]
end
