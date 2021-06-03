## 사람/시설 도시별 비교
#anova
total1 <- read.csv("~/Desktop/R/F4/total1.csv")
bartlett.test(total1$인구.시설 ~ total1$지역구분)
result_aov <- aov(total1$인구.시설 ~ total1$지역구분)
summary(result_aov)
par(family = "AppleGothic")
TukeyHSD(result_aov)
plot(TukeyHSD(result_aov))

#t-test
country <- subset(total1, 지역구분 == "지방"); country
metro <- subset(total1, 지역구분 == "광역시"); metro
capital <- subset(total1, 지역구분 == "수도권"); capital
#지방-수도권
var.test(country$인구.시설,capital$인구.시설)
t.test(country$인구.시설,capital$인구.시설, alter = "two.sided")
t.test(country$인구.시설,capital$인구.시설, alter = "greater")
t.test(country$인구.시설,capital$인구.시설, alter = "less")
#지방-광역시
var.test(country$인구.시설,metro$인구.시설)
t.test(country$인구.시설,metro$인구.시설, alter = "two.sided")
t.test(country$인구.시설,metro$인구.시설, alter = "greater")
t.test(country$인구.시설,metro$인구.시설, alter = "less")
#수도권-광역시
var.test(capital$인구.시설,metro$인구.시설)
t.test(capital$인구.시설,metro$인구.시설, alter = "two.sided")
t.test(capital$인구.시설,metro$인구.시설, alter = "greater")
t.test(capital$인구.시설,metro$인구.시설, alter = "less")


##시도별 분석
#kruskal
final <- read.csv("~/Desktop/R/F4/final.csv")
bartlett.test(인구.시설 ~ 도시, data = final)
kruskal.test(인구.시설 ~ 도시, data = final)
library(dunn.test)
dunn.test(final$인구.시설, final$도시, method = "bonferroni")