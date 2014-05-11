house_data <- read.table('household_power_consumption.txt', na.strings='?', sep=';', header=T, colClasses = c('character', 'character', 'numeric','numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'))

house_data$DateTime  <- strptime(paste(house_data$Date, house_data$Time), "%d/%m/%Y %H:%M:%S")

house_data <- subset(house_data, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

png(filename = "plot3.png", width = 480, height = 480, units = "px")

cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

plot(house_data$DateTime, house_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

lines(house_data$DateTime, house_data$Sub_metering_2, type="l", col="red")
lines(house_data$DateTime, house_data$Sub_metering_3, type="l", col="blue")

legend("topright", col=c("black","blue","red"), lty= c(1,1,1), lwd=1, legend=cols)

dev.off()