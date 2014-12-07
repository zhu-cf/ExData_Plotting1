## Computer Specifications: 
## OSX 10.9.2, 2Gb RAM, R3.1.2
##########################



##### Please make sure you've put #####
##### the .txt data under current #####
##### working directory           #####

# How much RAM does it need? 
dataScale <- 2075259*(10*8+8*8+7*8)/2^20 #char,char,num*7coln
approxRAM <- dataScale * 2

# Reading and subsetting
colClasses <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
entireTable <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?", colClasses = colClasses )
data <- entireTable[entireTable$Date=="1/2/2007"|entireTable$Date=="2/2/2007",]



######## plot4
png(file = "./plot4.png")
par(mfcol = c(2,2))

dateTime <- paste(data$Date,data$Time)
date.Time <- strptime(dateTime,"%d/%m/%Y %H:%M:%S")
GAP <- data$Global_active_power
plot(date.Time,GAP,type = "l", ylab = "Global Active Power (kilowatts)",xlab = "")

plot(date.Time,data$Sub_metering_1,type = "l", ylab = "Energy sub metering",xlab = "")
lines(date.Time,data$Sub_metering_2, col = "red")
lines(date.Time,data$Sub_metering_3, col = "blue")
legendChar <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright", legend = legendChar, col = c("black","red","blue"),lty = 1,bty = "n")

plot(date.Time,data$Voltage,type = "l", ylab = "Voltage")

plot(date.Time,data$Global_reactive_power,type="l", ylab = "Global_reactive_power")
dev.off()