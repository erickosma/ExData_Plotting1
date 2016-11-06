########load library 
library(data.table)
library(datasets)

##include file to stract zip
source(file="unzip.R")



#currentDir <- "/home/zoy/BI/prova/exploratory"
setwd(currentDir)
extractFile()
##household_power_consumption.txt


data <- fread("household_power_consumption.txt", na.strings = "?")

#convert Date variable into Date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")
#data$Date
#subset the two days of interest
startData <- data[data$Date == "2007-02-01"] 
endData <- data[data$Date == "2007-02-02"]        
myData <- rbind(startData, endData)       
#myData
#plot Global Active Power in a histogram saved as jpg
globalActivePower <- as.numeric(myData$Global_active_power)
#globalActivePower
##create png
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, col = "red", main = "Global Active Power",  xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
