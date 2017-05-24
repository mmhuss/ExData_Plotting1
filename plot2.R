# Plot 2

# Read in the data
hpc <- read.csv.sql("household_power_consumption.txt", 
                    sql = "select * from file where Date == '1/2/2007' OR Date == '2/2/2007'", 
                    header = TRUE, sep = ";")

# create a date/time object
date_time <- paste(hpc$Date, hpc$Time)
date_time <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S")

# create the png
# Note: "Do", "Fr", "Sa" on the x-lab are the german abbreviations of Thursday, Friday, Saturday
png(filename = "plot2.png")

plot(date_time, hpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
