## Plot3.r
## Pls note top right legend does not fully appear in PNG file if using dev.copy due to 480x480 dimensions
## so PNG() is used.

readData<- read.table("household_power_consumption.txt", sep=';', na.strings="?", header=TRUE )

##Collect Subset
readData.sub<- readData[readData$Date %in% c("1/2/2007", "2/2/2007"),]

## Very Important that below is %Y otherwise the error is received as
##    Error in plot.window(...) : need finite 'xlim' values
##    In addition: Warning messages:
##      1: In min(x) : no non-missing arguments to min; returning Inf
##      2: In max(x) : no non-missing arguments to max; returning -Inf
readData.sub$CombinedDateTime <- strptime(paste(readData.sub$Date, readData.sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Plot & ##Write to file
png("plot3.png", width=480, height=480)
plot(readData.sub$CombinedDateTime, readData.sub$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(readData.sub$CombinedDateTime, readData.sub$Sub_metering_2, type="l",  col="red")
lines(readData.sub$CombinedDateTime, readData.sub$Sub_metering_3, type="l",  col="blue")

legend("topright", lty=1, lwd=3,  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()
