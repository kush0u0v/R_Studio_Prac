library(ggplot2)
library(dplyr)

mpg <- data.frame(ggplot2::mpg)

# Q1
fuel <- data.frame(fl = c("c","d","e","p","r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22))

# Q2
mpg_fl <- left_join(mpg, fuel, by = "fl")


# Q3
mpg_fl %>% 
  select(model, fl, price_fl) %>% 
  head(5)

