ft_test <- c("c","b","a","c","b","b","c","c")
fe.factor <- factor(ft_test)
str(fe.factor)
library(ggplot2)
qplot(fe.factor)
a <- factor(fe.factor, levels = c("c","b","a")) #levels | 임의로 레벨을 선정
qplot(a)
as.numeric(a)
str(a)

x <- c(1,2,"3"); x
result <- x*3
result <- as.numeric(x)*3; result

url <- "https://www.nrc.gov/reading-rm/doc-collections/event-status/reactor-status/powerreactorstatusforlast365days.txt"
url.tr <- read.table(url, sep = "|", stringsAsFactors = FALSE, 
                     header = "TRUE", nrow = 1000)
tr_2 <- read.table("~/Desktop/R/data/power.txt", sep = "|",
                   header = TRUE, nrow = 1000, stringsAsFactors = FALSE)
tr_2$ReportDt <- as.Date(tr_2$ReportDt, format = "%m/%d/%Y"); tr_2
class(tr_2$ReportDt)
head(tr_2)

#apply
head(iris, 3)
apply(iris[, 1:4], 2, sum) #행 = 1, 열 = 2
apply(iris[, 1:4], 1, mean)

score <- read.csv("~/Desktop/R/data/score.csv")
head(score, 2)
apply(score[, 3:5], 2, mean) #= apply(score[, -(1:2) or -1:-2 or -c(1:2)], 2, mean)
apply(score[, -(1:2)], 2, sd)
apply(score[, -(1:2)], 2, var)


###연습문제 p.56
getwd()
setwd("~/Desktop/R/Rwork/Part-1")

name <- c("kate","john","serena")
age <- c(26, 37, 13)
address <- c("USA","UK","France")
mode(name); mode(age); mode(address)
is.character(name); is.character(age); is.character(address)
is.numeric(name); is.numeric(age); is.numeric(address)

View(women)
키와 몸무게
matrix, height+weight
plot(women)
### 선형모델 | lm(종속변수 ~ 독립변수,data = )
lm_women <- lm(weight ~ height, data = women)  #선형 모델 , 회기분석, 종속변수
summary(lm_women)
plot(women)
abline(lm_women, col = "red") #추세선


smp <- c(1:100)
mean(smp)

x1 <- 1:3
x2 <- 4:6
x3 <- 7:9
x_cbind <- cbind(x1,x2,x3); x_cbind
x_rbind <- rbind(x1,x2,x3); x_rbind

### 선형모델 | lm(종속변수 ~ 독립변수,data = )
txtemp <- read.table("~/Desktop/R/data/data3/emp.txt", header = 1, sep = "")
head(iris,6)
names(iris) <- tolower(names(iris)); head = iris

height <- data.frame(id = c(1,2), h = c(180,175))
weight <- data.frame(id = c(1,2), w = c(80,75))
user <- merge(height, weight, by.x = "id", by.y = "id"); user

list <- list("lee", "이순신", 95); list
unlist <- unlist(list); unlist
num <- list(1:5, c(6,10)); num
member <- list(name = c("홍길동","유관순"), age = c(35,35),
               address = c("한양","충남"), gender = c("남자","여자"),
               htype = c("아파트","오피스텔")); member
member$name; member$name[1]; member$name[2]


### 산점도 그래프  
ggplot(data = mpg, aes(x = displ, y = hwy)) #필요한 분류 선택
+ geom_point() #그래프 종류 선택
+ xlim(3, 6) # x 값이 3-6 인 값만 출력
+ ylim(10, 30) # y 값이 10-30인 값만 출력
head(mpg,2)
distinct(mpg,fl) #종류를 중복없이 나열

data("midwest")
ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_point()
ggplot(data = midwest, aes(x = poptotal, y = popasian)) + 
  geom_point() + xlim(0,500000) + ylim(0,10000)
options(scipen = 99) #지수로 표현된 숫자를 정수로 표현 / 지수로 표현시 '0'

### 막대 그래프
df_mpg <- mpg %>% group_by(drv) %>% summarise(mean_hwy = mean(hwy)); df_mpg
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()
ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy) #순서 정렬 / mean_hwy가 큰 순서대로
                          , y = mean_hwy)) + geom_col()
#geom_col() : 평균 막대 그래프; 데이터를 요약한 평균표를 먼저 만든 후 평균표를 이용해 그래프 생성
#geom_bar() : 빈도 막대그래프; 별도로 표를 만들지 않고 원자료를 이용해 그래프 생성, y축 지정x

suv_cty <- mpg %>% filter(class == "suv") %>% group_by(manufacturer) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty)) %>% head(5); suv_cty
ggplot(data = suv_cty, aes(x = reorder(manufacturer, -mean_cty), y = mean_cty)) + geom_col()

### 시계열 그래프 | 시간순대로
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()
ggplot(data = economics, aes(x = date, y = psavert)) + geom_line()
lm_ecopsa <- lm(psavert ~ date, data = economics); lm_ecopsa
summary(lm_ecopsa)
ggplot(data = economics, aes(x = date, y = psavert)) +
  geom_line() + geom_abline(intercept = 12.4117258, slope = -0.0004925)

### 누적 막대 그래프
ggplot(mtcars, aes(x = factor(cyl))) + geom_bar(aes(fill = factor(gear)))
