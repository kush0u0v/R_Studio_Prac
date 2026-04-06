#install.packages("dplyr")
#install.packages("readxl")
library("dplyr")

a <- 1
b <- 2
c <- 3

d <- c(1,2,3,4,5,6)
da <- c(1:5)
db <- seq(1, 5)
dc <- seq(1, 10, by = 2) # 2씩 띄어서

a2 <- "hello"
b2 <- "world"

c2 <- c(a2, b2) # 문자열 베열

# 중간고사 전까지
# 1. dplyr 
# 2. ggplot2

#_______

history <- c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)

df_midterm <- data.frame(history, math)

class <- c(1,1,2,2)

df_midterm <- data.frame(history, math, class)
df_midterm

mean(df_midterm$history) # $ <- 불러오기
mean(df_midterm$math)

#------------- 2. 외부데이터 불러오기기

# install.packages("readxl")
library("readxl")

df_finalexam <- read_excel("xlsx_exam.xlsx", sheet = 1, col_names = T)
# sheet = , col_names = 
df_finalexam
mean(df_finalexam$english)

exam <- read.csv("csv_exam.csv", header = T)
exam

#--------------- 3. 데이터 특성 파악
head(exam) # head() -> data의 6개 Rows까지 보여줌
head(exam, 10)
tail(exam)
tail(exam, 10)
View(exam) # V는 대문자

dim(exam) # Table의 크기를 알려줌
str(exam) # string으로 크기 알려줌 
summary(exam) # 특성요약

#============== 4. 데이터 수정하기

df_raw <- data.frame(var1 = c(1,2,1),
                     var2 = c(2,3,4))
df_raw

df_temp <- rename(df_raw, v2=var2)
df_temp

#=============== 5. 데이터 수정하기 (파생변수)

df = data.frame(var1 = c(4,3,9),
                var2 = c(6,4,3))

df$sum <- df$var1 + df$var2

df$mean <- (df$var1 + df$var2) / 2

#=============== 6. ggplot2

# install.packages("ggplot2")
library("ggplot2")
mpg <- as.data.frame(ggplot2 :: mpg)

tail(mpg, 5)
head(mpg, 5)

dim(mpg)
str(mpg)
summary(mpg)
View(mpg)

# Q1.
# mpg <- as.data.frame(ggplot2 :: mpg)
mpg2 <- mpg

# Q2.
mpgtemp <- rename(mpg2, city = cty)
mpgtemp <- rename(mpg2, highway = hwy)

# Q3.
head(mpg2, 5)



