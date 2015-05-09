#read in data

power <- read.csv("household_power_consumption.txt", sep = ";")

#get rows with dates 2007-02-01 and 2007-02-02
power$Date <- strptime(power$Date, "%d/%m/%Y")
power$Date <- as.Date(power$Date)

power <- subset(power, Date == "2007-02-01" | Date == "2007-02-02" )

#convert factor to character before numeric
power$Global_active_power <- as.character(power$Global_active_power)
power$Global_active_power <- as.numeric(power$Global_active_power)

#turn date into Date and Time
power$Date <- paste(power$Date, power$Time)
power$Date <- strptime(power$Date, "%Y-%m-%d %H:%M:%S")
power$Date <- as.POSIXlt(power$Date)

#create line plot
png(filename = "plot2.png", width =480, height = 480, units = "px")
plot(power$Date, power$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = NA)
dev.off()



