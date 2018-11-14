busdata <- read.csv("H:/The Nillionaires/dummydata.csv")
head(busdata)
tail(busdata)
library(ggplot2)
plot(x = busdata$Arrival.time, y = busdata$Passengers.onboarded, 
     xlab = "Time", 
     ylab="No. of passengers",
     main = "Time versus No. of Passengers")
table(busdata$Passengers.onboarded)
by(busdata$Arrival.time, busdata$Arrival.location, summary)
qplot(x = Arrival.location, data = busdata, binwidth = 1,
      xlab = ('Location'),
      ylab = ('No. of passengers'),
      color = I('purple'), fill = I('#9b607d'))
