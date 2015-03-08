## Download dataset "Electric power consumption" from the course website
## Unzip the file and save as "household_power_consumption.txt" into parent directory

data1 <- read.csv("../household_power_consumption.txt", sep =";")
head (data1)
dt1 <- as.Date(data1$Date, "%d/%m/%Y")

data1$dt1 <- dt1
data2 <- subset(data1, dt1 == "2007-02-01 EST"| dt1 == "2007-02-02 EST")

b <- as.character(data2$Global_active_power)
b[b=="?"] = "NA"
b1 <- as.numeric(b)
png(file = "plot1.png", bg="transparent")
hist(b1, col="red", main=paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
dev.off()
