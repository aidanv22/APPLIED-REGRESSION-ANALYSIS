cldt = read.table('ClassData.csv', sep=',', header=T)


# 1, 2, 3, 4, 5, 6
#fit logit regression model
logit <- glm(SexCode ~ Height, family = binomial, data = cldt)
summary(logit)

# 7, 8
probit <- glm(SexCode ~ Height, family = binomial(link = "probit"), data = cldt)
summary(probit)

# 9
confint.default(probit)
