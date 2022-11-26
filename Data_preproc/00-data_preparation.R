library(tidyverse)
ess <- rio::import('ESS10.dta')
new <- ess %>% sample_n(., 1000)
lm(aesfdrk ~ trstplc, data = new)
new <- new %>% mutate(
  police = ifelse(trstplc %in% c(77, 88, 99), NA, trstplc)
)
unique(new$trstplc)
new[, 'trstplc' %in% c(77, 88, 99)] <- NA
