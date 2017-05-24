# Plot 3

# read in the data
hpc <- read.csv.sql("household_power_consumption.txt", 
                    sql = "select * from file where Date == '1/2/2007' OR Date == '2/2/2007'", 
                    header = TRUE, sep = ";")

# create a date/time object
date_time <- paste(hpc$Date, hpc$Time)
date_time <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S")


# create the plot
png(filename = "plot3.png")

plot(date_time, hpc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(date_time, hpc$Sub_metering_2, col = "red")
lines(date_time, hpc$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, cex = 1, col=c("black","red", "blue"))

dev.off()
