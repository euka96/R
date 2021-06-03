#문제1] 0_group.csv 파일을 열어서 group_df로 저장
group_df <- read.csv("~/Desktop/R/data/0_group.csv")
#문제2]group_df 6개 정도 데이터 확인
head(group_df)
#문제3]group_df 데이터 속성 확인
str(group_df)

#문제4] 각 변수들 간의 관계를 확인 할 수 있는
# 상관관계 분석을 나타내어라.
# 명령어 입력
cor.test(group_df$group, group_df$age)
cor.test(group_df$group, group_df$sex)
cor.test(group_df$group, group_df$level)
cor.test(group_df$age, group_df$sex)
cor.test(group_df$age, group_df$level)
cor.test(group_df$sex, group_df$level)
cor(group_df)
#문제5]상관관계 결과 보고 각 변수에 대한 해석
# 설명이 필요해요
여러 변수들 중 group과 level 변수간만 유일하게 p value가 0.04191로 아슬하게
유의미 했으며, cor값이 0.3869856으로 그다지 높은 상관관계가 있지 않다. 

# 문제6]group에 따른 level 결과를 회귀식을 완성하여 group_lm으로 저장
group_lm <- lm(data = group_df, level ~ group)

# 문제7]회기식에 대한 해석
summary(group_lm)
p-값이 0.0419로 해당 regression이 통계적으로 유의하다. 그러나 adjusted r-squared값이
0.1171로 회귀식의 설명력은 굉장히 낮아 데이터를 적절하게 설명하지 못한다.
group은 명목척도이며, level은 등간척도로 regression을 할 수 없음
