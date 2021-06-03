### print(출력데이터 [옵션])
### cat(... , ... , ...) 줄바꿈 기능이 없음
print(100)
print(pi)
data <- c("사과","딸기","포도")
print(data)
print(data, quote = FALSE) # quote = FALSE | ""없애기
print(data, print.gap = 3, quote = FALSE) #print.gap = | 데이터 사이 공간을 줘서 출력
cat(100)
cat(100,200)
1+1
cat(100,200,"\n")
1+1

print("a" == "A")
x <- 20
if(x > 10)
  print("x is large number")
if(x > 10)
  cat(x, "is large number")


### for(variable in vector) {}
for (i in 1:10) {
  cat(paste0(i, "번째 실행 중 입니다.\n"))
}

vec1 <- c(1:100)
for (i in vec1) {
  cat(paste0(i, "번째 실행 중 입니다.\n"))
}

gg <- 3
for (i in 1:10) {
  cat(paste(gg, "x", i, "=", gg * i), "\n")
}

sum <- 0
for (i in 1:10) {
  sum <- sum + i
}; sum

a <- 5
if (a %% 2 == 0) {
  print(a)
  print("짝수")
} else {
  print(a)
  print("홀수")
}


### switch (object, case = action)
data <- c(1:10)
switch(data[3],
       "1" = print("One"),
       "2" = print("Two"),
       "3" = print("Three"),
       print("Null")
       )


user <- function(){
  answer <- readline("Input Data :")
    if (substr(answer, 1, 1) == "n") #substr(변수, 시작번째, 마지막번째)
      cat("아니오")
    else
      cat("예")
}
user()

### while(조건) {}
### repeat{}

library(dplyr)
distinct(iris, Species)

exam <- read.csv("~/Desktop/R/data/csv_exam.csv"); exam
exam %>% filter(class == 1)
exam %>% filter(class != 1)
exam %>% filter(math > 50)
exam %>% filter(math > 50 & english >= 90)
exam %>% filter(class == 1 & math > 50)
select(exam, id, english, science) %>% filter(english < 90 | science < 50)
#or
exam %>% select(id, english, science) %>%
  filter(english < 90 | science < 50) %>% head(2) #shift enter 줄바꿈
exam %>% filter(class %in% c(1,3,5)) # %in% 포함 여부
math1 <- exam %>% select(class, math) %>% filter(class == 1)
mean(math1$math)
eng2 <- exam %>% filter(class == 2)
sum(eng2$english)
exam %>% mutate(total = math + english + science)
exam_ext <- exam %>% mutate(total = math + english + science,
                         avr = (math + english + science)/3); exam1
exam %>% mutate(result = ifelse(exam$science >= 70, "pass", "fail"))
exam %>% group_by(class) %>% summarise(mean_math = mean(math))
# class별로 분리


###데이터 옆으로 합치기
test1 <- data.frame(id = 1:5, midterm = c(60, 80, 70, 90, 85)); test1
test2 <- data.frame(id = 1:5, final = c(70, 83, 65, 95, 80)); test2
total <- left_join(test1, test2, by = "id"); total # test1과 test2를 id를 기준으로 합침

name <- data.frame(class = c(1,2,3,4,5),
                   teacher = c("kim","lee","park","choi","jung")); name
exam_new <- left_join(exam, name, by = "class"); exam_new #exam과 name을 class를 기준으로 합침

###데이터 아래로 합치기
group_a <- data.frame(id = 1:5, test = c(60,80,70,90,85)); group_a
group_b <- data.frame(id = 6:10, test = c(50,30,90,100,67)); group_b
group_all <- bind_rows(group_a, group_b); group_all