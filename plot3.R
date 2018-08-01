# Load the data and keep only data from the two days
powerCons <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
powerCons$DateTime <- paste(powerCons$Date, powerCons$Time, sep = " ")
powerCons$DateTime <- strptime(powerCons$DateTime, format = "%d/%m/%Y %H:%M:%S")
powerCons$Date <- strptime(powerCons$Date, format = "%d/%m/%Y")
subPowerCons <- powerCons[powerCons$Date >= strptime("2007-02-01", "%Y-%m-%d") & powerCons$Date <= strptime("2007-02-02", "%Y-%m-%d"),]

# Plot to png device
png(filename = "plot3.png")
with(subPowerCons, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
lines(subPowerCons$DateTime, subPowerCons$Sub_metering_2, type = "l", col = "red")
lines(subPowerCons$DateTime, subPowerCons$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1.5)
dev.off()