library (ggplot2)
library (dplyr)

mpg <- data.frame(ggplot2::mpg)

temp <- mpg %>% filter(mpg$displ < 4)
temp2 <- mpg %>% filter(mpg$displ > 5)
mean(temp$hwy)
mean(temp2$hwy)

mean( (mpg %>% filter(mpg$manufacturer == "audi"))$cty )
mean( (mpg %>% filter(mpg$manufacturer == "toyota")) $ cty )

temp <- mpg %>% 
  filter(mpg$manufacturer %in% c("chevrolet", "ford", "honda"))

mean(temp$hwy)

temp1 <- mpg %>% select(class, cty)
mean ( (temp1 %>% filter(temp1$class == "suv"))$cty )
mean ( (temp1 %>% filter(temp1$class == "compact")) $cty)

mpgAu <- 
  mpg %>% 
  filter(manufacturer == "audi")
head(mpgAu %>% arrange(desc(hwy)), 5)

mpgtemp2 <- mpg
mpgtemp2 <- 
  mpgtemp2 %>% 
  mutate(total_fuel = cty + hwy)
mpgtemp2 <- 
  mpgtemp2 %>% 
  mutate(avg_fuel = total_fuel / 2)

mpgtemp2 %>% 
  arrange(desc(avg_fuel)) %>% 
  head(3)

mpg %>% 
  mutate(total = cty + hwy) %>% 
  mutate(avg = total / 2) %>% 
  arrange(desc(avg)) %>%
  head(3)


## 05번

temp <- mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))

mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))

## RERERERE
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(hwyAVG = mean(hwy)) %>% 
  arrange(desc(hwyAVG)) %>% 
  head(3)

## RERERERE
mpg %>% 
  filter(class == "compact") %>% 
  group_by(manufacturer) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))


# DataRE
fuel <- data.frame(fl = c("c", "d", "e", "p", "r"), 
                   name = c("CNG", "disel", "E75", "per", "reg"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22))

mpg_fl <- left_join(mpg, fuel, by = "fl")

mpg_fl %>% 
  select(model, fl, price_fl) %>% 
  head(5)


# 산점도, 그래프, 
ggplot(data = mpg, aes(x = cty, y = hwy)) + 
  geom_point()

midwest <- data.frame(ggplot2::midwest)
ggplot(data = midwest, aes(x=poptotal, y=popasian)) +
  geom_point() +
  xlim(0, 500000) +
  ylim(0, 10000)


temtem <- mpg %>% 
  filter(class == "suv") %>% 
  group_by(manufacturer) %>% 
  summarise(avgcty = mean(cty)) %>% 
  arrange(desc(avgcty))

ggplot(data = temtem, aes(x = reorder(manufacturer,-avgcty), y= avgcty)) +
  geom_col()

ggplot(data = mpg, aes(x = class)) + 
  geom_bar()


ggplot(data=economics, aes(x = date, y  = unemploy)) +
  geom_line()

mpg1 <- mpg  %>% 
  filter(class %in% c("compact", "subcompact", "suv"))
  
ggplot(data = mpg1, aes(x = class, y = cty)) +
  geom_boxplot()


#결측치 대체
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hwy"] <- NA

#Q1
table(is.na(mpg$drv))
table(is.na(mpg$hwy))
#Q2
mpg %>% filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))
  
