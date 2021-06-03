### p.439 ANOVA
data <- read.csv("~/Desktop/R/data/data3/three_sample.csv", header = TRUE); head(data)
summary(data)
ls(data)
data1 <- subset(data, !is.na(score), c(method, score)); data1
plot(data1$score)
barplot(data1$score)
mean(data1$score)
boxplot(data1$score)
length(data1$score)
data2 <- subset(data1, score <= 14); data2
boxplot(data2$score)
length(data2$score)
data2$method2[data2$method == 1] <- "방법1"
data2$method2[data2$method == 2] <- "방법2"
data2$method2[data2$method == 3] <- "방법3"
x <- table(data2$method2)
y <- tapply(data2$score, data2$method2, mean) #tapply(데이터, 요인, 함수)
tapply(data2$score, data2$method2, shapiro.test)
df <- data.frame(교육방법 = x, 성적 = y); df
bartlett.test(score ~ method2, data = data2) #동질성 검정
result <- aov(score ~ method2, data = data2); result
names(result)
summary(result) #anova는 summary를 반드시 해야 p-value를 확인할 수 있음
result$residuals
result$coefficients


### density
density()
str(iris)
ds_iris <- density(iris$Sepal.Width)
plot(ds_iris, main = "probability of Sepal's width")
hist(iris$Sepal.Width)
polygon(ds_iris, col = "light blue", border = "purple")
rug(iris$Sepal.Width, col = "black")

x <- iris$Sepal.Length
qqnorm(x)
qqline(x, col = "red", lwd = 2)


### API
# GET /v3/search/book HTTP/1.1
# Host: dapi.kakao.com
# Authorization: KakaoAK {REST_API_KEY}

url <- "https://dapi.kakao.com/v3/search/book"
query <- "big data"
query <- URLencode(iconv(query, to = "UTF-8"))
query_str <- sprintf("%s?target=title&query=%s", url, query); query_str
kakao_api_key <- "04d0c140cee289a38e6acb89a361abab"
auth_key_no <- sprintf("KakaoAK %s", kakao_api_key)
library(httr)
resp <-GET(query_str, add_headers("Authorization" = auth_key_no)); resp
class(resp)
resp_char <- as.character(resp)
library("jsonlite")
d = fromJSON(resp_char)
df <- data.frame(d)
txt_1 <- as.matrix(df)
write.csv(txt_1,"~/Desktop/R/day14/kakao_api.csv", row.names = FALSE)
View(df)
df[1,1]
df[1,2]
df[2,1]
library(stringr)
for (r in 1:nrow(df)) {
  for (c in 1:col(df)) {
    df[r,c] = paste(df[r,c], collapse = " ")
    df[r,c] = str_replace_all(df[r,c], ",",":")
  }
}
View(df)
df2 <- as.matrix(df)
write.csv(df2, "~/Desktop/R/day14/kakao_api_final.csv", row.names = FALSE)