## Download dataset "Electric power consumption" from the course website
## Unzip the file and save as "household_power_consumption.txt" into parent directory

data1 <- read.csv("../household_power_consumption.txt", sep =";")

dt1 <- as.Date(data1$Date, "%d/%m/%Y")

data1$dt1 <- dt1
data2 <- subset(data1, dt1 == "2007-02-01 EST"| dt1 == "2007-02-02 EST")

dates <- data2$Date
times <- data2$Time
x <- paste(dates, times)
Y <- strptime(x, "%d/%m/%Y %H:%M:%S")

s1 <- as.character(data2$Sub_metering_1)
s1[s1=="?"] = "NA"
sm1 <- as.numeric(s1)


s2 <- as.character(data2$Sub_metering_2)
s2[s2=="?"] = "NA"
sm2 <- as.numeric(s2)


s3 <- as.character(data2$Sub_metering_3)
s3[s3=="?"] = "NA"
sm3 <- as.numeric(s3)

png(file = "plot3.png", bg="transparent")
with(data2, plot(Y, sm1, type ="l", xlab = "", ylab = "Energy sub metering"))
lines(Y, sm2, col = "red")
lines(Y, sm3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()