# Loading packages ----
library(tidyverse)

# Importing the file with the data ----
mean_sft <- rio::import('Data_preproc/mean_sft.csv')

# Creating the plot ----
safety <- ggplot(mean_sft, aes(x = trstplc, y = safty_mean)) + 
  geom_point() +
  geom_smooth(method = "lm", col = "blue") +
  ylab("Feeling of safety") +
  xlab("Trust in police") +
  ggtitle("Relationship between people's\ntrust in police and them feeling safe\nalone outside at night") +
  theme_grey()

# Exporting the png file ----
ggsave('safety.png', device = 'png', plot = safety, width = 8, height = 4)
