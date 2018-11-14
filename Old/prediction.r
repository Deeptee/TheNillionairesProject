install.packages("readxl")
library(readxl)
dummydata <- read_excel("D:/projects/techtrix/testdatafinal.xlsx")
data(dummydata)
library(ggplot2)
##plot
g <- ggplot(dummydata, aes(x = location, y = standing))
g <- g + xlab("location")
g <- g + ylab("number of standing people")
g <- geom_point(size = 6, colour = "black", alpha = 0.2)
g <- geom_point(size = 5, colour = "blue", alpha = 0.2)
##g <- g + geom_smooth(method = "lm", colour = "black")
g

h <- ggplot(dummydata, aes(x = dummydata$arrivaltime, y = dummydata$standing))
h <- h + xlab("arrivaltime")
h <- h + ylab("number of standing people")
h <- geom_point(size = 6, colour = "black", alpha = 0.2)
h <- geom_point(size = 5, colour = "blue", alpha = 0.2)
##h <- h + geom_smooth(method = "lm", colour = "black")
h
time2 <- as.POSIXlt(dummydata$arrivaltime)

set.seed(123)
split <- sample(seq_len(nrow(dummydata)), size = floor(0.75 * nrow(dummydata)))
trainData <- dummydata[split, ]
testData <- dummydata[-split, ]
head(trainData)

predictionModel <- lm(standing ~ arrivaltime + location, data = trainData)
summary(predictionModel)

prediction <- predict(predictionModel, newdata = testData)

head(prediction)

SSE <- sum((testData$standing - prediction) ^ 2)
SST <- sum((testData$standing - mean(testData$standing)) ^ 2)
1 - SSE/SST

predict(predictionModel, newdata = data.frame(location= "Panipokhari", arrivaltime= "1899-12-31 13:40:00") )
