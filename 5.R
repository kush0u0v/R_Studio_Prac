library (ggplot2)
library (dplyr)

# 5. 데이터 합치기
# 가로로 합치기
test1 <- data.frame(id = c (1,2,3,4,5),
                   midterm = c (60, 70,80,90,95))
test2 <- data.frame(id = c (1,2,3,4,5),
                   final = c (70, 60,50,70,65))


total <- left_join(test1, test2, by = "id")

exam <- read.csv("csv_exam.csv")
name <- data.frame(class = c(1,2,3,4,5),
                   teacher = c("kim", "lee", "park", "choi", "jang"))

exam_new <- left_join(exam, name, by = "class")


# 세로로 합치기 ====================
group_a <- data.frame(id = c(1,2,3,4,5),
                      test = c(33,2,4,3,12))
group_b <- data.frame(id = c(6,7,8,9,10),
                      test = c(13,4,5,3,4))

group_all <- bind_rows(group_a, group_b)

#left_join(a,b, by = "..")
#bind_rows
