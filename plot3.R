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

#turn date into Date and Time
power$Date <- paste(power$Date, power$Time)
power$Date <- strptime(power$Date, "%Y-%m-%d %H:%M:%S")
power$Date <- as.POSIXlt(power$Date)

png(filename = "plot3.png", width =480, height = 480, units = "px")
plot(power$Date, power$Sub_metering_1, "l", ylab = "Energy sub metering", xlab = NA)
lines(power$Date, power$Sub_metering_2, col = "red")
lines(power$Date, power$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), lty=c(1,1,1))
dev.off()
