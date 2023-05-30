# data file path or Name
dataFile <- "household_power_consumption.txt"

# Command to read the ; seperated data file
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subsetting data of two days
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert data and time variables and other variables to proper types
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# Opening a graphics PNG device with width and height of 480
png("plot3.png", width=480, height=480)

# Generating plot
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

# adding lines and annotations to the plot
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Turning the PNG graphics device off
dev.off()