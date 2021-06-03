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