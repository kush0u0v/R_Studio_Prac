library (ggplot2)
library (dplyr)

# Q1
midwest <- as.data.frame(ggplot2::midwest)
summary(midwest)

# Q2
midwest <- rename(midwest, total = poptotal)
midwest <- rename(midwest, asian = popasian)

# Q3
midwest$ratio <- (midwest$asian / midwest$total) * 100
hist(midwest$ratio)  

# Q4
mean(midwest$ratio)
midwest$group <- ifelse(midwest$ratio > 0.487, "large","small")

# Q5
table(midwest$group)
qplot(midwest$group)

# Etc ================================
exam <- read.csv("csv_exam.csv")
