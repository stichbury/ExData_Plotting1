#Plot4

#Prepare data for plotting. 
#First, work out what lines to read

line1 <- strptime("2006-12-16 17:24:00", "%Y-%m-%d %H:%M:%S")
dataStart <- strptime("2007-02-01 00:01:00", "%Y-%m-%d %H:%M:%S")
dataStartLine <- as.numeric(dataStart - line1) * 24 * 60 
numLines <- 48 * 60 # total number of rows to read in

#Read in relevant lines of data - assuming working directory contains household_power_consumption.txt
houseData <- read.csv("household_power_consumption.txt", header=FALSE, sep=";", skip=dataStartLine,nrows=numLines)
head(houseData)


plot.new()
png(filename = "plot4.png") 

par(mfrow=c(2,2), mar=c(4,4,2,2), col="black", cex.axis=0.8,cex.lab=0.8)

##--------------------------------------
## Plot top left (as per plot 2 - column 3 is global active power)
plot(houseData$V3, type="l", xaxt = "n", xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1,numLines/2,numLines), labels=c("Thu", "Fri", "Sat"))


##--------------------------------------
##Plot top right. Column 5 is voltage

plot(houseData$V5, type="l", xaxt = "n", xlab="datetime", ylab="Voltage")
axis(1, at=c(1,numLines/2,numLines), labels=c("Thu", "Fri", "Sat"))


##--------------------------------------
## Plot bottom left (as per plot 3)
plot(houseData$V7, type="n", xaxt = "n", xlab="", ylab="Energy sub metering")

#Column 7 is submetering 1
lines(houseData$V7)
#Column 8 is submetering 2
lines(houseData$V8, col="red")
#Column 9 is submetering 2
lines(houseData$V9, col="blue")

#Legend
legend("topright", lty=1 , box.col="white", col = c("black", "red", "blue"), cex=0.7, legend = c("Sub_metering_1", "Sub_metering_1", "Sub_metering_3"))

#Add x axis label
axis(1, at=c(1,numLines/2,numLines), labels=c("Thu", "Fri", "Sat"))

##--------------------------------------
## Plot bottom right. Column 4 is Global_reactive_power
plot(houseData$V4, type="l", xaxt = "n", xlab="datetime", ylab="Global_reactive_power")
axis(1, at=c(1,numLines/2,numLines), labels=c("Thu", "Fri", "Sat"))


dev.off() 


