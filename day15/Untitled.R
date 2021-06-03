library(ggplot2)
library(dplyr) #파이프연산자
library(psych) #통계
install.packages("e1071") # skewness & kurtosis 추가 패키지
library(e1071)
data(diamonds)
str(diamonds)
carat <- diamonds$carat
price <- diamonds$price
density()
cor(carat, price)
summary(carat)
summary(price)
subset(diamonds, price >= 3933) %>% summarise(n())
# trim mean = 극값을 제외하고 구한 평균
filter(diamonds, price >= 3933) %>% summarise(mean = mean(carat),
                                              trim_mean = mean(carat, trim = 0.05),
                                              median = median(carat),
                                              SKEW = e1071::skewness(carat),
                                              KURT = e1071::kurtosis(carat))

### skewness & kurtosis
describe(women$height)
hist(women$height)

### multi regression
install.packages("psy") #신뢰도 검사
library(psy)
product <- read.csv("~/Desktop/R/data/product.csv")
y <- product[,c(3)]
x1 <- product[,c(1)]
x2 <- product[,c(2)]
df <- data.frame(x1,x2,y)
class(df)
cronbach(df)
cor(df)
result.lm <- lm(y ~ x1 + x2, data = df); result.lm
summary(result.lm)
