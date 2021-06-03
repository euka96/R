#Q1. mpg 데이터 세트를 데이터 프레임 형식으로 저장하시오.
#mpg <- as.data.frame(ggplot2::mpg)
#1) mpg 데이터세트를 co_mpg 사본으로 저장, 저장한 co_mpg 데이터 세트를 이용하여 class항목 중 "suv"와 "compact" 를 추출하시오.
#2)(추출한 각 변수를 co_suv와 co_compact로 저장)
#3)"suv"와 "compact"의 '도시 및 고속도로 통합 연비' 평균을 구해보세요.

library(ggplot2)
rm(list=ls())
mpg <- as.data.frame(ggplot2::mpg)
co_mpg <- mpg
co_mpg$tot <- (co_mpg$cty + co_mpg$hwy)/2 # 통합 연비 변수 만들기
co_compact <- co_mpg[co_mpg$class == "compact",] # compact 추출
co_suv <- co_mpg[co_mpg$class == "suv",] # suv 추출
mean(co_compact$tot) # compact의 tot 평균 산출