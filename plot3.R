library(lubridate)

# Loading the dataset :

housing_powercomp <- read.table(file = "./household_pc/household_power_consumption.txt", header = TRUE, sep = ";", 
					colClasses = "character", na.strings = "?")
# subsetting based on the row numbers of the required date and time
powercompfeb_data <- housing_powercomp[66637:69516,]    
rm("housing_powercomp")  # removing the bigger dataset in order to conserve memory

## Type conversions of all columns into either numeric or date format :

powercompfeb_data$Global_active_power <- as.double(powercompfeb_data$Global_active_power)
powercompfeb_data$Global_reactive_power <- as.double(powercompfeb_data$Global_reactive_power)
powercompfeb_data$Voltage <- as.double(powercompfeb_data$Voltage)
powercompfeb_data$Global_intensity <- as.double(powercompfeb_data$Global_intensity)
powercompfeb_data$Sub_metering_1 <- as.double(powercompfeb_data$Sub_metering_1)
powercompfeb_data$Sub_metering_2 <- as.double(powercompfeb_data$Sub_metering_2)
powercompfeb_data$Sub_metering_3 <- as.double(powercompfeb_data$Sub_metering_3)
# combinging date and time columns together and then converting into a single date format
powercompfeb_data$Date <- dmy_hms(paste(powercompfeb_data$Date, powercompfeb_data$Time, sep = " ")) 
powercompfeb_data <- powercompfeb_data[,-2] ## eliminating the time column

## Creation of Plot 3 in the line chart form with multiple variables plotted on y-axes :  

png(file = "plot3.png")
		plot(x = powercompfeb_data$Date, y = powercompfeb_data$Sub_metering_1, type = "l", 
			 xlab = NA, ylab = "Energy sub metering ", col = "black")
		lines(x = powercompfeb_data$Date, y = powercompfeb_data$Sub_metering_2, type = "l", col = "red")
		lines(x = powercompfeb_data$Date, y = powercompfeb_data$Sub_metering_3, type = "l", col = "blue")
		legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
				lty = 1, lwd = 1, col = c("black","red","blue"), cex = 0.8)
dev.off()

