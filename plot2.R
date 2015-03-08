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
data2$a <- Y

b <- as.character(data2$Global_active_power)
b[b=="?"] = "NA"
b1 <- as.numeric(b)

png(file = "plot2.png", bg="transparent")
with(data2, plot(Y, b1, type ="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()