1+1
5%/%2
5%%2
10-14

sqrt(16)

5/2

x <- 10
x <- 11
y <- 3
x <- 10
x + y
x-y

x1 <- c(9,10,7) #combine
x0 <- c("7",9,10) #all num became char
y1 <- "apple"
y2 <- c("apple","banana","grape")
x1
y2

x2 <- 1:10 ; x2 #print 1 to 10

var1 <- c(1,2,5,7,8); var1
var2 <- c(1:5); var2
var1+var2
var2a <- c(1,2,5,7); var2a
var2+var2a
#seq | sequence / print continuously
var3 <- seq(1,5); var3
var4 <- seq(1,10, by = 2); var4
#by = n | print only every n multiple 
var5 <- seq(1,10, by = 3); var5

#rep  | replicate
v1 <- rep("A", times=5); v1 #AAAAA
#times=n | print n times continuously
v2 <- rep(c("A","B"), times=3); v2 #ABABAB
v3 <- rep(c("A","B"), each=2); v3 #AABB
#each=n | print n times one by one

#sample(i,j,k) | from i to j, randomly sample num/char amount k
sample(1:10,5)
sample(1:7,5, replace=TRUE, prob=1:7)
sample(1:10,3, replace=TRUE, prob=1:10)

print("Hello World!")

x <- c(1,2,3); x
mean(x)
max(x)
min(x)

xx <- c(1,2,2,3,4); x
median(x)
mean(xx)

rm(Y2) #remove / rm(list=ls()) = remove all in list
rm(list=ls())

x <- 20:30; x
# [] | index
x[1]
x[3]
x[-1]
# [-n] | print except num/char located n
x[-3:-5]
# [-m:-n] | print except num/char located m~n
rm(list=ls())

