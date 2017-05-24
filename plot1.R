# Plot 1

# Read in the data
hpc <- read.csv.sql("household_power_consumption.txt", 
                    sql = "select * from file where Date == '1/2/2007' OR Date == '2/2/2007'", 
                    header = TRUE, sep = ";")

# Code to create the png file
png(filename = "plot1.png")

hist(hpc$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power",
     col = "red")

dev.off()
