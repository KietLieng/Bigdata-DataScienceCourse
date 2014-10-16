
install.packages("caret")
install.packages("rpart")
install.packages("tree")
install.packages("randomForest")
install.packages("e1071")
install.packages("ggplot2")

library(rpart)
training <- read.csv("assignment5/seaflow_21min.csv")
summary(training)
form1 <- formula(pop ~ fsc_small + fsc_perp + fsc_big + pe + chl_big + chl_small)
model <- rpart(form1, method="class", data=training)
print(model)
