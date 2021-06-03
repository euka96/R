alert11 <- readLines("~/Desktop/R/data/oracle_alert_testdb.log"); alert11
alert12 <- grep("^ORA-+", alert11, value = TRUE); alert12
alert13 <- substr(alert12, 1, 9); alert13
errorcount <- table(alert13); errorcount
sort(decreasing = TRUE, errorcount)
wordcloud2(errorcount, color = "random-light", fontFamily = "Ariel")

palette <- brewer.pal(7, "Set1"); palette
wordcloud(names(errorcount), freq = errorcount, scale = c(5,0.5), rot.per = 0.5, 
          min.freq = 3, random.order = FALSE, random.color = TRUE, colors = palette)

data1 <- readLines("~/Desktop/R/data/좋아하는과일3.txt", encoding = "UTF-8"); data1
data1 <- unique(data1); data1 # 중복되는 데이터 제거
data1 <- str_replace_all(data1, "[^[:alpha:][:blank:]]",""); data1 #alpha = 알파벳
data2 <- extractNoun(data1); data2
data2 <- lapply(data2, unique); data2 # lapply 각 행 안에서 함수 실행
data3 <- unlist(data2); data3
data4 <- Filter(function(x) {nchar(x) <= 20 & nchar(x) > 1}, data3);data4
data5 <- gsub("\\.","",data4); data5 # 특정 단어 삭제 및 대체 | gsub("찾는단어","바꿀단어","찾을위치)
data5 <- gsub("\\'","",data5); data5
data5 <- gsub("\\^.","",data5); data5
wordcount <- table(data5); wordcount
sort(wordcount, decreasing = TRUE)

txt <- readLines("~/Desktop/R/data/1_gsub.txt"); txt
cnt_txt <- length(txt); cnt_txt
for (i in 1 : cnt_txt) {
  data6 <- gsub((txt[i]), "", data4)
}; data6
data7 <- Filter(function(x) {nchar(x) <= 10 & nchar(x) >1}, data5); data7
wordcount <- table(data7); wordcount
sort(wordcount, decreasing = TRUE)
palette <- brewer.pal(9, "Set3")
wordcloud(names(wordcount), freq = wordcount, scale = c(4,1), rot.per = 0.5,
          min.freq = 1, random.order = FALSE, random.color = TRUE,
          family = "AppleGothic", colors = palette)

