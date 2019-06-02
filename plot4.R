
## reat txt file
powerConsData = read.csv2("week1/household_power_consumption.txt", header = TRUE, sep = ";")


## convert columns to correct class

powerConsData$Date <- as.Date(powerConsData$Date, format="%d/%m/%Y")
powerConsData$Time <- format(powerConsData$Time, format="%H:%M:%S")
powerConsData$Global_active_power <- as.numeric(powerConsData$Global_active_power)
powerConsData$Global_reactive_power <- as.numeric(powerConsData$Global_reactive_power)
powerConsData$Voltage <- as.numeric(powerConsData$Voltage)
powerConsData$Global_intensity <- as.numeric(powerConsData$Global_intensity)
powerConsData$Sub_metering_1 <- as.numeric(powerConsData$Sub_metering_1)
powerConsData$Sub_metering_2 <- as.numeric(powerConsData$Sub_metering_2)
powerConsData$Sub_metering_3 <- as.numeric(powerConsData$Sub_metering_3)


DateTime1 <- strptime(paste(powerConsData$Date, powerConsData$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
powerConsData <- cbind(powerConsData, DateTime1)

## subset data from 2007-02-01 and 2007-02-02
subsetdata <- subset(powerConsData, Date == "2007-02-01" | Date =="2007-02-02")

## plot and combine 4 graphs 
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))
with(subsetdata, plot(DateTime1, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(subsetdata, plot(DateTime1, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
with(subsetdata, plot(DateTime1, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(subsetdata$DateTime1, subsetdata$Sub_metering_2,type="l", col= "red")
lines(subsetdata$DateTime1, subsetdata$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
with(subsetdata, plot(DateTime1, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))


dev.off()
