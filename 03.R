library (dplyr)
library (ggplot2)
library (readxl)

exam <- read.csv("csv_exam.csv") ## ****** 시험
exam

#++++++
#조건에 맞는 데이터 추출

exam %>% filter(class==1)
# ctrl + shft + m == pipe Operator


exam %>% filter(class == 2)
exam %>% filter(class == 3)

exam %>% filter(math >= 50 & english >= 80) # and Operator
exam %>% filter (class == 2 & english >= 80)

exam %>% filter (math >= 90 | english >= 90) # OR Operator
exam %>% filter (class == 1 | class == 3 | class == 5)
exam %>% filter (class %in% c(1,3,5)) # Array %in% Technic

class1 <- exam %>% filter(class == 1) # Filter arry
class1

mean(class1$math)


# 특정 열을 선택
exam %>% select(math)
exam %>% select(-math, -english)


# 복합사용
exam %>% 
  filter(class==1) %>% 
  select(english)
# %>% select, %>% filter

exam %>% 
  select(id, math) %>% 
  head(10)

# 정렬하기
exam %>% arrange(math)
exam %>% arrange(desc(math)) # 내림차순
exam %>% arrange(class, math) # 여러개 가능

# 데이터 가공하기 (파생변수 추가)

exam %>% 
  mutate(total = math + english + science) %>% 
  head (6)

exam %>% 
  mutate(total = math + english + science,
         mean=(math + english + science)/3) %>% 
  head(5)

exam %>% 
  mutate(test = ifelse(science>=60, "pass", "fail")) %>% 
  head


exam %>% 
  mutate(total = math + science + english) %>% 
  arrange(desc(total)) %>% 
  head(5)

# 파생변수 만들기, 손코딩

# filter()
# select()
# arrange()
# arrange(desc())
# mutate()
# %>% # ctrl + shift + m (Pipe Operator)
