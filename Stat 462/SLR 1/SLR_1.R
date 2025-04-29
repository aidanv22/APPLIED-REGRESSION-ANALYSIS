# 1
data = read.table('SLR1.csv', sep=',', header=T)#reads in the data set Intro_data
boxplot(data[,-2],xlab="Readiness", col="green") #boxplot of data in Readiness
boxplot(data[,-1],xlab="achievement", col="yellow") #boxplot of data in achievement

#2a / d
plot(Achievement~Readiness,data=data,
     main = "Scatterplot of Achievement vs Readiness (Aidan Vesci)")

abline(lm(Achievement~Readiness,data=data), col="blue")

#3a
regmod = lm(Achievement~Readiness, data=data)#regresses response 'y' on predictor 'x'
summary(regmod)#provides regression model statistics
cor(data)
