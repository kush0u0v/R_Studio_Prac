library (ggplot2)
library (dplyr)

exam <- read.csv("csv_exam.csv")


#===========================
# 6. 데이터 가공하기: 집단별로 데이터 요약
exam %>% summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())
            # n = n() -> ??개별 행의 갯수를 구함


            
