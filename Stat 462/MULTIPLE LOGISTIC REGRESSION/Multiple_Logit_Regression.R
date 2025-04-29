MLogitR = read.table('MultLogReg.csv', sep=',', header=T)

# 1
#fit logit regression model
logit.both <- glm(SexCode ~ Height + Weight + Class, family = binomial, data = MLogitR)
summary(logit.both)
anova(logit.both, test="Chisq")
