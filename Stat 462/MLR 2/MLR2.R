PT2 = read.table('ProjectTalent1.csv', sep=',', header=T)#read in Project talent data

library(lmtest) 
library(Hmisc)
library(nortest)
# 1
mr = lm(Math~Reading+Mech+Social+SES, data=PT2)#full model
predict(mr, interval= "confidence", se.fit=F, newdata=data.frame(Reading=37, Mech=15, Social=10, SES=103))

#2
predict(mr, interval= "prediction", se.fit=F, newdata=data.frame(Reading=37, Mech=15, Social=10, SES=103))

#3
confint(mr) #95 CI for the model slopes

#4
rcorr(as.matrix(PT2))

#5
#Normality check with QQ plot and Anderson-Darling Test
qqPlot(mr$residuals, main="QQ Plot")
ad.test(mr$residuals)

#6
#Constant variance check with Res vs Fits plot and Breusch Pagan test
plot(mr$fitted,mr$residuals, ylab="Residuals", xlab="Fitted Values")
abline(0,0)
bptest(mr)#Breusch-Pagan for constant variance

#7
#Independence check
plot(mr$residuals, main="Residuals vs Order")
acf(mr$residuals)
dwtest(mr)
