# 문제1
v1 <- 1:10; v1
v2 <- v1*2; v2
max_v <- max(v2); max_v
min_v <- min(v2); min_v
avg_v <- mean(v2); avg_v
sum_v <- sum(v2); sum_v
v3 <- v2[-5]; v3

#문제2
v4 <- seq(1,10, by = 2); v4
v5 <- rep(1, each = 5); v5
v6 <- rep(1:3, times = 3); v6
v7 <- rep(1:4, each = 2); v7
v8 <- rep(c("A","B"), each = 2); v8

#문제3
nums <- sample(1:100,10); nums
nums[which(nums > 50)]
which(nums <= 50)  
which.max(nums)
which.min(nums)
sort(nums)
sort(nums, decreasing = TRUE)
names(nums) <- c("A","B","C","D","E","F","G","H","I","J"); nums

#문제4
v9 <- seq(1,10, by = 3); v9
names(v9) <- c("A","B","C","D"); v9

#문제5
score1 <- sample(1:20, 5); score1
Friends <- c("둘리","또치","도우너","희동","듀크")
names(score1) <- Friends; score1
Friends[which.max(score1)]
Friends[which.min(score1)]
Friends[which(score1 > 10)]

