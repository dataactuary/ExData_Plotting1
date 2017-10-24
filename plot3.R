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
par(mfrow=c(1,1))
png(file="plot3.png",width=480,height=480)

plot(data$Time, data$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

# device off!
dev.off()

