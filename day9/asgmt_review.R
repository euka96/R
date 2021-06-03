# 영화 후기
library(rvest)
library(stringr)
library(KoNLP)

library(wordcloud2)
main_url <- "https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=187310&type=after&onlyActualPointYn=Y&onlySpoilerPointYn=N&order=sympathyScore&page="; main_url

review_list <- character()
star_list <- numeric()
date_list <- character()

page_url = 1
for (page_url in 1:10) {
  url <- paste(main_url, page_url, sep = "")
  
  content <- read_html(url)
  
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
colnames(df)

getwd()

write.csv(df,"~/Desktop/R/day9/minari_review.csv")

df0 <- readLines("~/Desktop/R/day9/minari_review.csv")
df1 <- unique(df0)
df2 <- str_replace_all(df1, "[^[:alpha:][:blank:]]","")
df3 <- extractNoun(df2)
df4 <- lapply(df3, unique)
df5 <- unlist(df4)
df6 <- Filter(function(x) {nchar(x) <= 10 & nchar(x) >1}, df5)
df7 <- gsub(paste(c("t","tt","rn","c","ㅎ","ㅜㅜ","ㅠㅠ","영화","같습니","해서",
                    "것들이","거겠","주제","결론","정도","하게","뭔가","데이",
                    "관","같다별거","To","각자","가장","그","^뭐지","하기",
                    "람","것","그","객","근데","사","들","민","대","시"), collapse = "|"),"",df6)
df8 <- gsub(paste(c("윤여","여정","윤여정님"), collapse = "|"), "윤여정", df7)
df9 <- gsub("연출력","연출",df8)
df10 <- gsub(paste(c("마무리","엔딩"),collapse = "|"),"결말",df9)
hopeworks <- head(sort(table(df10), decreasing = TRUE), 50); hopeworks
wordcloud2(hopeworks, size = 3)