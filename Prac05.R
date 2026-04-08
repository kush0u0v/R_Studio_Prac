library(ggplot2)
library(dplyr)

# 결측치 이상치
mpg <- data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hwy"] <- NA

# Q1
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

# Q2
mean(mpg$hwy, na.rm = T)

mpg %>% 
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))
