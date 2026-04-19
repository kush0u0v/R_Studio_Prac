library (ggplot2)
library (dplyr)


midwest <- data.frame(ggplot2::midwest)
summary(midwest)

midwest <- rename(midwest, total=poptotal)
midwest <- rename(midwest, asian=popasian)

midwest$per <- (midwest$asian/midwest$total) * 100
hist(midwest$per)

mean(midwest$per)
midwest$group <- ifelse(midwest$per >= 0.487, "large", "small")

table(midwest$group)
qplot(midwest$group)
