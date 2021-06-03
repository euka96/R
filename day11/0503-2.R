
install.packages('reshape2')
library(reshape2)

head(airquality)

#변수명에 대소문자가 섞여 있으면 발생할 수 있는 실수를 막기 위해
#변수명을 구하는 names()함수
#소문자로 치환하는 tolower()함수를 이용해 변수명을 모두 소문자로 변경

#소문자로 변환한 변수명으로 기존 변수명 대체

names(airquality) <- tolower(names(airquality))
head(airquality)

melt_test <- melt(airquality)

head(melt_test)
tail(melt_test)

View(airquality)


#id.vars=기준열
#measure.vars=변환열

#월과 바람에 따른 오존 확인하기
melt_test2 <- melt(airquality, id.vars=c("month","wind"),
                   measure.vars="ozone")


table(is.na(airquality))
NA.RM_AIR <- na.omit(airquality)
str(NA.RM_AIR)


names(airquality)
#월과 태양으로 바람을 확인하기
melt_test3 <- melt(airquality, id.vars=c("month","solar.r"),
                   measure.vars="wind")

head(melt_test3)
tail(melt_test3)



library(reshape2)

#실습 문제
#월일을 기준으로 한 solar.r 값 확인
#rm(melt_test4)


melt_test4 <- melt(airquality, id.vars=c("month","day"),
                   measure.vars="solar.r")

head(melt_test4)
tail(melt_test4)



# cast()
# 세로로 긴 데이터 모양을 가로로 전환하는 cast() 함수
# acast() : 백터, 행렬, 배열 형태변환
# dcast() : 데이터프레임 형태를 변환
# dcast(데이터세트, 기준열~ 변환열)

#aq_melt <- melt(air_narm, id.vars=c("month","day"))


rm(list=ls())

air_low <- airquality
head(air_low)

names(air_low) <- tolower(names(air_low))

head(air_low)

table(is.na(air_low))

air_narm <- na.omit(air_low) #결측치행 날리기

dim(air_narm)

#월과 바람에 따른 오존값 확인
#변형한 데이터를 melt_test2 변수에 할당


melt_test2 <- melt(air_narm, id.vars=c("month","wind"),
                   measure.vars="ozone")

head(melt_test2)


View(melt_test2)




dim(air_low)
head(air_low)

head(air_narm)
dim(air_narm)



#측정값 생략시 id.vars 의 값을 기준으로 행으로 정렬되는 긴 테이블

aq_melt <- melt(air_low, id.vars=c("month","day"),
                na.rm=T) ; aq_melt
head(aq_melt)
dim(aq_melt)

head(aq_melt)
aq_dcst <- dcast(aq_melt, month+day ~ variable)
aq_dcst
dim(aq_dcst)
head(aq_dcst)
View(aq_dcst)



# 오존,태양,바람,온도의 측정값이 출력
View(aq_melt)


acast(aq_melt, day~month~variable)
#acast는 array(배열형식)으로 나온다
#, , temp 이런식..



#평균으로 요약하기
acast(aq_melt, month~variable, mean)

#sum으로 요약하기
acast(aq_melt, month~variable, sum)





rm(list=ls())

data('iris')
str(iris) #데이터속성
?iris #help
head(iris)
head(iris,5)
tail(iris)
tail(iris,5)


#iris데이터의 1행부터 5행까지의 데이터를 가져오시오

iris[1:5, ]


#iris데이터의 1열과 5열의 위에서 6개 데이터만 가져오세요.
head(iris[ , c(1,5)])


#iris데이터의 3열과 4열의 밑에서 10개의 데이터만 가져오세요.
tail(iris[ , c(3,4)],10)

library(dplyr)

iris %>% select(c(3:4)) %>% tail(10)

#iris데이터의 Species만 빼고 위에서 6개의 데이터를 가져오세요.
ls(iris)

iris %>% select(-Species) %>% head()


# iris데이터에서 Sepal.Length의 평균
head(iris)


mean(iris$Sepal.Length)

iris %>% mean(Sepal.Length)
summary(iris$Sepal.Length)


#iris 데이터의 열방향 최댓값
#행=1, 열=2
apply(iris, 2, max)
apply(iris, 2, mean)



# iris 데이터의 열방향 최솟값, 합계
apply(iris,2,min)
apply(iris,2,sum)

#합계와 평균의 경우 Sepecies 값을 제외하고 구한다
#iris 데이터의 열방향 합계
apply(iris[,1:4],2,sum)




#Species 붓 꽃 종의 집계
table(iris[ ,5])



?subset

df.set <- subset(iris, Species == "setosa")
head(df.set)
summary(df.set)


#Petal.Length 4.35초과이고 Petal.Width 1.3 초과인
#데이터를 df.large로 저장

df.large <- subset(iris, Petal.Length > 4.35 &
                     Petal.Width > 1.3)

df.large


table(df.large[ ,5]) #5번째 열 집계

plot(iris)
plot(df.large)



#install.packages('psych')
library(psych)

pairs.panels(iris)



#비교

distinct(iris, Species)

plot(iris)
plot(iris$Petal.Width, iris$Petal.Length, pch=5)
plot(iris$Petal.Width, iris$Petal.Length, pch=1)




#가메p.150

data(iris)
names(iris)

head(iris)
str(iris)

summary(iris$Sepal.Length)

summary(iris$Sepal.Width)


hist(iris$Sepal.Width, xlab="iris$Sepal.Width",
     col="mistyrose",
     main="iris 꽃받침 너비 histogram",
     xlim=c(2.0,4.5))



par(mfrow=c(1,2))
hist(iris$Sepal.Width, xlab="iris$Sepal.Width",
     col="green",
     main="iris꽃받침 너비 Histogram: 빈도수",
     xlim=c(2.0,4.5))


hist(iris$Sepal.Width, xlab="iris$Sepal.Width",
     col="mistyrose", freq=F,
     main="iris 꽃받침 너비 Histogram: 확률 밀도",
     xlim=c(2.0,4.5))

lines(density(iris$Sepal.Width), col="red")




hist(iris$Sepal.Width , xlab = "iris$Sepal.Width",
     col="magenta" , freq = F,
     main = "iris 꽃받침 너비 Histogram: 확률밀도",
     xlim = c(2.0,4.5) )

# 밀도 기준 line 추가 함수
lines(density(iris$Sepal.Width) , col="blue")




library(reshape2)

#melt: 열->행
#cast: 행->열 (dcast:데이터프레임,acast:행렬 벡터 배열)
#dcast(데이터세트, 기준열~변환열)

data <- read.csv('C:/ken/data/data.csv')
data

wide <- dcast(data, Customer_ID ~ Date, sum)
wide


setwd('C:/ken/data')
write.csv(wide, "wide.csv", row.names=F)

wide <- read.csv('wide.csv')
head(wide)
colnames(wide) <- c("Customer_ID","day1","day2","day3",
                    "day4", "day5", "day6", "day7")

wide



long <- melt(wide, id="Customer_ID")
long

name <- c("Customer_ID","Date","Buy")
colnames(long) <- name
head(long)

data("smiths")
head(smiths)

long <- melt(smiths, id=1:2)
long

dcast(long, subject+time~...)


data('airquality')
head(airquality)

names(airquality) <- tolower(names(airquality))
head(airquality)





#melt: 열->행
head(airquality)
air_melt <- melt(airquality, id=c("month","day"), na.rm=T)

#acast 함수를 이용하여 3차원 구조로 변경하기
acast <- acast(air_melt, day ~ month ~ variable)


acast(air_melt, month~variable, sum, margins=T)

