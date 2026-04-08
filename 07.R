library (ggplot2)
library (dplyr)

#=== 결측치 & 이상치 처리

# 1. 결측치 정제
df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(20,30,40,30, NA))

df
# 안됨
mean(df$score)
sum(df$score)
median(df$score)

# 결측치 확인 함수
is.na(df)
table(is.na(df)) # 결측치 빈도 측정

table(is.na(df$score))
table(is.na(df$sex))

# Filter 사용
nomiss <- df %>% filter(!is.na(score))
mean(nomiss$score)
# -> 제일 안전함

nomiss <- df %>% filter(!is.na(score) & !is.na(sex))

# 결측치 척결 (비추ㅜㅜㅜㅜㅜ)
df_nomiss1 <- na.omit(df)
df_nomiss1
# -> 분석 데이터 손실

mean(df$score, na.rm = T)
# 이 옵션이 없는 함수도 존재


exam <- read.csv("csv_exam.csv")
exam[c(3, 4, 15), "math"] <- NA
# 3, 4, 15 행의 math에 NA 할당

exam %>% 
  summarise (mean_math = mean(math))
# 안됨!!!

# 1
#exam %>% 
 # summarise (mean_math = mean(math, na.rm = T)

# 3 개추
exam_repair <- exam %>% filter(!is.na(math))
exam_repair %>% 
  summarise (mean_math = mean(math))



# ======= 결측치 대체

# 1. 평균값 대체
mean(exam$math, na.rm = T)
exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))
mean (exam$math)
