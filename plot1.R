#Plot1

#Prepare data for plotting. 
#First, work out what lines to read

line1 <- strptime("2006-12-16 17:24:00", "%Y-%m-%d %H:%M:%S")
dataStart <- strptime("2007-02-01 00:01:00", "%Y-%m-%d %H:%M:%S")
dataStartLine <- as.numeric(dataStart - line1) * 24 * 60 
numLines <- 48 * 60 # total number of rows to read in

#Read in relevant lines of data - assuming working directory contains household_power_consumption.txt
houseData <- read.csv("household_power_consumption.txt", header=FALSE, sep=";", skip=dataStartLine,nrows=numLines)
head(houseData)

#Build a histogram on screen
par(mar=c(4,4,2,2), cex.axis=0.8,cex.lab=0.8)
#Column 3 is global active power
hist(houseData$V3, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png") ## Copy to png file 
dev.off() 

