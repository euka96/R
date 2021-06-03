# p.194~
dataset <- read.csv("~/Desktop/R/data/data3/dataset.csv")
head(dataset)
names(dataset) #변수명 조회
attributes(dataset) #names, class, row.names 다 출력
str(dataset) #속성
dataset$age
dataset$resident
length(dataset$age)
x <- dataset$gender
y <- dataset$price
plot(dataset$price)
dataset["gender"]
head(dataset["price"])
dataset[2]
dataset[3,]
dataset[,3]
head(dataset[c("job","price")])
head(dataset[c(2,6)])
head(dataset[c(2,4:6,3,1)])     
head(dataset[,c(2:4)])
dataset[c(2:4),]
dataset[-c(1:100),]
summary(dataset$price)
sum(dataset$price)
sum(dataset$price, na.rm = TRUE)
price2 <- na.omit(dataset$price)
sum(price2)
length(price2)
x <- dataset$price
x[1:30]
dataset$price2 = ifelse(!is.na(x),x,0)
dataset$price2[1:30]
dataset$price3 = ifelse(is.na(x), round(mean(x, na.rm = TRUE),2),x)
dataset$price3[1:30]
dataset[c("price","price2","price3")]
table(dataset$gender)
pie(table(dataset$gender))
dataset1 <- subset(dataset, gender == 1 | gender == 2) #subset | 특정 조건의 변수만 추출
length(dataset1$gender)
pie(table(dataset1$gender), col = c("red","blue"))
dataset2 <- read.csv("~/Desktop/R/data/data3/dataset.csv", header = TRUE)
length(dataset$price)
plot(dataset2$price)
summary(dataset2$price)
dataset3 <- subset(dataset2, price >= 2 & price <= 8)
length(dataset3$price)
stem(dataset3$price)


### 광고비와 판매량
pro_df <- read.csv("~/Desktop/R/data/promote.csv"); pro_df
ls(pro_df)
str(pro_df)
cor(pro_df) #corelation
#정규성 검사 과정
pro_lm <- lm(data = pro_df, price ~ promote) # lm(data = 데이터셋, 종속변수~독립변수) linear model
summary(pro_lm)
par(mfrow = c(2,2))
plot(pro_lm)
shapiro.test(pro_df$price) # shaprio.test | 정규성 검사


data(cars)
cars_lm <- lm(data = cars, dist ~ speed); cars_lm
summary(cars_lm)
plot(cars_lm)
# residuals 잔차; 모집단의 평균 편차