house_data <- read.table('household_power_consumption.txt', na.strings='?', sep=';', header=T, colClasses = c('character', 'character', 'numeric','numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'))

house_data$DateTime  <- strptime(paste(house_data$Date, house_data$Time), "%d/%m/%Y %H:%M:%S")

house_data <- subset(house_data, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(house_data$DateTime, house_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()