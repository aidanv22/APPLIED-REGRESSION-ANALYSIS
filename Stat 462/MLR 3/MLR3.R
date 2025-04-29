li = read.table("LifeInsurance1.csv", sep=',', header=T)
library(car)
library(ggplot2)

# 1
model = lm(LifeInsurance ~., data=li)
qqPlot(model, main="QQ Plot") #qq plot for studentized resid

# 2
leveragePlots(model) # leverage plots identify possible influential outliers

# 3
# identify Di (Cook's Distance) values > 4/n
cutoff = 4/((nrow(li)))
plot(model, which=4, cook.levels=cutoff)

#4
#create new data set with the QQplot outliers removed
li2 = li[-c(3,7), ]
#Run regression on new data set and compare the two models
model2 = lm(LifeInsurance ~., data=li2)
summary(model)
summary(model2)

ggplot(li, aes(AvgAnnualIncome, LifeInsurance)) +
  geom_point() +
  geom_smooth(method="lm", se=F, aes(color="With")) +
  geom_smooth(data = li[-c(3,7), ], method="lm", se=F, aes(color="Without"))+
  scale_colour_manual(name='',values=c("red","green")) 

ggplot(li, aes(RiskAversionScore, LifeInsurance)) +
  geom_point() +
  geom_smooth(method="lm", se=F, aes(color="With")) +
  geom_smooth(data = li[-c(3,7), ], method="lm", se=F, aes(color="Without"))+
  scale_colour_manual(name='',values=c("blue","black"))

#5
vif(lm(LifeInsurance ~., data=li))
