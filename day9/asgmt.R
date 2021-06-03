library(dplyr)
# 1
class <- c(2,1,2,1,1,2); class
english <- c(98,97,86,98,80,89); english
science <- c(50,60,78,58,65,98); science
school <- data.frame(class, english, science); school
school1 <- school %>% filter(class == 1); school1
school2 <- school %>% filter(class == 2); school2
class1 <- mean(school1$science); class1
class2 <- mean(school2$science); class2
mean_science <- rbind(class1, class2); mean_science

# 2
exam <- read.csv("~/Desktop/R/data/csv_exam.csv"); exam
exam1 <- group_by(exam, class) %>% mutate(mean_math = mean(math), sum_math = sum(math),
                                          median_math = median(math)) %>% 
  select(class, mean_math, sum_math, median_math) %>% distinct(); exam1

# 3
exam2 <- exam; exam2
exam2[c(3,8,15),3] <- NA; exam2
mean_math <- mean(exam2$math, na.rm = TRUE); mean_math
sum_math <- sum(exam2$math, na.rm = TRUE); sum_math
median_math <- median(exam2$math, na.rm = TRUE); median_math
data.frame(mean_math, sum_math, median_math)

# 4
exam3 <- filter(exam2, !is.na(math)); exam3
exam4 <- na.omit(exam2); exam4
write.csv(exam4, "~/Desktop/R/day9/6번.csv")