data(cars)
attach(cars) #내장 데이터 세트를 불러옴
head(cars)
cor.test(speed, dist)
m <- lm(dist ~ speed, data = cars); m
names(m)
fitted.values(m)
residuals(m)
plot(speed, dist)
abline(m, col = "red", lwd = "2")
dist[23:49]
m$residuals
plot(m)
m$coef
install.packages("qqplotr")