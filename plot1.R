data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                   stringsAsFactors = FALSE)
new <- subset(data, strptime(data$Date, "%d/%m/%Y") == strptime("01/02/2007", "%d/%m/%Y") | 
                      strptime(data$Date, "%d/%m/%Y") == strptime("02/02/2007", "%d/%m/%Y"))


windows()
hist(new$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")

dev.copy(png, file = "plot1.png")
dev.off()
