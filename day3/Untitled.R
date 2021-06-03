s1 <- sample(1:10,4); s1
s2 <- sample(1:100, 4); s2
par(mfrow = c(1,2)) #여러그래프를 그릴 수 있음 c(행의 수,열의 수)
hist(s1)
hist(s2)

exam <- read.csv("~/Desktop/R/data/csv_exam.csv"); exam
getwd()
exam[3,3]
exam[,4]
exam[1,]
exam[4:5,]
exam[,4:5]
exam[,c(1,3)]
exam[2,]
exam[exam$class == 1,]
exam[exam$math >= 80,]
exam[exam$class == 1 & exam$math >= 50, ] #R에서는 하나씩만 사용
exam[exam$english < 90 | exam$science < 50,]

fruit <- c("사과","딸기","수박"); fruit
price <- c(1800,1500,3000); price
volume <- c(24,38,13); volume
sales <- data.frame(fruit,price,volume); sales
mean(sales$price)
mean(sales$volume)

var5 <- c(1,3,5,7,9); var5
10 %in% var5 #var5안에 10이 포함되어 있는지 여부 확인
7 %in% var5

paste(1,2,3,4) #연결해서 출력 / 스페이스 하나로 구분됨
paste(1,2,3,4, sep = '') #seperate 구분점
paste(1,2,3,4, sep = '-')
paste('Function','in','r', sep = '        ')
paste('문자열을','합쳐','주세요', sep = '')
paste('C',1:10)
paste('C',1:10, sep = '')
paste0('C',1:10) #서로 붙어서 출력 = paste(, sep = '')
paste0(rep(c('A','B','C'), each = 3),1:3)
c(paste0('A',1:3), paste0('B',1:3), paste0('C',1:3))

a <- c(1:3)
b <- c(4:7)
c <- data.frame(a,b)
d <- list(a,b); d
d[[1]][3]

a <- 1:3; a
b <- "a string"; b
c <- pi; c
d <- list(-1,-5); d
list_sample <- list(a,b,c,d); list_sample
list_sample[[1]]
list_sample[[2]]
list_sample[[3]]
list_sample[[4]]
list_sample[[4]][1]
list_sample[[4]][[1]]

### matrix 추가
mt <- matrix(1:6,2,3); mt
mt+3
#cbind & rbind는 매트릭스 설정 이후에 추가로 데이터를 추가할 때 사용

rowSums(mt) #행의 합
colSums(mt) #열의 합
rowMeans(mt) #행의 평균
colMeans(mt) #열의 평균

###열을 기준으로 할때는 : cbilnd / apply(변수,2,함수)