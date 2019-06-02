
## reat txt file
powerConsData = read.csv2("work_ex/exporartory_data_analysis/week1/household_power_consumption.txt", header = TRUE, sep = ";")


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

## subset data from 2007-02-01 and 2007-02-02
subsetdata <- subset(powerConsData, Date == "2007-02-01" | Date =="2007-02-02")

## plot histogram of global active power for those 2 days
png("plot1.png", width=480, height=480)
hist(subsetdata$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
