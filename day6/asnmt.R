### 연습문제 p.90
Vec1 <- rep("R", 5); Vec1
Vec2 <- seq(1,10, by = 3); Vec2
Vec3 <- rep(seq(1,10,by = 3), 3); Vec3
Vec4 <- c(Vec2, Vec3); Vec4
seq(15,25, by = 5)
Vec5 <- Vec4[seq(1,16, by = 2)]; Vec5

name <- c("최민수","유관순","이순신","김유신","홍길동")
age <- c(55,45,45,53,15)
gender <- c(1,2,1,1,1)
job <- c("연예인","주부","군인","직장인","학생")
sat <- c(3,4,2,5,5)
grade <- c("C","C","A","D","A")
total <- c(44.4,28.5,43.5,NA,27.1)
user <- data.frame(name, age, gender, job, sat, grade, total); user
hist(user$gender)
user2 <- user[seq(2,5, by = 2),]; user2

kor <- c(90,85,90)
eng <- c(70,85,75)
mat <- c(86,92,88)
Data <- data.frame(kor, eng, mat); Data
apply(Data,1,max)
apply(Data,2,max)
round(apply(Data,1,mean),2)
round(apply(Data,2,mean),2)
apply(Data,1,var)      
apply(Data,1,sd)

Data2 <- c("2017-02-05 수입3000원","2017-02-06 수입4500원",
           "2017-02-07 수입2500원"); Data2
str_length(Data2)
str_sub(Data2, 14, len -5)
str_replace_all(Data2, "[0-9]{1}","")
str_replace_all(Data2,"-","/")
paste0(Data2, collapse = ",")
