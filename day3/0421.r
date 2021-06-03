exam <- read.csv('C:/ken/data/csv_exam.csv')
exam

getwd() #현재 작업 디렉토리 경로 확인

# 행 번호로 행 추출하기
# 대괄호 안 쉽표 기준, 왼쪽에 행 번호(인덱스) 입력
# 인덱스(index) : 데이터의 위치 또는 순서를 의미하는 값
# 인덱싱(indexing) : 인덱스를 이용해 데이터를 추출하는 작업

exam[1,2]

# 조건을 충족하는 행 추출하기
exam[exam$class == 1, ] # class가 1인 행 추출

exam[exam$math >= 80, ] #수학점수가 80점 이상인 행 추출


# 1반이면서 수학점수가 50점 이상
exam[exam$class == 1 & exam$math >= 50 , ]


# 영어점수가 90점 미만이거나 과학점수가 50점 미만
exam[exam$english < 90 | exam$science < 50 , ]



# data.frame() 과 c() 를 조합해서 표의 내용을 데이터 프레임으로 만들어 출력 (데이터세트 이름 sales)

# (1)
fruit <- c("사과","딸기","수박")
price <- c(1800,1500,3000)
volume <- c(24,38,13)

sales <- data.frame(fruit,price,volume)
sales

# (2)
sales <- data.frame(fruit = c("사과","딸기","수박"),
                    price = c(1800,1500,3000),
                    volume = c(24,38,13))
sales

# 과일 가격 평균
mean(sales$price)
# 판매량 평균
mean(sales$volume)







# var5(오른쪽) 범위 안에 10(왼쪽)이 포함되는지 확인

var5 <- c(1,3,5,7,9)

10 %in% var5
7 %in% var5



c(1,2,3,4)

paste(1,2,3,4)

paste(1,2,3,4, sep='') # sep = 구분자
paste(1,2,3,4, sep='-')

paste('function','in','r',sep='   ') # 공백 띄우기
paste('문자열을','합쳐','주세요', sep='') # 공백


# "C1" "C2" "C3" .. "C10" 모두 합치기

paste("C",1:10)

paste0("C",1:10) # 글자 사이 공백 제거해준다
paste("C",1:10,sep='')


# A1~A3, B1~B3, C1~C3 인 자료를 만들어라
c(paste0("A",1:3),paste0("B",1:3),paste0("C",1:3))


a <-c(1:3)
b <-c(1:4)

c<-data.frame(a,b) ;c # 데이터프레임은 길이가 같아야 하므로 에러

d<-list(a,b) ;d # 리스트는 길이가 상관 없으므로 정상출력



#list 보강

a <- 1:3
b <- "a string"
c <- pi
d <- list(-1,-5)

ken <- data.frame(a,b,c,d) ; ken

ken_list <- list(a,b,c,d) ; ken_list

ken_list <- list(a =1:3,
                 b= "a string",
                 c =pi,
                 d = list(-1,-5)
  
)

ken_list


a[[1]]
a[[2]]

ken_list[[1]] #1행 전부 가져오기
ken_list[[1]][2] #1행의 2번째꺼



# matrix 추가

mt <- matrix(1:6,2,3)
mt

mt+3

#matrix(data,nrow,ncol)

# 
# #rbind , cbind
# cbind = (기본) 밑으로추가
# rbind = 옆으로 추가
# 
# matrix에서 숫자쓸 때 열기준


mt


rowSums(mt) #행의 합
colSums(mt) #열의 합
rowMeans(mt) #행의 평균
colMeans(mt) #열의 평균



# 모든건 기본이 열 기준 / cbind / apply 에서 2

mt

###################################################

t(mt) #transpose 행/열바꿈


y <- c(1:6)
y

array(y,dim=c(2,2,3))
# = array(1:6), array(c(1,2,3,4,5,6))


## 내장 데이터 세트 iris
# 궁금한것들은 ??붙이고 검색 ex. ??iris
# .libPaths() 라이브러리 위치 확인

data("iris")
attach(iris)
detach(iris)

my_iris <- iris
my_iris

head(my_iris) #상위 6개만 보고 싶을 때
head(my_iris,3) #위에 3개만 보고 싶을 때
tail(my_iris) #하위 6개만 보고 싶을 때


dim(iris)
nrow(iris) # 행의 갯수
ls(iris) # iris 의 변수명 출력



# iris 에서 1-4열 가져오기
my_iris <- my_iris[,1:4]
my_iris

apply(my_iris,2,mean) #2는 열
apply(my_iris,2,sum) #2는 열
lapply(my_iris,mean) #lapply 의 l는 리스트의 약자 -> 리스트 형태의 apply
 # $ 표시 있으면 리스트!



library(readxl)
exdata1 <- read_excel("C:/ken/data/Sample1.xlsx")
exdata1

View(exdata1)
str(exdata1)

dim(exdata1)
ls(exdata1) #데이터 세트에 포함된 변수명, 즉 columns 열 제목만 따로 뽑아서 확인


# 변수명 변경

install.packages('dplyr')
library(dplyr)

exdata1 <- rename(exdata1, Y17_AMT = AMT17 , Y16_AMT = AMT16)
# 변수명 변경 후 exdata1 데이터세트에 꼭! 저장하기
# 저장하지 않고 단순 변경만 하면, 단발성 변환에 해당

head(exdata1)


# 데이터세트$새 파생 변수명
exdata1$AMT <- exdata1$Y17_AMT + exdata1$Y16_AMT
exdata1$CNT <- exdata1$Y17_CNT + exdata1$Y16_CNT

head(exdata1)
