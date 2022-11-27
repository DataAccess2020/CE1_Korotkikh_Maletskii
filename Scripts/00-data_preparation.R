# Loading packages ----
library(tidyverse)

# Importing the data and removing the NAs ----
ess <- rio::import('Data_orig/ESS10.dta')
ess[ess == '77'] <- NA
ess[ess == '88'] <- NA
ess[ess == '99'] <- NA

# Selecting the variables needed and removing the NAs ----
pol_safe <- ess %>% select(trstplc, aesfdrk)
pol_safe <- na.omit(pol_safe)
pol_safe <- pol_safe %>% mutate(aesfdrk = replace(aesfdrk, aesfdrk %in% c(7, 8, 9), NA))
pol_safe <- na.omit(pol_safe)

# Creating the CSV file with the new data ----
rio::export(pol_safe, file = 'pol_safe', format = 'csv')