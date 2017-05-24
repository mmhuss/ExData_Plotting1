# Plot 4

# read in the data
hpc <- read.csv.sql("household_power_consumption.txt", 
                    sql = "select * from file where Date == '1/2/2007' OR Date == '2/2/2007'", 
                    header = TRUE, sep = ";")


# create a date/time object
date_time <- paste(hpc$Date, hpc$Time)
date_time <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S")

# create a file with all four plots

png(filename = "plot4.png")
par(mfrow = c(2,2), mar = c(4,4,2,1))

# Plot 1
plot(date_time, hpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Plot 2
plot(date_time, hpc$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Plot 3
plot(date_time, hpc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(date_time, hpc$Sub_metering_2, col = "red")
lines(date_time, hpc$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, cex = 1, col=c("black","red", "blue"), bty = "n")

# Plot 4
plot(date_time, hpc$Global_reactive_power, type = "h", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
