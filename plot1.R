# Loading data from the source
household_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = '?', stringsAsFactors = FALSE, dec = ".")

# Filtering the required data set
filteredData <- household_data[household_data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Plotting
png("plot1.png", height = 480, width=480)
hist(as.numeric(as.character(filteredData$Global_active_power)),col= "red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()