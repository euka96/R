noheader <- read.csv("~/Desktop/R/data/no_mid_exam.csv")
View(noheader)
#헤더 넣기
re_name <- c("lab1","lab2","lab3","lab4") #헤더 이름 생성
read.csv("~/Desktop/R/data/no_mid_exam.csv", header = FALSE, col.names = re_name)
#헤더 변경
re_name1 <- c("lab1","lab2","lab3","lab4")
read.csv("~/Desktop/R/data/no_mid_exam.csv", col.names = re_name)

getwd()
#비정형 데이터 불러오기
txt1 <- readLines("~/Desktop/R/data/구매후기.txt"); txt1
txt2 <- readLines("~/Desktop/R/data/구매후기_utf8.txt"); txt2
txt2_1 <- readLines("~/Desktop/R/data/구매후기_utf8.txt", fileEncoding = "euc-kr"); txt2_1
txt1_1 <- readLines("~/Desktop/R/data/구매후기.txt", encoding = "euckr"); txt1_1

#테이블 형식이 있는 데이터 불러오기
txt4 <- read.table("~/Desktop/R/data/전공.txt"); txt4
txt6 <- read.table("~/Desktop/R/data/전공2.txt", header = TRUE); txt6

###조건문
data(iris)
df.1 <- iris[iris$Species == "setosa",]; df.1
df.2 <- subset(iris, Species == "setosa"); df.2
library(dplyr)
df.3 <- filter(iris, Species == "setosa"); df.3

#txt파일 테이블 형태로 불러오기
read.table("~/Desktop/R/data/data_ex.txt", fileEncoding = "euc-kr")
read.table("~/Desktop/R/data/data_ex.txt", header = TRUE, fileEncoding = "euc-kr")
  #헤더 유무 확인
read.table("~/Desktop/R/data/data_ex.txt", skip = 2, fileEncoding = "euc-kr")
  #특정 행까지 제외한 데이터 가져오기
read.table("~/Desktop/R/data/data_ex.txt", nrows = 7, fileEncoding = "euc-kr")
  #특정행까지 데이터 가져오기
read.table("~/Desktop/R/data/data_ex1.txt", sep = ",", fileEncoding = "euc-kr")
  #데이터 구분자 지정

###조건문
#변수 <- ifelse(조건문, 참값, 거짓값)

###다중조건문
#변수 <- ifelse(조건문, 참값,
            #ifelse(조건문2, 참값,
              #거짓값
                  #)
              #)

var1 <- c(4,3,8); var1
var2 <- c(2,6,1); var2
df <- data.frame(var1, var2); df
###파생변수 생성
df$var_sum <- df$var1 + df$var2; df
df$var_mean <- (df$var1 + df$var2)/2; df
df$var_con <- ifelse(df$var_mean >= 3, "A", "B"); df
df$var_con1 <- ifelse(df$var_mean >= 5, "A",
                      ifelse(df$var_mean >= 4, "B",
                             ifelse(df$var_mean >= 3, "C",
                                  "D")
                             )
                      ); df

mpg$total <- (mpg$cty + mpg$hwy)/2; mpg
summary(mpg$total)
hist(mpg$total)
mpg$con <- ifelse(mpg$total >= 25 & mpg$cty >= 20, "우수", "일반"); mpg$con
View(mpg)


sep_mpg <- data.frame(mpg$manufacturer, mpg$trans, mpg$drv, mpg$cty, mpg$hwy,
                      mpg$class, mpg$total, mpg$con); sep_mpg
head(sep_mpg,2)
write.csv(sep_mpg, "sep_mpg.csv", row.names = FALSE)
#or
sep_mpg1 <- mpg[, c(1,6,7,8,9,11,12,13)]; sep_mpg1
head(sep_mpg1,2)
write.csv(sep_mpg1, "sep_mpg.csv", row.names = FALSE)

table(mpg$con) #집계
library(ggplot2)
dev.new() #새창띄우기
qplot(mpg$con)

###데이터 수정하기
head(sep_mpg,2)
sep_mpg[2,2] <- "auto(90)"
sep_mpg[1,6] <- "suv"


###결측치(Missing Value) | 제거 후 분석해야함
#결측치찾기
df <- data.frame(sex = c("M","F",NA,"M","F"), score = c(5,4,3,4,NA)); df
is.na(df);
table(is.na(df)) #결측치 집계(빈도수) 출력

#변수별로 결측치 확인하기
table(is.na(df$sex))
table(is.na(df$score))
mean(df$score) #NA 때문에 값이 안나옴
mean(df$score, na.rm = TRUE) #na 값을 remove 

df[3,1] <- "M"; df #결측치 찾으면 강제 할당

#%>% | 파이프연산자 ctrl shift m
#ctrol, shift, c | 주석처리 한번에
#ctrl alt i 마크다운청크
  
#결측치가 있는 행 제거하기 | filter() 조건을 지정해서 출력
library(dplyr)
df %>% filter(is.na(score)) # score가 NA인 데이터만 출력
df %>% filter(!is.na(score)) #결측치를 제외한 데이터만 출력
df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)
sum(df_nomiss$score)
#결측치 중복 제거
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex)); df_nomiss
#결측치 하나라도 있으면 제거
df_nomiss2 <- na.omit(df); df_nomiss2

library(dplyr)
sample1 <- read_xlsx("~/Desktop/R/data/Sample1.xlsx")
sample1 %>% select(ID) #선택한 변수만 추출
sample1 %>% select(ID, AREA, Y17_CNT)
sample1 %>% select(-AREA) #선택한 변수 빼고 추출
sample1 %>% select(-AREA, -Y17_CNT)
sample1 %>% filter(AREA == '서울') #특정 변수에서 특정 데이터가 있는 행만 추출
sample1 %>% filter(AREA == '서울' & Y17_CNT >= 10)
sample1 %>% arrange(AGE) #변수의 데이터를 오름차순으로 정렬
sample1 %>% arrange(desc(Y17_AMT)) #변수의 데이터를 내림차순으로 정렬
sample1 %>% arrange(AGE, desc(Y17_CNT)) #먼저 적힌 변수부터 각각 정렬