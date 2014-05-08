## Read the raw data into a dataframe
## Separator is ";"
## "?" are considered NA
raw <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))

## Convert Date Column into a Date Object
raw$Date <- as.Date(raw$Date, format = "%d/%m/%Y")

## Filter dataset based on Date = 2007-02-02 or 2007-02-02
data <- subset(raw, (raw$Date == "2007-02-01" | raw$Date == "2007-02-02"))

## Create new column combining Date and Time
data$timeseries <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

## Plot the Graph plot4.png and save as PNG file
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
with(data, {
    plot(timeseries, Global_active_power, type="l", xlab="", ylab="Global Active Power")
    plot(timeseries, Voltage, type="l", xlab="datetime", ylab="Voltage")
    plot(timeseries, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(timeseries, Sub_metering_2, col = "red")
    lines(timeseries, Sub_metering_3, col = "blue")
    legend("topright", bty="n", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(timeseries, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")    
})
dev.off()
