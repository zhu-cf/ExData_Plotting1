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


####### plot2
png(file = "./plot2.png")
par(cex = 1)
dateTime <- paste(data$Date,data$Time)
date.Time <- strptime(dateTime,"%d/%m/%Y %H:%M:%S")
plot(date.Time,GAP,type = "l", ylab = "Global Active Power (kilowatts)",xlab = "")
dev.off()
