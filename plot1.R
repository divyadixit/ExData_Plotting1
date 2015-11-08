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

## Creation of Plot 1 in the histogram form :  

png(file = "plot1.png")
		hist(powercompfeb_data$Global_active_power, col = "red", border = "black", main = "Global Active Power", 
			  xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

