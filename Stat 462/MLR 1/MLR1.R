
PT = read.table('ProjectTalent1.csv', sep=',', header=T)#read in Project talent data

library(car)
library(rsq)
# 1,2,3,4
mr = lm(Math~Reading+Mech+Social+SES, data=PT)#full model
summary(mr)

#5
mr2 = lm(Math~Social+SES, data=PT)#controlled model
summary(mr2)
anova(mr2,mr)

#6
rsq.partial(mr2,mr)#partial R-square for adding adding Sociability and SES to model already w/Reading and Mechanical Reasoning

#7
mr4 = lm(Math~Mech+Social+SES+Reading, data=PT) #model with reading added last
anova(mr)
anova(mr4)

