e_quakes <- datasets::quakes
e_quakes
df<- e_quakes[,c(3,4)]
## Top 10 rows and last 10 rows
head(df,10)
tail(df,10)

##Summary o the data###

summary(df[,1])
summary(df[,2])
df$depth
df$mag
summary(df$depth)
summary(df)

###############
plot(df$depth)
plot(df$mag)
plot(df$depth, df$mag, type = "p")
plot(df)
#point and Lines
plot(df$depth[1:100], type = "l")

#Horizontal bar plot
barplot(df$mag[1:100], main = "Magnitude of eq", ylab ="Mag", col = "blue", horiz = F, axes = T )

#Histogram
hist(df$depth)
hist(df$mag)

#Single box plot

boxplot(df$mag, main="Boxplot")
boxplot.stats(df$mag)$out
mean(df$mag)
median(df$mag)

#Multiple box plot
boxplot(df,main="Multiple Boxplot")

#Depth Boxplot
boxplot(df$depth)
mean(df$depth)
median(df$depth)

#Margin of the grid(mar),
#no of rows and columns (mfrow),
#whether a board is to be included(bty)
#and position of the 
#labels(las: 1 for horizontal, las: 0, for vertical)
#bty - box around the plot ("o" means yes & "n" mean dont need)

par(mfrow=c(2,2), mar=c(2,5,2,1), las=0, bty="o")
plot(df$mag)
plot(df$mag, type = "l")
plot(df$mag, type = "b")
barplot(df$mag, main = "Magnitude", xlab = "Mag", col = "green",horiz = F, axes = T)


moments::skewness(df$mag)
moments::kurtosis(df$mag)
var(df$mag)
