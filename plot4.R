library(dplyr)
library(lubridate)

# Code assumes that data is available on disk and unzipped. If not, run these lines:
# download file
# fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download.file(fileURL, dest="household_power_consumption.zip", mode="wb")
# unzips file
# unzip("household_power_consumption.zip")

#reads file and correct date
rawdata <- tbl_df(read.table("household_power_consumption.txt",header=TRUE, sep = ";", na.strings = "?"))
data <- filter(rawdata, Date == "1/2/2007" | Date == "2/2/2007")

data$Time <- paste(data$Date, data$Time, sep = " ")
data$Time <- strptime(data$Time,"%d/%m/%Y %H:%M:%S")



# initiate plot
# plots weekday in local language! 

png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
#plot2 
plot(data$Time, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")

# new plot for Voltage
plot(data$Time, data$Voltage, xlab = "datetime", ylab = "Voltage", type="l")

#plot3
plot(data$Time, data$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

# new plot for global_reactive_power
plot(data$Time, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type="l")


# close device
dev.off()

