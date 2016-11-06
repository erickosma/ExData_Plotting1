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



#convert and combine date and time variables
datetime <- strptime(paste(myData$Date, myData$Time),"%Y-%m-%d %H:%M:%S")
datetime <- as.POSIXct(datetime)
datetime


#plot Global Active Power across the two days and save as jpg
globalActivePower <- as.numeric(myData$Global_active_power)
globalActivePower


png("plot2.png", width = 480, height = 480)
plot(globalActivePower ~ datetime, type = "l", col = "black",  ylab = "Global Active Power (kilowatts)",  xlab = "")
dev.off()


