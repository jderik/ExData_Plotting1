## Plot 1.r
readData<- read.table("household_power_consumption.txt", sep=';', na.strings="?", header=TRUE )

##Collect Subset
readData.sub<- readData[readData$Date %in% c("1/2/2007", "2/2/2007"),]

## Plot historgram
hist(readData.sub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", 
  ylab="Frequency", col="red")


##Write to file
dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()
