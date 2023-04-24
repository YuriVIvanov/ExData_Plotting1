#Read the file
fileCsv <- "household_power_consumption.txt"
data <- read.csv(fileCsv, sep =";")

#Transfort formats of input data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)

#Select the data for two dates
dataSelect <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

#Modify the time by adding to date
install.packages("lubridate")
library(lubridate)

#Plot 1
hist(dataSelect$Global_active_power, col ="red", main="Global Active Power", xlab ="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 1280, height = 1280)
dev.off()
