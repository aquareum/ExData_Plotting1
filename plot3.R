data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                   stringsAsFactors = FALSE)
new <- subset(data, strptime(data$Date, "%d/%m/%Y") == strptime("01/02/2007", "%d/%m/%Y") | 
                      strptime(data$Date, "%d/%m/%Y") == strptime("02/02/2007", "%d/%m/%Y"))
new$datetime <- strptime(paste(new$Date,new$Time), "%d/%m/%Y %H:%M:%S")


windows()
plot(new$datetime, new$Sub_metering_1, col ="black", type = "l", 
     xlab = "", ylab ="Energy sub metering")
points(new$datetime, new$Sub_metering_2, col ="red", type = "l")
points(new$datetime, new$Sub_metering_3, col ="blue", type = "l")

legend("topright", lwd = 1, col = c("black", "red", "blue"), cex = 0.9,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()