#Project 1

##Read in
electric <- read.csv("/Users/isaacchristian/Coursera/GeneralCoursera/household_power_consumption 2.txt") 
##Create Subset
subElectric <- electric[electric$Date %in% c("1/2/2007","2/2/2007") ,]

###Plot 1

###Change column from character to numeric
activePower <- as.numeric(subElectric$Global_active_power)
###Histogram
hist(activePower, col="red", main="Global Active Power", xlab="Global Active Power in Kilowatts)")
###Copy to dev
dev.copy(png, file ="plot1.png", width=480, height=480)
dev.off()

#Plot 2
dt <- strptime(paste(subElectric$Date, subElectric$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot(dt, activePower, type="l", xlab="", ylab="Global Active Power in kilowatts")
dev.copy(png, file ="plot2.png", width=480, height=480)
dev.off()

#Plot 3
##New Subsets
subMetering1 <- as.numeric(subElectric$Sub_metering_1)
subMetering2 <- as.numeric(subElectric$Sub_metering_2)
subMetering3 <- as.numeric(subElectric$Sub_metering_3)

#Plot + Legend
plot(dt, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, subMetering2, type="l", col="red")
lines(dt, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Copy to Dev
dev.copy(png, file ="plot3.png", width=480, height=480)
dev.off()

#Plot4
#New subset + Dimensions
reactivePower <- as.numeric(subElectric$Global_reactive_power)
voltage <- as.numeric(subElectric$Voltage)
par(mfrow = c(2, 2)) 

#Plot Graphs
plot(dt, activePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dt, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dt, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, subMetering2, type="l", col="red")
lines(dt, subMetering3, type="l", col="blue")


plot(dt, reactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#Copy to Dev
dev.copy(png, file ="plot4.png", width=480, height=480)
dev.off()
