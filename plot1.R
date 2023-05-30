# Data file Name or path
dataFile <- "household_power_consumption.txt"

# reading the data file, the seperator in this file is ;
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subsetting the data as we are interested in only two days of data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(subSetData$Global_active_power)

# Opening graphics devic , as we want to save generated plot in a png file having widht and heigh 480
png("plot1.png", width=480, height=480)

#command to generate histogram with each bar appearing red in color with main and axis titles
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# closing off the graphics device
dev.off()
