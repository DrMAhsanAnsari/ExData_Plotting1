# Data file name
dataFile <- "household_power_consumption.txt"

# reading data, the data is ; seperated list of variables
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subsetting data so that It contains data of only two days
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# using strptime function to convert data/time variables to data/time classess
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


globalActivePower <- as.numeric(subSetData$Global_active_power)

# Opening a new grpahics device as png of size 480 width and 480 height
png("plot2.png", width=480, height=480)

# generating plot with proper annotations
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# closing the current graphics device
dev.off()