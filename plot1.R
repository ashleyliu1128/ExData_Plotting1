# Load the data and keep only data from the two days
powerCons <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
powerCons$Date <- strptime(powerCons$Date, format = "%d/%m/%Y")
subPowerCons <- powerCons[powerCons$Date >= strptime("2007-02-01", "%Y-%m-%d") & powerCons$Date <= strptime("2007-02-02", "%Y-%m-%d"),]

# Plot to png device
png(filename = "plot1.png")
hist(as.numeric(subPowerCons$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()