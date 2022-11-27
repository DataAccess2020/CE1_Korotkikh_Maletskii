# Loading packages ----
library(tidyverse)

# Importing the file with the data ----
mean_sft <- rio::import('Data_preproc/mean_sft.csv')

# Creating the plot ----
safety <- ggplot(mean_sft, aes(x = trstplc, y = safty_mean)) + 
  geom_point() +
  geom_smooth(method = "lm", col = "blue") +
  scale_x_continuous(breaks = unique(mean_sft$trstplc))+
  ylab("Feeling of safety") +
  xlab("Trust in police") +
  ggtitle("Linear regression model of the relationship between people's trust in police and \ntheir feeling of safety walking alone outside at night") +
  theme_grey()+
  theme(
    plot.title.position = 'plot',
    plot.title = element_text(size=14, face = "bold", hjust = 0.5),
    axis.title.x = element_text(size=12, face="bold"),
    axis.title.y = element_text(size=12, face="bold"))
safety

# Exporting the png file ----
ggsave('safety.png', device = 'png', path = "Figures", width = 1920/120, height = 1080/120, dpi = 300)
