# Load the data and keep only data from the two days
powerCons <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
powerCons$DateTime <- paste(powerCons$Date, powerCons$Time, sep = " ")
powerCons$DateTime <- strptime(powerCons$DateTime, format = "%d/%m/%Y %H:%M:%S")
powerCons$Date <- strptime(powerCons$Date, format = "%d/%m/%Y")
subPowerCons <- powerCons[powerCons$Date >= strptime("2007-02-01", "%Y-%m-%d") & powerCons$Date <= strptime("2007-02-02", "%Y-%m-%d"),]

# Plot to png device
png(filename = "plot2.png")
with(subPowerCons, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()