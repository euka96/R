A <- (1,4,5,"10"); A
class(A) #형식을 보여줌
as.numeric(A) #num으로 변경
class(A)#데이터 형식 설명
ls() #변수목록

install.packages("ggplot2") #시각화패키지
remove.packages("") #패키지 삭제
.libPaths() #라이브러리 경로
search()#설치된 패키지 확인
dir()#현재 디렉토리 확인
getwd()#파일확인
setwd() #새로운 디렉토리 설정

#scroll ctrl shift c => 주석처리
install.packages("ggplot2", dependencies = )

#복습
a <- seq(3,10, by = 2)
plot(a)
rep(c("A","B","C"), times = 2)
rep(c("A","B","C"), each = 3)
var1 <- c("새우깡","감자깡","고구마깡","맛동산")
var1[-2]
var1[-2:-4]
var1[-1][-3]
var1[-c(1,3)]
v10 <- c(70,80,65,"40"); v10
as.numeric(v10)
v10

v11 <- c(70,80,65,80); v11
sum(v11)
mean(v11)
median(v11)
sd(v11)
var(v11)
summary(v11)
boxplot(v11)

v12 <- c(70,80,65,80,NA); v12
sum(v12)
sum(v12, na.rm = TRUE) #NA제거 = ok
mean(v12, na.rm = TRUE)
summary(v12, na.rm = TRUE)

sample(1:10,5) #sample 추출
day1 <- sample(1:10,5, replace = TRUE); day1 #replace 복원추출
sort(day1) #오름차순 정렬
sort(day1, decreasing = TRUE) #내림차순
which(day1 <= 6) #인덱스 값의 위치(순서)를 출력
day1[which(day1 <= 6)] #해당 위치의 인데스 값을 출력
which.max(day1) #가장 큰 값의 위치 출력
which.min(day1) #가장 작은 값의 위치 출력

v9 <- seq(1,10, by = 3); v9
names(v9) <- c("A","B","C","D"); v9 #v9에 이름붙이기

exam <- read.csv("../data/csv_exam.csv") #엑셀파일 불러오기
#ctrl opt i => 숙제제출할때 마크다운하고 누르고 중간부분에 복붙해서 붙임

name <- c("김지훈","이유진","박동현","김민지")
eng <- c(90,80,60,70)
math <- c(50,60,100,20)
table <- data.frame(name,eng,math); table #순서대로 데이터로 프레임 구성
str(table) #변수 속성 설명
#obs = 관찰자/행  variables = 변수/항목/열

table$name # x$y => x속 y의 인덱스를 나열
table$eng
table$math

### 엑셀 파일 불러오기 ###
install.packages("readxl")
library(readxl)
excel_ex1 <- read_excel("~/Desktop/R/data/1.xlsx"); excel_ex1
excel_ex2 <- read_excel("~/Desktop/R/data/1.xlsx", sheet = 2); excel_ex2
excel_ex3 <- read_excel("~/Desktop/R/data/1.xlsx", sheet = 3); excel_ex3

m <- c(1,2,3,4,5,6); m
matrix(m, nrow = 2, ncol = 3)
matrix(m, nrow = 3, ncol = 2)
m23 <- matrix(m, nrow = 2, ncol = 3); m23
m32 <- matrix(m, nrow = 3, ncol = 2); m32
m23[1,]
m32[1,]
m23[,3]
m32[,2]
#byrow = TRUE => 행기준으로 데이터가 채워짐
m23byrow <- matrix(m, nrow = 2, ncol = 3, byrow = TRUE); m23byrow
m32byrow <- matrix(m, nrow = 3, ncol = 2, byrow = TRUE); m32byrow

ar <- (1:6); ar
array(ar, dim = c(2,2,3)) #변수 ar을 행수(2)*열수(2)인 matrix를 3차원 배열(array)로 구성

#list는 num&char 혼용 가능 | [[행]], [열]로 표시
list1 <- list((1:3), "Love"); list1
list2 <- list((1:5), "Love Hate"); list2
list1[[2]][1]
list1[[1]][2]
list1[[2]][2]
list1[1]
list1[[1]]

a <- 1:10
b <- matrix(a, ncol = 2); b
c <- data.frame(a,b = 11:20); c
d <- list(a,b,c); d

#p.77 연습문제
ID <- 1:5; ID
MID_EXAM <- c(10,25,100,75,30); MID_EXAM
CLASS <- c("1반","2반","3반","4반","5반"); CLASS
example_test <- data.frame(ID,MID_EXAM,CLASS); example_test

df_midterm1 <- data.frame(english1 = c(90,80,60,70),math1 = c(50,60,100,20),class1 = c(1,1,2,2)); df_midterm1
# apply는 함수를 적용하는 데 도움
apply(df_midterm1,1,sum) #1 = 행
apply(df_midterm1,2,sum) #2 = 열
# aggregate는 기준열을 통한 합산
aggregate(math1~class1, data = df_midterm1, sum) #class를 기준으로 math를 모두 더함
aggregate(english1~class1, data = df_midterm1, mean)
aggregate(.~class1, data = df_midterm1, sum) # . = 모두
aggregate(.~class1, data = df_midterm1, mean)

#임의로 랜덤값이 맞춰진 sample 추출
rnorm(100,80,5) #(변수,평균,표준편차)
round(rnorm(100,80,5),0) #round(data, 자릿수) | 소수점 표현

### 엑셀로 저장하기
rnorm_DB <- round(rnorm(100,80,5),0)
write.csv(rnorm_DB,"~/Desktop/R/day2/rnorm_DB.csv") #(변수,저장할위치/파일명)
write.csv(rnorm_DB,"~/Desktop/R/day2/rnorm_DB.csv",row.names = FALSE) #첫번째 열 삭제

k1 <- c(1:5); k1
k2 <- 6:10; k2
kcb <- cbind(k1,k2); kcb #열별로 변수를 지정
krb <- rbind(k1,k2); krb #행별로 변수를 지정

plot(rnorm_DB) #산점도
hist(rnorm_DB) #히스토그램

### factor 변환 | 성별, 연령대, 지역 등 범주를 factor라고 부름
fe_test <- c("B","C","A"); fe_test
str(fe_test)
fe.factor <- factor(fe_test); fe.factor
str(fe.factor)

#factor의 순서를 변경
a <- factor(fe.factor, levels = c("C","B","A")); a
str(a) #속성확인

is.factor(fe.factor) #factor여부를 질문
as.numeric(fe.factor)
as.character(fe.factor)

data(iris)
head(iris) #위에서 6개만 추출
str(iris)
