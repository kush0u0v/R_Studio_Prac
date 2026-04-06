library(dplyr)
library(ggplot2)
library(readxl) # xlsx, csv 파일 불러오기

mpg <- as.data.frame(ggplot2::mpg)

head(mpg, 5)
summary(mpg)
tail(mpg, 2)

# 통합 연비변수 make ===========================
mpg$total <- (mpg$hwy + mpg$cty) / 2
hist(mpg$total) # histogram 

# 20 over pass, 20 non over fail (ifelse) ===========================
mpg$test <- ifelse(mpg$total > 20, "pass", "fail")
head (mpg, 20) # 확인

# make table ===========================
table(mpg$test)

# make chart (x) ===========================
qplot(mpg$test)

# 중첩 조건문 (30 이상 A, 20 이상 B, other C), 집합 
mpg$grade <- 
  ifelse(mpg$total >= 
           30, "A", 
         ifelse (mpg$total >= 20, "B", "C")
        )
table (mpg$grade)

# 




