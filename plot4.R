data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                   stringsAsFactors = FALSE)
new <- subset(data, strptime(data$Date, "%d/%m/%Y") == strptime("01/02/2007", "%d/%m/%Y") | 
                      strptime(data$Date, "%d/%m/%Y") == strptime("02/02/2007", "%d/%m/%Y"))
new$datetime <- strptime(paste(new$Date,new$Time), "%d/%m/%Y %H:%M:%S")


windows()
par(mfrow = c(2,2))

#plot(1)
plot(new$datetime, new$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")

#plot(2)
plot(new$datetime, new$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage")

#plot(3)
plot(new$datetime, new$Sub_metering_1, col ="black", type = "l", 
     xlab = "", ylab ="Energy sub metering")
points(new$datetime, new$Sub_metering_2, col ="red", type = "l")
points(new$datetime, new$Sub_metering_3, col ="blue", type = "l")

legend("topright", lwd = 1, col = c("black", "red", "blue"), bty = "n", cex = 0.9,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot(4)
plot(new$datetime, new$Global_reactive_power, type = "l" ,
     xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()