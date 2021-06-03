# p.264 ~ 274
# 최대 2달까지만 다운로드를 할 수 있어 9-10월, 11-12월로 나누어서 다운받고 합쳐야함
# 엑셀에서 데이터-필터 사용해서 측정소명-평균 없애기 / 미세먼지pm~을 미세먼지로 변경

library(dplyr)
library(readxl)
dustdata <- read_excel("~/Desktop/R/data/dust in seoul.xlsx")
str(dustdata)
dustdata_sbj <- dustdata %>% filter(측정소명 %in% c("성북구","중구"))
count(dustdata_sbj, 날짜) %>% arrange(desc(n))
count(dustdata_sbj, 측정소명) %>% arrange(desc(n))
dustdata_sb <- subset(dustdata_sbj, 측정소명 == "성북구" & 미세먼지 < 80); dustdata_sb 
#subset(데이터, 조건) | 조건절 추출
dustdata_j <- subset(dustdata_sbj, 측정소명 == "중구" & 미세먼지 < 80); dustdata_j
# 성북구와 중구 데이터가 서로 빠진것이 없으면 9줄에서 sbj 안만들고 바로 만들어도 됨
library(psych)
describe(dustdata_sb$미세먼지)
describe(dustdata_j$미세먼지)
boxplot(dustdata_sb$미세먼지, dustdata_j$미세먼지, main = "finedust comparing",
        xlab = "arrondissement", names = c("Seongbuk-gu","Jung-gu"), ylab = "measurement",
        col = c("blue","green"))
t.test(data = dustdata_sbj, 미세먼지 ~ 측정소명, var.equal = TRUE)

### t-test 가메 p.417~
예제 - 과자의 무게가 50g이 맞는지 확인하기 위해 50봉지를 구매
각각의 무게를 측정하고 평균을 구한 것 = 표본평균
실제 과자 봉지의 평균과 비교(모집단의 알려진 평균)
m = 50 #알려진 모집단의 평균
sa_1 <- rnorm(50,58,3)
boxplot(sa_1)
shapiro.test(sa_1) #정규성검사 p-value > 0.05 일 경우 유의함
t.test(sa_1, mu = m, var.equal = TRUE) # t.test(데이터, mu = 모집단의평균) | 양측 검정
t.test(sa_1, mu = m, alternative = "less", var.equal = TRUE) #단측 검정

등분산 = 모집단에서 추출된 표본이 균등하게 추출
이분산 = 추출된 표본이 특정 계층으로 편중되어 추출 | var.test(a1,a2) | p.429 참조

### 대응표본 p.431~435
중간고사 이후 과외를 받은 학생 10명의 중간-기말고사 점수를 비교
#30개 이하임을 확인
mid = c(16,20,21,22,23,22,27,25,27,28)
final = c(19,22,24,24,25,25,26,26,28,32)
a <- data.frame()
#정규성 확인
shapiro.test(mid)
shapiro.test(final)
# 0.05보다 크므로 30개 이하이지만 정규성을 띈다
귀무가설(H0) 평균의 차이가 없다.
대립가설(H1) 평균의 차이가 있다.
# 과외 후 점수의 차이가 있는지 비교
t.test(mid, final, paired = TRUE, var.equal = TRUE)
t.test(final-, paired = TRUE, var.equal = TRUE)

### 상관관계 분석 p.466~
x <- c(0,1,4,9)
y <- c(0,5,7,9)
mean(x)
mean(y)
cor(x,y,method = "pearson")

data(mtcars)
head(mtcars)
install.packages("corrplot")
library(corrplot)
car_cor <- cor(mtcars); car_cor
round(car_cor, 2) #소수점 2번째까지 표기
corrplot(car_cor) #음의 관계는 빨간색, 양의 관계는 파란색
str(car_cor)
summary(car_cor)

식사시간(독립변수)이 아이의 두뇌발달(종속변수)에 영향을 주는가?
교육시간(독립)이 직원 업무 수행(종속)에 영향을 주는가?
GDP(독립)가 여행 횟수(종속)에 영향을 주는가?
#예제
담배값(독립)이 흡연(종속)에 영향을 주는가?
귀무가설(H0) 담배값 인상과 흡연과는 차이가 없다.
대립가설(H1) 담배값 인상과 흡연과는 차이가 있다. 
x1 <- c(70,72,62,64,71,76,0,65,74,72)
y1 <- c(70,74,65,68,72,74,61,66,76,75) #담배값 인상 후
cor(x1,y1)
xy1 <- data.frame(x1, y1)
t.test(y1, x1, paired = TRUE, var.equal = TRUE, data = xy1)

### 비모수 검정(정규분포 X) p.394 chi-square test / 처음시작하는~ p.315~
H0 부모의 경제력과 자녀의 대학 진학률은 관련이 없다. 
H1 부모의 경제력과 자녀의 대학 진학률은 관련이 있다.
data <- read.csv("~/Desktop/R/data/cleanDescriptive.csv", header = TRUE)
x <- data$level2 #부모의 학력수준
y <- data$pass2 #자녀의 대학 진학 여부
a1 <- data.frame(x, y)
head(a1)
install.packages("gmodels")
library(gmodels)
CrossTable(x, y, chisq = TRUE)