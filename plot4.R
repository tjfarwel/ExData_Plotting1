#read in data

power <- read.csv("household_power_consumption.txt", sep = ";")

#get rows with dates 2007-02-01 and 2007-02-02
power$Date <- strptime(power$Date, "%d/%m/%Y")
power$Date <- as.Date(power$Date)

power <- subset(power, Date == "2007-02-01" | Date == "2007-02-02" )

#convert factor to character before numeric
power$Global_active_power <- as.character(power$Global_active_power)
power$Global_active_power <- as.numeric(power$Global_active_power)

power$Sub_metering_1 <- as.character(power$Sub_metering_1)
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)

power$Sub_metering_2 <- as.character(power$Sub_metering_2)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.character(power$Sub_metering_3)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

power$Voltage <- as.character(power$Voltage)
power$Voltage <- as.numeric(power$Voltage)

power$Global_reactive_power <- as.character(power$Global_reactive_power)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)

#turn date into Date and Time
power$Date <- paste(power$Date, power$Time)
power$Date <- strptime(power$Date, "%Y-%m-%d %H:%M:%S")
power$Date <- as.POSIXlt(power$Date)

png(filename = "plot4.png", width =480, height = 480, units = "px")
par(mfrow = c(2,2))
#topleft
plot(power$Date, power$Global_active_power, type = "l", 
        ylab = "Global Active Power (kilowatts)", xlab = NA)

#topright
plot(power$Date, power$Voltage,type = "l", ylab = "Voltage", xlab = "datetime")

#bottom left
plot(power$Date, power$Sub_metering_1, "l", ylab = "Energy sub metering", xlab = NA)
lines(power$Date, power$Sub_metering_2, col = "red")
lines(power$Date, power$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), lty=c(1,1,1), bty = "n")

#bottomright
plot(power$Date, power$Global_reactive_power, type="l", ylab = "Global_reactive_power", 
     xlab = "datetime")
dev.off()