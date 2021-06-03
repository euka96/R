hiphop <- readLines("~/Desktop/R/data/hiphop1.txt"); hiphop
hiphop1 <- str_replace_all(hiphop, "\\W", " "); hiphop1 #단어가 아닌 모든 것
hiphop2 <- extractNoun(hiphop1); hiphop2
wordcount <- table(unlist(hiphop2)); wordcount
df_word <- as.data.frame(wordcount, stringsAsFactors = FALSE); head(df_word)
df_word1 <- rename(df_word, word = Var1, freq = Freq); head(df_word1)
df_word2 <- filter(df_word1, nchar(word) >= 2); #2자 이상 단어 추출
top_20 <- df_word2 %>% arrange(desc(freq)) %>% head(20); top_20
pal <- brewer.pal(8,"Blues") [5:9]
wordcloud(words = df_word2$word, freq = df_word2$freq, min.freq = 10,
          max.words = 100, random.order = FALSE, rot.per = .1, scale = c(4,0.3),
          colors = pal, family = "AppleGothic")

dev.new() #새 창 띄우기
display.brewer.all() #워드 클라우드 색 조합 목록 보기

### dplyr 패키지 함수
filter(mtcars, cyl == 4)
head(arrange(mtcars, wt))
head(select(mtcars, am,gear))
head(mutate(mtcars, years = "1974"))
distinct(mtcars, cyl)
summarize(mtcars, cyl_mean = mean(cyl), cyl_min = min(cyl), cyl_max = max(cyl))
sample_n(mtcars, 10)
group_by(mtcars, cyl) %>% summarize(n())

# 연습문제 p.248
middle_mid_exam <- read_xlsx("~/Desktop/R/data/middle_mid_exam.xlsx"); middle_mid_exam
MATHEMATICS <- dcast
group_by(middle_mid_exam, CLASS) %>%
  summarise(mean_eng = mean(ENGLISH), sum_eng = sum(ENGLISH),
            mean_math = mean(MATHEMATICS), sum_math = sum(MATHEMATICS))
middle_mid_exam %>% filter(CLASS == "class1" & MATHEMATICS >= 80) %>% summarise(n())
arrange(middle_mid_exam, desc(MATHEMATICS), ENGLISH)                
middle_mid_exam %>% filter(MATHEMATICS >= 80 & ENGLISH >= 85) %>% summarise(n())


###
ck <- read_xlsx("~/Desktop/R/data/치킨집_가공.xlsx")
address <- substr(ck$소재지전체주소, 11,16); head(address)
address_num <- gsub("[0-9]","",address)
address_trim <- gsub(" ","", address_num); head(address_trim)
address_count <- address_trim %>% table() %>% data.frame(); address_count
# = data.frame(table(address_trim))
# treemap(데이터세트, index = 구분열, vSize = 분포열, vColor = 색상, title = 제목)
treemap(address_count, index = ".", vSize = "Freq",
        title = "서대문구 동별 치킨집 분포", fontfamily.labels = "AppleGothic")

hospital <- read_xlsx("~/Desktop/R/data/hospital.xlsx"); hospital
gn_street <- substr(hospital$도로명전체주소, 11,16); head(gn_street)
gn_street1 <- gsub("[0-9길 ]","",gn_street); gn_street1
gn_street_count <- data.frame(table(gn_street1)); gn_street_count
treemap(gn_street_count, index = "gn_street1", vSize = "Freq",
        title = "Hospital numbers of Gangnam arrondissement by street", fontfamily.labels = "AppleGothic")

hospital <- read_xlsx("~/Desktop/R/data/hospital.xlsx"); hospital
gn_quartier <- substr(hospital$소재지전체주소, 11,14); head(gn_quartier)
gn_quartier1 <- gsub(" ","", gn_quartier); head(gn_quartier1)
gn_quartier_count <- gn_quartier1 %>% table() %>% data.frame(); gn_quartier_count
treemap(gn_quartier_count, index = ".", vSize = "Freq",
        title = "Hospital numbers of Gangnam arrondissement by quartier", fontfamily.labels = "AppleGothic")


data("GNI2014")
??GNI2014
ls(GNI2014)
head(GNI2014)
treemap(GNI2014, index = c("continent","iso3"), vSize = "population",
        title = "World population", bg.labels = "blue", fontfamily.labels = "AppleGothic")

GNI2014_po <- head(arrange(GNI2014, desc(population)), 20); GNI2014_po
treemap(GNI2014_po, index = c("continent", "iso3"), vSize = "population",
        title = "World population top 20 in 2014", bg.labels = "white", fontfamily.labels = "AppleGothic")

GNI2014_per <- mutate(GNI2014, per_pop = GNI2014$GNI / GNI2014$population) %>%
  arrange(desc(per_pop)) %>% head(20); GNI2014_per
treemap(GNI2014_per, index = c("country", "continent"), vSize = "per_pop",
        title = "GNI per capita in 2014", border.col = 'white', fontfamily.labels = "AppleGothic")