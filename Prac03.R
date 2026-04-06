library(ggplot2)
library(dplyr)

mpg <- data.frame(ggplot2::mpg)

mpg %>%
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% head(10)
  
# Q1
temp <- mpg %>%
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))

# Q2
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))

# Q3
mpg %>%
  group_by(manufacturer) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)

# Q4 <- 복습하기
mpg %>%
  filter(class == "compact") %>% 
  group_by(manufacturer) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))


  
