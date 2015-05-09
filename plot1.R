#read in data

power <- read.csv("household_power_consumption.txt", sep = ";")

#get rows with dates 2007-02-01 and 2007-02-02
power$Date <- strptime(power$Date, "%d/%m/%Y")
power$Date <- as.Date(power$Date)
power <- subset(power, Date == "2007-02-01" | Date == "2007-02-02" )

#convert factor to character before numeric
power$Global_active_power <- as.character(power$Global_active_power)
power$Global_active_power <- as.numeric(power$Global_active_power)

hist(power$Global_active_power, main = "Global Active Power", col = "red",
     xlab = "Global Active Power (kilowatts)")

#save plot to png
    #set graphic device to png
png(filename = "plot1.png", width =480, height = 480, units = "px")

hist(power$Global_active_power, main = "Global Active Power", col = "red",
     xlab = "Global Active Power (kilowatts)")

#turn device off to write to file in png()
dev.off()

