## Computer Specifications: 
## OSX 10.9.2, 2Gb RAM, R3.1.2
##########################

########## Code for personal understanding
#if(!file.exists("~/datasciencecoursera")){
  dir.create("~/datasciencecoursera")
}
#if(!file.exists("~/datasciencecoursera/EDA")){
#  dir.create("~/datasciencecoursera/EDA")
#}
#if(!file.exists("~/datasciencecoursera/EDA/Project1")){
#  dir.create("~/datasciencecoursera/EDA/Project1")
#}
#setwd("~/datasciencecoursera/EDA/Project1")
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./consumptionZip.zip", method = "curl")
#downloadDate <- date()
#unzip("./consumptionZip.zip") #checked file format in BASH
######################


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


####### plot1
png(file = "./plot1.png")
par(cex = 1)
GAP <- data$Global_active_power
hist(GAP,main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)" )
dev.off()

