library(dplyr)
library(lubridate)

# Code assumes that data is available on disk and unzipped. If not, run these lines:
# download file
# fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download.file(fileURL, dest="household_power_consumption.zip", mode="wb")
# unzips file
# unzip("household_power_consumption.zip")

#reads file and correct date
rawdata <- tbl_df(read.table("household_power_consumption.txt",header=TRUE, sep = ";",na.strings = "?"))
data <- filter(rawdata, Date == "1/2/2007" | Date == "2/2/2007")

# transform data to numeric scale to axis. 
data$Time <- paste(data$Date, data$Time, sep = " ")
data$Time <- strptime(data$Time,"%d/%m/%Y %H:%M:%S")

# plots weekday in local language! 
# initiate plot
par(mfrow=c(1,1))
png(file="plot2.png",width=480,height=480)

# make plot
plot(data$Time, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")
# Close device!!
dev.off()

