# Loading data from the source
household_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = '?', stringsAsFactors = FALSE, dec = ".")

# Filtering the required data set
filteredData <- household_data[household_data$Date %in% c("1/2/2007", "2/2/2007"), ]

filteredData$Date <- as.Date(filteredData$Date, format = "%d/%m/%Y")
filteredData$DateTime <- paste(as.Date(filteredData$Date), filteredData$Time)
filteredData$DateTime <- as.POSIXct(filteredData$DateTime)

png("plot2.png", height = 480, width=480)
with(filteredData, plot(Global_active_power~DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()