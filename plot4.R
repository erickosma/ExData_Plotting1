########load library 
library(data.table)
library(datasets)


currentDir <- "/home/zoy/BI/prova/exploratory"
setwd(currentDir)
getwd()
##include file to stract zip
source(file="unzip.R")
extractFile()


##read data 
data <- fread("household_power_consumption.txt", na.strings = "?")

#convert Date variable into Date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")
#data$Date
#subset the two days of interest
startData <- data[data$Date == "2007-02-01"] 
endData <- data[data$Date == "2007-02-02"]        
myData <- rbind(startData, endData)       
myData


#convert and combine date and time variables
datetime <- strptime(paste(myData$Date, myData$Time),"%Y-%m-%d %H:%M:%S")
datetime <- as.POSIXct(datetime)
datetime

#plot Energy sub metering and save as jpg
submetering_1 <- as.numeric(myData$Sub_metering_1)
submetering_2 <- as.numeric(myData$Sub_metering_2)
submetering_3 <- as.numeric(myData$Sub_metering_3)
voltage <- as.numeric(myData$Voltage)


Global_reactive_power <- as.numeric(myData$Global_reactive_power)
Global_reactive_power

##file output
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))


#graph 1
plot(globalActivePower ~ datetime, type = "l", col = "black",ylab = "Global Active Power", xlab = "")

#graph 2
plot(submetering_1 ~ datetime,  type = "l", col = "black",xlab = "",ylab = "Energy sub metering")
lines(submetering_2 ~ datetime, col = "red")
lines(submetering_3 ~ datetime,col = "blue")

legend("topright", lty = c(1, 1, 1),  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = "n") 


# graph 3
plot(voltage ~ datetime, type = "l",  col = "black",     ylab = "Voltage",  xlab = "datetime", ylim = c(234, 246))


# graph 4
plot(Global_reactive_power ~ datetime, type = "l",  col = "black", ylab = "Global_reactive_power",  xlab = "datetime")

dev.off()

