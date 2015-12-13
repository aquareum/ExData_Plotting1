data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                   stringsAsFactors = FALSE)
new <- subset(data, strptime(data$Date, "%d/%m/%Y") == strptime("01/02/2007", "%d/%m/%Y") | 
                      strptime(data$Date, "%d/%m/%Y") == strptime("02/02/2007", "%d/%m/%Y"))
new$datetime <- strptime(paste(new$Date,new$Time), "%d/%m/%Y %H:%M:%S")


windows()
plot(new$datetime, new$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
     
dev.copy(png, file = "plot2.png")
dev.off()