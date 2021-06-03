library(stringr)
library(KoNLP)
library(wordcloud2)
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
wordcloud2(howmanywords, size = 8, shape = "oval")