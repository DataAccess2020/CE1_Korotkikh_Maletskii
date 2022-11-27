library(tidyverse)
bar_chart = ggplot(mean_sft, aes(x = trstplc, y = safty_mean)) +
  geom_col(alpha = 0.2, col = "black", fill = "blue") +
  scale_x_continuous(breaks = unique(mean_sft$trstplc))+
  ylab("Feeling of safety") +
  xlab("Trust in police") +
  ggtitle("Relationship between people's trust in police and their feeling of safety walking alone outside at night")+
  theme_bw()+ 
  theme(
    plot.title.position = 'plot',
    plot.title = element_text(size=22, face = "bold", hjust = 0.5),
    axis.title.x = element_text(size=16, face="bold"),
    axis.title.y = element_text(size=16, face="bold"))
bar_chart
ggsave('bar_chart.png', path = "Figures", width = 1920/120, height = 1080/120, dpi = 300)
