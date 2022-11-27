ggplot(mean_sft, aes(x = trstplc, y = safty_mean)) + 
  geom_point() +
  geom_smooth(method = "lm", col = "blue") +
  ylab("Feeling of safety") +
  xlab("Trust in police") +
  theme_grey()