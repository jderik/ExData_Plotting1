## Plot 2.r
readData<- read.table("household_power_consumption.txt", sep=';', na.strings="?", header=TRUE )

##Collect Subset
readData.sub<- readData[readData$Date %in% c("1/2/2007", "2/2/2007"),]

## Very Important that below is %Y otherwise the error is received as
##    Error in plot.window(...) : need finite 'xlim' values
##    In addition: Warning messages:
##      1: In min(x) : no non-missing arguments to min; returning Inf
##      2: In max(x) : no non-missing arguments to max; returning -Inf
readData.sub$CombinedDateTime <- strptime(paste(readData.sub$Date, readData.sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Plot
plot(readData.sub$CombinedDateTime, readData.sub$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", 
     , xlab="", col="black")

##Write to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
