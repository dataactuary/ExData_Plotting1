library(dplyr)
library(lubridate)

# Code assumes that data is available on disk and unzipped. If not, run these lines:
# download file
# fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download.file(fileURL, dest="household_power_consumption.zip", mode="wb")
# unzips file
# unzip("household_power_consumption.zip")

#reads file and correct date
data <- tbl_df(read.table("household_power_consumption.txt",header=TRUE, sep = ";",na.strings = "?"))
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

# initiate plot
png(file="plot1.png",width=480,height=480)

# make plot
hist(data$Global_active_power, main = "Global Active Power", breaks = 15, xlab = "Global Active Power (kilowatts)", col="red")
# close device!!!!
dev.off()