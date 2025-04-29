
library(lmtest)
library(nortest)

# 1
data = read.table('SLR3.csv', sep=',', header=T)#reads in the data set Intro_data
model = lm(Achievement~Readiness, data=data)#regresses response 'Achievement' on predictor 'Readiness'

# residuals vs fits
plot(model$residuals~model$fitted.values, ylab ="Residuals", xlab = "Fits", main = "Scatterplot RvF - ajv5723")

# residuals vs predictors
plot(model$residuals~data$Readiness, ylab ="Residuals", xlab = "Predictor (Readiness)", main = "Scatterplot RvP - ajv5723")

#2
#Linearity
plot(data$Readiness,data$Achievement, xlab="Readiness", ylab="Achievement", main="Scatterplot HW1 data - ajv5723")
abline(model, col="green")#Model is name of regression model object from above
cor.test(data$Achievement,data$Readiness)

#3
# Normality of Residuals
hist(model$residuals, main="Histogram of Residuals")#data name precedes $
qqnorm(model$residuals, main="QQ Plot")#normality plot residuals
qqline(model$residuals)#want all or majority points fall near line
shapiro.test(model$residuals)#Shapiro-Wilk normality test

# 4
# Constant variance of Residuals
plot(model$fitted,model$residuals, ylab="Residuals", xlab="Fitted Values", main="Plot of Residuals vs. Fits (Constant Variance)")
abline(0,0)
bptest(model)#Breusch-Pagan for constant variance

#5
#Independence
plot(model$residuals, main="Residuals vs Order")
acf(model$residuals)
dwtest(model)

#6
predict(model, interval="confidence", se.fit=T, newdata=data.frame(Readiness=3))#95% CI for mean Readiness response of 3

#7
predict(model, interval="prediction", se.fit=F, newdata=data.frame(Readiness=3))#95% PI for individual readiness response of 3 No SE output

#8
predict(model, interval="confidence", se.fit=T, newdata=data.frame(Readiness=c(4,5)))#95% CI for mean readiness response of 4,5
