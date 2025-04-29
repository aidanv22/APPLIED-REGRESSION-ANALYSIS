library(psych)
wt = read.table("HW_CatVar-1.csv", sep=',', header=T)

#1
describeBy(wt$Math, wt$Sex)

#2
model <- lm(Math ~ Sex, data = wt)
# Show the summary output
summary(model)

#3
library(ggplot2)
ggplot(wt, aes(x = Reading, y = Math, color = Sex, shape = Sex)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE, fullrange = TRUE) +
  scale_color_manual(values = c('gray', 'green')) +
  labs(
    title = "Aidan Vesci AJV5723",      # Change this to your preferred title
    x = "Reading Score",           # X-axis label
    y = "Math Score"               # Y-axis label
  ) +
  theme_minimal()

interaction_model <- lm(Math ~ Sex*Reading, data = wt)
# Show the summary output
summary(interaction_model)

#4
ggplot(wt, aes(x = Writing, y = Reading, color = Sex, shape = Sex)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE, fullrange = TRUE) +
  scale_color_manual(values = c('gray', 'green')) +
  labs(
    title = "Aidan Vesci AJV5723",      # Change this to your preferred title
    x = "Writing Score",           # X-axis label
    y = "Reading Score"               # Y-axis label
  ) +
  theme_minimal()

additive_model <- lm(Reading ~ Sex*Writing, data = wt)
# Show the summary output
summary(additive_model)

#5
# Step 1: Fit the nested models
model1 <- lm(Math ~ Reading, data = wt)              # Reduced model
model2 <- lm(Math ~ Reading + Writing, data = wt)    # Full model

# Step 2: Use ANOVA to compare them
anova(model1, model2)


# Load the package
library(rsq)

# Run the full and reduced models again
model1 <- lm(Math ~ Reading, data = wt)
model2 <- lm(Math ~ Reading + Writing, data = wt)

# Compute partial R² for Writing
rsq.partial(model2, model1)
