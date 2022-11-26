mean_sft = pol_safe %>% 
  group_by(trstplc) %>%
  summarize(
    safty_mean = mean(aesfdrk, na.rm=T)
  )
mean_sft