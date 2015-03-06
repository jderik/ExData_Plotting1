## Plot4.r

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
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))


plot(readData.sub$CombinedDateTime, readData.sub$Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(readData.sub$CombinedDateTime, readData.sub$Voltage, ylab="Voltage",type="l",  xlab="datetime")
plot(readData.sub$CombinedDateTime, readData.sub$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
  lines(readData.sub$CombinedDateTime,readData.sub$Sub_metering_2, type="l",  col="red")
  lines(readData.sub$CombinedDateTime, readData.sub$Sub_metering_3, type="l",  col="blue")
  legend("topright", lty=1, lwd=2,bty="n",  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(readData.sub$CombinedDateTime, readData.sub$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")


dev.off()
