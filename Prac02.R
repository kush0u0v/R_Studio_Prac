library (ggplot2)
library (dplyr)

mpg <- data.frame(ggplot2::mpg)

# filter
#Q1

temp1 <- mpg %>% filter(displ < 4)
temp2 <- mpg %>% filter(displ > 5)

mean(temp1$hwy)
mean(temp2$hwy)


#Q2
mean((mpg %>% filter(manufacturer=="audi"))$cty)
mean((mpg %>% filter(manufacturer=="toyota"))$cty)

#Q3
mean((mpg %>% filter(manufacturer %in% 
                       c("chevrolet", "ford", "honda"))) $hwy )

#========================
# Select
#Q1
temp_mpg <- mpg %>% select(class, cty)
#Q2
mean( (temp_mpg %>% filter(class=="suv")) $ cty ) 
mean( (temp_mpg %>% filter(class=="compact")) $ cty ) 

#========================
# Arrange
# Q1
temp_audi <- 
  mpg %>%
  filter(manufacturer == "audi")
head(temp_audi %>% arrange(desc(hwy)), 5)

#========================
# mutate
# Q1
copy_mpg <- mpg
copy_mpg <-
  copy_mpg %>% 
  mutate(total_fule = cty + hwy)

# Q2
copy_mpg <-
  copy_mpg %>% 
  mutate(mean_fule = total_fule / 2)

# Q3
copy_mpg %>% 
  arrange(desc(mean_fule)) %>% 
  head(3)

# Q4
mpg %>% 
  mutate(total_fule = cty + hwy) %>%
  mutate(mean_fule = total_fule / 2) %>% 
  arrange(desc(mean_fule)) %>% 
  head(3)
  
#========================
# 
# Q1


