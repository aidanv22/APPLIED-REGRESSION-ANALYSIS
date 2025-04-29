# install.packages("olsrr")
library(olsrr)


HW = read.table('HW6.csv', sep=',', header=T)
model = lm(Y ~ ., data=HW)

# 4, 5, 6
#Best subset routine
ols_step_best_subset(model)  

#7
#Automatic selection - Forward
ols_step_forward_p(model, p_val = 0.25)

#8
#Automatic selection - backward
ols_step_backward_p(model, p_val = 0.1)

#9
#Automatic selection - Stepwise
ols_step_both_p(model, p_enter = 0.15, p_remove = 0.15)
