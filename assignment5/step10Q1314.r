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
length(attr(training, "ylevels"))
training.index <- sample(1:72343, size=36171, replace=FALSE)  
trainI <- training[training.index,]
testI <- training[-training.index,]
# removing the header
testI <- head(testI, -1)
fol <- pop ~ fsc_small + fsc_perp + fsc_big + pe + chl_big + chl_small

# e1071
model <- svm(fol, data=trainI)
prediction <- predict(model, testI)

str(trainI)
# rpart
model <- rpart(fol, data=trainI)
prediction <- predict(model, newdata=testI, type="class")

# randomForest
model <- randomForest(fol, data=trainI)
prediction <- predict(model, testI)

summary(trainI)
print(trainI$chl_small)

table(pred = prediction, true = testI$pop)

prediction <- predict(model, testI)
importance(model)
length(prediction)
length(testI$pop)
a <- prediction
b <-c(testI$pop)
b = replace(b, b==1, 'crytpo')
b = replace(b, b==2, 'nano')
b= replace(b, b==3, 'pico')
b = replace(b, b==4, 'synecho')
b = replace(b, b==5, 'ultra')
str(a)
str(b)
length(a)
length(b)
c <- a==b
summary(c)
# unaltered predictions
33224/(2947 + 33224)

# after alteration
training <- read.csv("assignment5/seaflow_21min.csv")
training <- training[training$file_id != 208,]
summary(training)
str(training)
training.index <- sample(1:60348, size=30174, replace=FALSE)  
trainI <- training[training.index,]
testI <- training[-training.index,]
str(trainI)
str(testI)
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

length(prediction)
length(testI$pop)
a <- prediction
b <-c(testI$pop)
b = replace(b, b==1, 'crytpo')
b = replace(b, b==2, 'nano')
b= replace(b, b==3, 'pico')
b = replace(b, b==4, 'synecho')
b = replace(b, b==5, 'ultra')
str(a)
str(b)
length(a)
length(b)
c <- a==b
summary(c)
# unaltered predictions
33224/(2947 + 33224)

# e1071 prediction
29268/(29268 + 905)

#rpart
26928/(26928+3245)

# randomForest
29227/(29227+947)
