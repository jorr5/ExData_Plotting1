##Set file url
downloadURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFile <- "./Data/household_power_consumption.zip"
householdFile <- "./Data/household_power_consumption.txt"
##Download and unzip file
download.file(downloadURL, downloadFile)
unzip(downloadFile, overwrite = T, exdir = "./Data")
##Read table into R accounting for missing variables
plotData <- read.table(householdFile, header=T, sep=";", na.strings="?")
##Set time variable
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)
##Generate Histogram
png(filename='plot1.png', width=480, height=480, units='px')
hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()