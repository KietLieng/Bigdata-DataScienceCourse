
install.packages("caret")
install.packages("rpart")
install.packages("tree")
install.packages("randomForest")
install.packages("e1071")
install.packages("ggplot2")

library(ggplot2)
training <- read.csv("assignment5/seaflow_21min.csv")
summary(training)
newFrame <- data.frame(x = training$pe, y = training$chl_small, color = training$pop)
plotme <- ggplot(data = newFrame, aes(x = x, y = y, color = color))
plotme <- plotme + geom_line()
plotme <- plotme + geom_path()
plotme
