abc <- c(100,300,150,280,310); abc
def <- c(189,200,210,190,170); def
ghi <- c(210,150,260,210,70); ghi
df_box <- data.frame(A = abc, B = def, C = ghi); df_box
summary(df_box)
boxplot(df_box, las = 1)