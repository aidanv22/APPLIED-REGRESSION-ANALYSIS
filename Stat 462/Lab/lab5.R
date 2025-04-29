library(car)
library(rsq)

bf = read.table('BodyFat.csv', sep=',', header=T)#read in BodyFat data - download and save to working directory
mr = lm(BodyFat~Triceps+Thigh+Midarm, data=bf)#full model
summary(mr)
