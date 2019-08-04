# Loading data from the source
household_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = '?', stringsAsFactors = FALSE, dec = ".")

# Filtering the required data set
filteredData <- household_data[household_data$Date %in% c("1/2/2007", "2/2/2007"), ]

filteredData$Date <- as.Date(filteredData$Date, format = "%d/%m/%Y")
filteredData$DateTime <- paste(as.Date(filteredData$Date), filteredData$Time)
filteredData$DateTime <- as.POSIXct(filteredData$DateTime)

png("plot3.png", height = 480, width=480)
with(filteredData, plot(Sub_metering_1~DateTime, type = "n", ylab = "Energy sub metering", xlab = ""))

lines(filteredData$Sub_metering_1~filteredData$DateTime, col="black")
lines(filteredData$Sub_metering_2~filteredData$DateTime, col="red")
lines(filteredData$Sub_metering_3~filteredData$DateTime, col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), lwd = c(2.5,2.5,2.5), col = c("black", "red", "blue"))

dev.off()