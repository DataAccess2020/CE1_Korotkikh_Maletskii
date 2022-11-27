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

# Changing the numbers in a variable so that the higher the number the bigger feeling of safety ----
pol_safe <- pol_safe %>% mutate(aesfdrk = replace(aesfdrk, aesfdrk %in% c(1), 5))
pol_safe <- pol_safe %>% mutate(aesfdrk = replace(aesfdrk, aesfdrk %in% c(2), 6))
pol_safe <- pol_safe %>% mutate(aesfdrk = replace(aesfdrk, aesfdrk %in% c(3), 7))
pol_safe <- pol_safe %>% mutate(aesfdrk = replace(aesfdrk, aesfdrk %in% c(4), 8))

pol_safe <- pol_safe %>% mutate(aesfdrk = replace(aesfdrk, aesfdrk %in% c(5), 4))
pol_safe <- pol_safe %>% mutate(aesfdrk = replace(aesfdrk, aesfdrk %in% c(6), 3))
pol_safe <- pol_safe %>% mutate(aesfdrk = replace(aesfdrk, aesfdrk %in% c(7), 2))
pol_safe <- pol_safe %>% mutate(aesfdrk = replace(aesfdrk, aesfdrk %in% c(8), 1))

# Creating the CSV file with the new data ----
rio::export(pol_safe, here::here("Data_preproc", 'pol_safe.csv'))
