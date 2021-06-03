### 박스플롯 | 데이터의 분포를 직사각형 상자 모양으로 표현
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()

par(mfrow = c(2,1)) # 그래프를 2행 1열로 그릴 예정
y1 <- c(1:10, 20,25); y1
summary(y1)
boxplot(y1, las = 1)
y2 <- c(50,20,3,45,5,20,15,30,9,10,20,25); y2
summary(y2)
boxplot(y2, las = 1) # las 축 방향 설정

###library로 패키지가 로드가 안된다면?
require(dplyr)
if (!require(dplyr)) {
  install.packages("dplyr")
  require(dplyr)
}

mpg_boxplot <- mpg %>% select(class, cty) %>%
  filter(class %in% c("compact","subcompact","suv")); mpg_boxplot
ggplot(data = mpg_boxplot, aes(x = class, y = cty)) + geom_boxplot()

ls(mpg)
distinct(mpg, manufacturer)
boxplot(hwy ~ manufacturer, data = mpg)

### assignment
abc <- c(100,300,150,280,310); abc
def <- c(189,200,210,190,170); def
ghi <- c(210,150,260,210,70); ghi
df_box <- data.frame(A = abc, B = def, C = ghi); df_box
summary(df_box)
boxplot(df_box, las = 1, col = cm.colors(3))
#col = cm.colors 그래프에 색을 입힘 / cm은 파스텔톤

grep_ex <- c("a.txt","A.txt","ab.txt","123.txt","ba123.txt"); grep_ex
grep("^a", grep_ex) # ^~ ~로 시작되는 원소
grep("^a", grep_ex, value = TRUE) #value | 위치 대신에 이름을 알려줌
grep("[0-9]", grep_ex, value = TRUE) #[0-9] 숫자 전부 다
grep("^[^0-9]", grep_ex, value = TRUE) #[^0-9] 0부터 9를 제외
ptn <- c("^a", "^A"); ptn
grep(paste(ptn, collapse = "|"), grep_ex, value = TRUE)

### nchar | 문자수 세기
nchar_ex1 <- "먹어도 먹어도 배고파요 ㅠㅠ... 정상입니다."
nchar(nchar_ex1)
nchar_ex2 <- c("a.txt","A.txt","ab.txt","123.txt","ba123.txt")
nchar(nchar_ex2)

### substr | 범위 안의 문자를 추출
substr('960906',3 ,5) #3부터 5까지 문자를 추출

### strsplit | 특정 문자를 기준으로 문자열을 분리
tel <- "031)123-4567"
strsplit(tel, ")") # )를 기준으로 분리

### str_extract | 특정 문자 추출 / _all | 전부 추출
str_extract("kate26jasong23liz22","[1-9]{2}") #2자 추출
str_extract_all("kate26jasong23liz22","[1-9]{2}")
string <- "kate26jasong23liz22"
str_extract_all(string, "[a-z]{3}")
str_extract_all(string, "[a-z]{3,}") #3자 이상 추출
str_extract_all(string, "[a-z]{3,5}") #3-5자 추출

### str_replace | 특정 문자를 뒤의 문자로 대체
txt4 <- c("aa.txt","ba.txt","ab.txt","123.txt")
str_replace_all(txt4,"a","z")
txt5 <- "사랑 사랑 누가 말했나~~"
str_replace(txt5, "사랑","간식")
str_replace_all(txt5, "사랑","간식")

string <- "katherine906liz2000jasong17밀크티3500"
len <- str_length(string); len
str_locate(string, "밀크티")
string_sub <- str_sub(string, 1, len -11); string_sub
string_sub <- str_sub(string,1,23); string_sub
ustr <- str_to_upper(string_sub); ustr
str_to_lower(ustr)
string_rep <- str_replace(string_sub, "katherine906", "kate96,"); string_rep
string_rep <- str_replace(string_rep, "liz2000", "sh19,"); string_rep
string_c <- str_c(string_rep, "latte3000"); string_c
string_sp <- str_split(string_c, ","); string_sp
string_vec <- c("americano2500","latte3000","caffemocha3500"); string_vec
string_join <- paste(string_vec, collapse = ", "); string_join

num <- scan()
sum(num)

### skip

titanic <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/COUNT/titanic.csv"); titanic
dim(titanic)
str(titanic)
table(titanic$age)
table(titanic$sex)
table(titanic$survived)
tab <- table(titanic$survived, titanic$sex); tab
man_survived <- tab[2,1] / (tab[1,1] + tab[2,1]); male_survived
woman_survived <- tab[2,2] / (tab[1,2] + tab[2,2]); woman_survived
barplot(tab, main = "성별에 따른 생존 여부")

setwd("~/Desktop/R/day7/") #파일 위치 저장
write.table(titanic, "titanic.txt", row.names = FALSE)
titanic_df <- read.table(file = "titanic.txt", sep = "", header = TRUE); titanic_df

### 연습문제 p.106
write.csv(titanic, "~/Desktop/R/day7/titanic.csv", row.names = FALSE)
titanicData <- read.csv("~/Desktop/R/day7/titanic.csv", header = TRUE)
str(titanicData)
head(titanicData[,-c(1,3)])

data("CO2")
CO2_df1 <- CO2 %>% filter(Treatment == "nonchilled"); CO2_df1
CO2_df2 <- CO2 %>% filter(Treatment == "chilled"); CO2_df2
write.csv(CO2_df1, "~/Desktop/R/day7/CO2_df1.csv", row.names = FALSE)
write.csv(CO2_df2, "~/Desktop/R/day7/CO2_df2.csv", row.names = FALSE)

# KoNLP 설치
.libPaths()
Sys.getenv("JAVA_HOME")
Sys.setenv(JAVA_HOME = "~/Program Files")
install.packages("rJava")
library(rJava)
install.packages("KoNLP")
library(KoNLP)
install.packages("remotes")
remotes::install_github('haven-jeon/KoNLP', upgrade = "never",
                        INSTALL_opts = c("--no-multiarch"))
library(KoNLP)

#애국가 형태소 분석
useSystemDic()
useSejongDic()
useNIADic()

# 텍스트 파일 데이터를 word_data에 할당
word_data <- readLines("~/Desktop/R/data/애국가.txt",
                       encoding = "UTF-8"); word_data
word_data2 <- sapply(word_data, extractNoun, USE.NAMES = FALSE); word_data2
# = word_data2 <- extractNoun(word_data); word_data2
add_words <- c("백두산","남산","철갑","가을","하늘","달")
buildDictionary(user_dic =
                  data.frame(add_words,rep("ncn", length(add_words))),
                replace_usr_dic = TRUE)
undata <- unlist(word_data2); undata
word_table <- table(undata); word_table
gsub("공활한데","",undata2)
undata2 <- Filter(function(x) {nchar(x) >= 2}, undata)
word_table2 <- table(undata2); word_table2
sort(word_table2, decreasing = TRUE)
wordcloud2(word_table2, fontFamily = "나눔 고딕", size = 0.5,
           color = "random-light", backgroundColor = "black")