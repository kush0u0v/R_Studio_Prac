library(ggplot2)
library(dplyr)

mpg <- data.frame(ggplot2::mpg)

# ======================
# 1. 변수간 괸계를 표현하는 산점도 (Scatter Plot)

# 1st layer 
ggplot(data=mpg, aes(x=displ, y = hwy))

# 2nd layer (그래프 선택)
ggplot(data=mpg, aes(x=displ, y = hwy)) +
  geom_point()

# 3rd layer (꾸미기) 
ggplot(data=mpg, aes(x=displ, y = hwy)) +
  geom_point() +
  xlim(3,6)

# Q1
ggplot(data = mpg, aes(x=cty, y=hwy)) + geom_point()

# Q2
midwest = data.frame(ggplot2::midwest)
ggplot(data = midwest, aes(x=poptotal, y=popasian)) + 
  geom_point() + xlim(0, 500000) + ylim(0, 10000)

# ====================================
# 2. 집단간 차이 표현 막대 그래프

# 2.1. 집단별 평균 표 만들기
df_mpg <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))

ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) +
  geom_col()

ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) +
  geom_col()

# 2.2. 빈도 막대그래프
ggplot(data = mpg, aes(x = hwy)) +
  geom_bar()

ggplot(data = mpg, aes(x = drv)) +
  geom_bar()


# Q1 
ma_mpg <- mpg %>% 
  filter(class == "suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty)) %>% 
  head(5)

ggplot(data = ma_mpg, aes(x = reorder(manufacturer, -mean_cty), y = mean_cty)) + 
  geom_col()


# Q2
ggplot(data = mpg, aes(x = class)) + geom_bar()


#==============================
# Line Graph, 시간에 따라 달라지는 데이터 표현 
ggplot(data = economics, aes(x = date, y = unemploy)) + 
  geom_line()


# Q1
ggplot(data = economics, aes(x = date, y = psavert)) + 
  geom_line()

#==============================
# Box Plot, 
ggplot(data = mpg, aes(x = drv, y = hwy)) +
  geom_boxplot()

# Q1
mpg1 <- mpg %>% filter(class == c("compact", "subcompact", "suv"))

ggplot(data = mpg1, aes(x = class, y = cty)) + 
  geom_boxplot()