### 과제
jeju <- readLines("~/Desktop/R/data/110_jeju1.txt"); jeju
jeju1 <- unique(jeju); jeju1
jeju2 <- str_replace_all(jeju1, "[^[:alpha:][:blank:]]",""); jeju2
jeju3 <- extractNoun(jeju2); jeju3
jeju4 <- lapply(jeju3, unique); jeju4
jeju5 <- unlist(jeju4); jeju5
jeju6 <- Filter(function(x) {nchar(x) <= 20 & nchar(x) > 1}, jeju5); jeju6
jeju7 <- gsub(paste(c("에코 랜드", "에 코랜드","에코랜 드"), collapse = "|"), "에코랜드", jeju6); jeju7
jeju8 <- gsub(paste(c("성산","일출봉","성산봉"), collapse = "|"),"성산일출봉", jeju7); jeju8
jeju9 <- gsub(paste(c("주상 절리","절리","주상","주상+","+절리"), collapse = "|"),"주상절리", jeju8); jeju9
jeju10 <- gsub("여행","",jeju9); jeju10
jeju11 <- gsub("경유","",jeju10); jeju11
jeju12 <- gsub("시간","",jeju11); jeju12
jeju13 <- gsub("하시","",jeju12); jeju13
jeju14 <- gsub("이용","",jeju13); jeju14
jeju15 <- gsub("있습니","",jeju14); jeju15
jeju16 <- gsub("공항","",jeju15); jeju16
jeju17 <- gsub("도착","",jeju16); jeju17
jeju18 <- gsub("코스","",jeju17); jeju18
jeju19 <- gsub("하게","",jeju18); jeju19
jeju20 <- gsub("관광지","",jeju19); jeju20
jeju21 <- gsub("정도","",jeju20); jeju21
jeju22 <- gsub("드라이브","",jeju21); jeju22
jeju23 <- gsub("연폭", "천지연폭포",jeju22); jeju23
jeju24 <- gsub("주도","제주도",jeju23); jeju24
jeju25 <- gsub("숙소","",jeju24); jeju25
jeju26 <- gsub("전망","",jeju25); jeju26
jeju27 <- gsub("사진","",jeju26); jeju27
jeju28 <- gsub("추천","",jeju27); jeju28
jeju29 <- gsub("유명","",jeju28); jeju29
jeju30 <- gsub("비교","",jeju29); jeju30
jeju31 <- gsub("마음","",jeju30); jeju31
jeju32 <- gsub("첫날","",jeju31); jeju32
jeju33 <- gsub("일정","",jeju32); jeju33
jeju34 <- gsub("다양","",jeju33); jeju34
jeju35 <- gsub("예약","",jeju34); jeju35
jeju36 <- gsub("위치","",jeju35); jeju36
jeju37 <- gsub("풍경","",jeju36); jeju37
jeju38 <- gsub("일차","",jeju37); jeju38
jeju39 <- gsub("점심","",jeju38); jeju39
jeju40 <- gsub("이곳","",jeju39); jeju40
jeju41 <- gsub("하루","",jeju40); jeju41
jeju42 <- gsub("가능","",jeju41); jeju42
jeju43 <- gsub("할인","",jeju42); jeju43
jeju44 <- gsub("근처","",jeju43); jeju44
jeju45 <- gsub(paste(c("항공","다양","유명","촬영","화장실","정보","깨끗",
                       "요금","머리","경관","생각","중간","좋습니","식당",
                       "도움","풍경","바위","출발","합니","랜드","다음","주변",
                       "둘째","가운데","같습니","렌트카","나름","마을","이동",
                       "구경","소요","경우","저녁","됩니","러브","때문","무료",
                       "대걸어서","관광","사","들이","격"),
                     collapse = "|"),"", jeju44); jeju45
howmanywords <- head(sort(table(jeju45), decreasing = TRUE), 50); howmanywords
wordcloud2(howmanywords, size = 8)


nrow(mtcars)
str(mtcars)
filter(mtcars, cyl == 4)
filter(mtcars, cyl >= 6 & mpg > 20)
head(arrange(mtcars,wt))
head(arrange(mtcars, mpg, desc(wt)))
head(select(mtcars,am,gear))
head(mutate(mtcars, years = "1974"))
head(mutate(mtcars, mpg_rank = rank(mpg)))
distinct(mtcars, cyl)
distinct(mtcars, gear)
distinct(mtcars, cyl, gear)
summarise(mtcars, cyl_mean = mean(cyl), cyl_min = min(cyl), cyl_max = max(cyl))
summarise(mtcars, mean(cyl), min(cyl), max(cyl))
gr_cyl <- group_by(mtcars, cyl)
summarise(gr_cyl, n()) # n() 갯수를 구하는 함수
summarise(gr_cyl, n_distinct(gear)) #n_distinct() 중복 값을 제외한 후 갯수를 구함
sample_n(mtcars, 10)
sample_frac(mtcars, 0.2) #sample_frac(데이터세트, 필요한 비율)
group_by(mtcars, cyl) %>% summarise(n())
mp_rank <- mutate(mtcars, mpg_rank = rank(mpg)); mp_rank
arrange(mp_rank, mpg_rank)
mutate(mtcars, mpg_rank = rank(mpg)) %>% arrange(mpg_rank)

ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + 
  xlim(3, 6) + ylim(10, 30) #x,y축 값을 2-6, 10-30까지로 제한
ggplot(data = mtcars, aes(x = gear, y = carb)) + geom_point()
df_mpg <- mutate(mpg, mean_hwy = mean(hwy))
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()

#과제
ggplot(data = mpg, aes(x = class)) + geom_bar(aes(fill = drv))
# = ggplot(mpg, aes(x = class, fill = drv)) + geom_bar()