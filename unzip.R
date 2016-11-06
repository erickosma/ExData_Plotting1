###########function unzip file if exist 
##if dont exist downlod file 
extractFile <- function(nameFile = "exdata%2Fdata%2Fhousehold_power_consumption.zip"){
    print("check if file exist")
    if (!file.exists(nameFile)) {
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        tmp_file <- nameFile
        download.file(url,tmp_file, method="curl")
    }
    print(paste("unzip file ",nameFile,"   ...."))
    unzip(nameFile)
}

