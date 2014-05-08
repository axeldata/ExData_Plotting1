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

## Plot the Histogram plot1.png and save as PNG file
png(filename = "plot1.png", width = 480, height = 480)
par(mfrow=c(1,1))
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()
