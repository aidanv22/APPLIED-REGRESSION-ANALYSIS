# 1
data = read.table('SLR2.csv', sep=',', header=T)#reads in the data set Intro_data

regmod = lm(Achievement~Readiness, data=data)#regresses response 'Achievement' on predictor 'Readiness'
summary(regmod)#provides regression model statistics

#2
confint(regmod, level=0.95)#gives 95% CI for slope and intercept.

#3
anova(regmod)#anova output of regression model
