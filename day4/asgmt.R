# 파일 디렉터리 설정
setwd()
# 작업 디렉터리 설정을 확인하는 명령어
getwd()
# 변수 목록을 확인하는 명령어
ls()
# 현재 로드된 패키지 목록을 확인 하는 명령어
search()
# 패키지 설치를 설치하는 명령어
install.packages()
# 설치된 패키지를 확인하는 명령어
library()
# r을 실행하는 단축키
ctrl+r
# r studio를 실행하는 단축키
ctrl+enter
# r console 창을 리셋하는 명령어
ctrl+l
# 집계를 확인 하는 함수는?
table()
# r의 설치된 패키지 파일경로를 확인하는 명령어
.libPaths()
# stringr 패키지를 설치시 명령문을 작성하시오.
install.packages("stringr")
# 현재 변수 목록 확인 현재 사용중인 변수중 ex) k1이라는 변수를 삭제하는 방법
rm(k1)
# 현재 환경창에 사용중인 변수 모두를 삭제하는 명령어
rm(list = ls())
# 현재 사용중인 패키지 확인

# r에서 help 패키지 stringr을 찾고 자 할 때 사용하는 명령어는?
??stringr
# r의 함수 중 iris라는 데이터 세트가 “몇 행과 몇 열” 정보를 알려주는 함수
dim(iris)
str(iris) #데이터세트의 대략적인 정보
nrow(iris) #행의 갯수
# iris의 앞부분의 데이터 6개만 보여주는 명령어
head(iris)
tail(iris) #마지막 6개만 보여주는 명령어
tail(iris, 2) #마지막 2개만 보여주는 명령어
# 기본 통계량을 알려주는 함수
summary()

=====

#tolower(names(iris)) | 대문자를 소문자로 변환
#renames(변수, 기존이름 = 새이름, ...)변수 명을 변경하는 함수 / dplyr 패키지 로드

# 작업형 iris 데이터 셋을 이용하여
# 붓꽃 종이 versicolor 이면서 Sepal.Length 이 6이상인 데이터를 color로 저장
color <- iris[iris$Species == "versicolor" & iris$Sepal.Length >= 6,]; color
color1 <- subset(iris$Species == "versicolor" & iris$Sepal.Length >= 6); color1
color2 <- iris %>% filter(Species == "versicolor" & Sepal.Length >= 6); color2
# 저장한 변수 중 Sepal.Length과 Petal.Length 열만 저장하여 csv로 저장
library(dplyr)
asgmt <- color %>% select(Sepal.Length, Petal.Length); asgmt
# select() %>% head(2) | 위의 2개만 추출
asgmt1 <- iris %>% select(c(1,3)); asgmt1
asgmt2 <- iris[,c(1,3)]; asgmt2
write.csv(asgmt,"~/Desktop/R/day4/asgmt.csv")
read.csv("~/Desktop/R/day4/asgmt.csv")
# select - filter - head 순으로