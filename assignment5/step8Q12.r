install.packages("caret")
install.packages("rpart")
install.packages("tree")
install.packages("randomForest")
install.packages("e1071")
install.packages("ggplot2")
library(e1071)
library(caret)
library(rpart)
library(randomForest)

training <- read.csv("assignment5/seaflow_21min.csv")
training.index <- sample(1:72343, size=36171, replace=FALSE)  
trainI <- training[training.index,]
testI <- training[-training.index,]
# removing the header
testI <- head(testI, -1)
fol <- pop ~ fsc_small + fsc_perp + fsc_big + pe + chl_big + chl_small

# e1071
model <- svm(fol, data=trainI)
prediction <- predict(model, testI)

# rpart
model <- rpart(fol, data=trainI)
prediction <- predict(model, newdata=testI, type="class")

# randomForest
model <- randomForest(fol, data=trainI)
prediction <- predict(model, testI)

summary(trainI)
print(trainI$chl_small)
table(pred = prediction, true = testI$pop)
