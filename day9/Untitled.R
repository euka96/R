# 1
class <- c(2,1,2,1,1,2); class
english <- c(98,97,86,98,80,89); english
science <- c(50,60,78,58,65,98); science
school <- data.frame(class, english, science); school
school1 <- school %>% filter(class == 1); school1
school2 <- school %>% filter(class == 2); school2
class1 <- mean(school1$science); class1
class2 <- mean(school2$science); class2
mean_science <- rbind(class1, class2); mean_science

# 2
exam <- read.csv("~/Desktop/R/data/csv_exam.csv"); exam
exam1 <- group_by(exam, class) %>% mutate(mean_math = mean(math), sum_math = sum(math),
               median_math = median(math)) %>% 
  select(class, mean_math, sum_math, median_math) %>% distinct(); exam1

# 3
exam2 <- exam; exam2
exam2[c(3,8,15),3] <- NA; exam2
mean_math <- mean(exam2$math, na.rm = TRUE); mean_math
sum_math <- sum(exam2$math, na.rm = TRUE); sum_math
median_math <- median(exam2$math, na.rm = TRUE); median_math
data.frame(mean_math, sum_math, median_math)

# 4
exam3 <- filter(exam2, !is.na(math)); exam3
exam4 <- na.omit(exam2); exam4
write.csv(exam4, "~/Desktop/R/day9/6번.csv")


# 예외처리 시 평균 사용
smp <- c(10,9,NA,8,NA); smp
smp1 <- ifelse(smp < 0, mean(smp, na.rm = TRUE), smp); smp1
na.omit() # NA가 있는 행을 삭제


# 줄기 잎 그림
exdata1 <- read_excel("~/Desktop/R/data/Sample1.xlsx"); exdata1
stem(exdata1$AGE)
stem(exam$math)
stem(exam4$math)

hist(exdata1$AGE)
barplot(exdata1$AGE)
par(mfrow = c(2,1)) #2행 1열로 겹침
hist(round(rnorm(50,75,3), 0), main = "AGE 분포") #랜덤샘플링 rnorm(갯수,평균,표준편차)
hist(round(rnorm(50,75,20), 0))

install.packages("descr")
library(descr)
freq(exdata1$SEX , plot = TRUE , main= "성별(barplot)")
dist_sex <- table(exdata1$SEX); dist_sex
barplot(dist_sex, ylim = c(0,8))
barplot(dist_sex, ylim = c(0,8), main = "BARPLOT", xlab = "SEX",
        ylab = "FREQUENCY", names = c("Female", "Male"))
barplot(dist_sex, ylim = c(0,8), main = "BARPLOT", xlab = "SEX",
        ylab = "FREQUENCY", names = c("Female", "Male"), col = c("blue","pink"))

boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT)
boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT, ylim = c(0, 60), main = "boxplot",
        names = c("17년건수","16년건수"))
boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT, ylim = c(0, 60), main = "boxplot",
        names = c("17년건수","16년건수"), col = c("green","yellow"))

y1 <- c(1:10,20,25); y1
boxplot(y1)
summary(y1)
y1_1 <- ifelse(y1 > 10, NA, y1); y1_1
boxplot(y1_1)


# 영화 후기
library(rvest)
library(stringr)
library(wordcloud2)
main_url <- "https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=187310&type=after&onlyActualPointYn=Y&onlySpoilerPointYn=N&order=sympathyScore&page="; main_url
review_list <- character()
star_list <- numeric()
date_list <- character()

page_url = 1
for (page_url in 1:10) {
  url <- paste(main_url, page_url, sep = "")
  
  content <- read_html(url)
# html_node() attribute의 name을 가져옴 / 매칭되는 한 요소만 반환(해당 이름만 가져옴)
# html_nodes() attribute의 value 추출 / 매칭되는 모든 요소 반환(tag, css 모두 가져올 경우)
  node_1 <- html_nodes(content, ".score_reple p")
  node_2 <- html_nodes(content, ".score_result .star_score em")
  node_3 <- html_nodes(content, ".score_reple em:nth-child(2)")
  
  review <- html_text(node_1)
  star <- html_text(node_2)
  date <- html_text(node_3)
  date <- as.Date(gsub("\\.","-",date))
  
  review_list <- append(review_list, review)
  star_list <- append(star_list, star)
  date_list <- append(date_list, date)
}
df <- data.frame(review_list, star_list, date_list)
colnames(df); df
getwd()
write.csv(df,"~/Desktop/R/day9/minari_review.csv")

df0 <- readLines("~/Desktop/R/day9/minari_review.csv"); df0
df1 <- unique(df0); df1
df2 <- str_replace_all(df1, "[^[가-힣] ]",""); df2
df3 <- extractNoun(df2); df3
df4 <- lapply(df3, unique); df4
df5 <- unlist(df4); df5
df6 <- Filter(function(x) {nchar(x) <= 10 & nchar(x) > 1}, df5); df6
df7 <- gsub(paste(c("영화","같다별거","뭐지"), collapse = "|"),"",df6); df7
df8 <- gsub(paste(c("봤네요윤여정정","윤여","여정","윤여정님"), collapse = "|"), "윤여정", df7); df8
df9 <- gsub("연출력","연출",df8); df9
df10 <- gsub(paste(c("마무리","엔딩"),collapse = "|"),"결말",df9); df10
df11 <- gsub(paste(c("연기력","연기"), collapse = "|"), "연기",df10); df11
hopeworks <- head(sort(table(df11), decreasing = TRUE), 100); hopeworks
wordcloud2(hopeworks, size = 0.5)



# English Review of Minari
rottom_url <- "https://www.rottentomatoes.com/m/minari/reviews?type=user"; rottom_url
rottom_review_list <- character()
rottom_star_list <- numeric()
rottom_date_list <- character()

page_url = 1
for (rottom_page_url in 1:10) {
  url <- paste(rottom_url, rottom_page_url, sep = "")
  
  rottom_content <- read_html(url)
  
  rottom_node_1 <- html_nodes(content, ".score_reple p")
  rottom_node_2 <- html_nodes(content, ".score_result .star_score em")
  rottom_node_3 <- html_nodes(content, ".score_reple em:nth-child(2)")
  
  rottom_review <- html_text(rottom_node_1)
  rottom_star <- html_text(rottom_node_2)
  rottom_date <- html_text(rottom_node_3)
  rottom_date <- as.Date(gsub("\\.","-",rottom_date))
  
  rottom_review_list <- append(rottom_review_list, rottom_review)
  rottom_star_list <- append(rottom_star_list, rottom_star)
  rottom_date_list <- append(rottom_date_list, rottom_date)
}
rottom_df <- data.frame(rottom_review_list, rottom_star_list, rottom_date_list)
colnames(rottom_df); rottom_df
getwd()
write.csv(df,"~/Desktop/R/day9/minari_rottom_review.csv")
