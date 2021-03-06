house_data <- read.table('household_power_consumption.txt', na.strings='?', sep=';', header=T, colClasses = c('character', 'character', 'numeric','numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'))

house_data$DateTime <- strptime(paste(house_data$Date, house_data$Time), "%d/%m/%Y %H:%M:%S")

house_data <- subset(house_data, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

png("plot1.png", height=480, width=480, units = "px")

hist(house_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()