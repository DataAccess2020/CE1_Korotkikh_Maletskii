library(tidyverse)
ess <- rio::import('Data_orig/ESS10.dta')
new[new == '77'] <- NA
new[new == '88'] <- NA
new[new == '99'] <- NA
pol_safe <- new %>% select(trstplc, aesfdrk)
pol_safe <- na.omit(pol_safe)
pol_safe
