# Loading packages ----
library(tidyverse)

# Importing the file with the data ----
pol_safe <- rio::import('Data_preproc/pol_safe.csv')

# Counting the means for each value of trstplc ----
mean_sft = pol_safe %>% 
  group_by(trstplc) %>%
  summarize(
    safty_mean = mean(aesfdrk, na.rm=T)
  )
mean_sft

# Creating the CSV file with the means ----
rio::export(mean_sft, file = 'mean_sft.csv', format = 'csv')
