# Project 1 for Exploratory Data Analysis
# 11-08-2014

## load in data from downloaded "household_power_consumption.txt" file
raw_data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings='?', 
                     colClass=c("character","character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## select only data for Date 1/2/2007, 2/2/2007
data <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007"),]

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") 

## plot1 ##
dev.copy(png,file="plot1.png")
hist(data$Global_active_power,col="red", main="Global Active Power",
     xlab="Global Active Power (killowatts)")
dev.off()

