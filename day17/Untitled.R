### 추세선 그리기
library(ggplot2)
ggplot(economics, aes(x = date, y = psavert)) + geom_line()
a.lm <- lm(data = economics, psavert ~ date)
summary(a.lm)
a.lm$coef
plot(a.lm)
ggplot(economics, aes(x = date, y = psavert)) + geom_line() +
  geom_abline(intercept = 12.18671, slope = -0.000544)

### 산점도
install.packages("lattice")
library(lattice)
library(datasets)
str(airquality)
xyplot(Ozone ~ Wind, data = airquality)
range(airquality$Ozone, na.rm = TRUE)
xyplot(Ozone ~ Wind | Month, data = airquality)
xyplot(Ozone ~ Wind | Day, data = airquality)
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))
xyplot(Ozone ~ Wind | factor(Month), data = airquality, layout = c(5,1))
xyplot(Ozone+Solar.R ~ Wind | factor(Month), data = airquality, layout = c(5,1),
       col = c("blue", "red"))
