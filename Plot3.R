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
#install.packages("lubridate")
#library(lubridate)

#Get time scale
d <- ymd(dataSelect$Date)
hour(d) <- as.numeric(substr(dataSelect$Time, 1, 2))
minute(d) <- as.numeric(substr(dataSelect$Time, 4, 5))
second(d) <- as.numeric(substr(dataSelect$Time, 7, 8))

#Plot 3
plot(d, dataSelect$Sub_metering_1, type="l", xlab="", ylab ="Energy sub metering")
lines(d, dataSelect$Sub_metering_2, type="l", col="red")
lines(d, dataSelect$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1,1), col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", width = 1280, height = 1280)
dev.off()
