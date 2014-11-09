# Project 1 for Exploratory Data Analysis
# 11-08-2014

## load in data from downloaded "household_power_consumption.txt" file
raw_data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings='?', 
                     colClass=c("character","character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## select only data for Date 1/2/2007, 2/2/2007
data <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007"),]

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") 

## plot4 ##
dev.copy(png,file="plot4.png")

par(mfrow=c(2,2))

with(data, plot(DateTime, Global_active_power, type="l", xlab="", 
                ylab="Global Active Power"))

with(data, plot(DateTime, Voltage, type="l", xlab="datetime", 
                ylab="Voltage"))

plot(data$DateTime,data$Sub_metering_1, type="n",xlab="",ylab="Energy sub metering")
points(data$DateTime,data$Sub_metering_1,type="l",col="black")
points(data$DateTime,data$Sub_metering_2,type="l",col="red")
points(data$DateTime,data$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1, col=c("black","red","blue"), cex=0.75,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

with(data, plot(DateTime, Global_reactive_power, type="l", xlab="datetime", 
                ylab="Global_reactive_power"))
dev.off()