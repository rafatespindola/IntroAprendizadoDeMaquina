insurance <- read.csv("insurance.csv", stringsAsFactors = TRUE)
str(insurance)

summary(insurance$expenses)

hist(insurance$expenses)

table(insurance$region)
table(insurance$sex)
table(insurance$smoker)

cor(insurance[c("age", "bmi", "children", "expenses")])

ins_model <- lm(expenses ~ age + children + bmi + sex + smoker + region, data = insurance)

