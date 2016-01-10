#Setting the necessary parameters and suybsetting the data: start
setwd("D:/Cloud Storage/Google Drive/Coursera/03. Data Scientists Toolbox/04. Exploratory Data Analysis")
pow <- read.csv("household_power_consumption.txt", sep = ";")
selPowData <- rbind(subset(pow, pow$Date == "1/2/2007"), subset(pow, pow$Date == "2/2/2007"))
selPowData$Global_active_power <- as.numeric(as.character(selPowData$Global_active_power))
selPowData <-  cbind(selPowData, strptime(paste(selPowData$Date, selPowData$Time), 
                                          format = "%d/%m/%Y %H:%M:%S"))
selPowData$Sub_metering_1 <- as.numeric(as.character(selPowData$Sub_metering_1))
selPowData$Sub_metering_2 <- as.numeric(as.character(selPowData$Sub_metering_2))
selPowData$Sub_metering_3 <- as.numeric(as.character(selPowData$Sub_metering_3))
selPowData$Voltage <- as.numeric(as.character(selPowData$Voltage))
selPowData$Global_reactive_power <- as.numeric(as.character(selPowData$Global_reactive_power))
names(selPowData)[10] <- "Date_Time"

#Setting the necessary parameters and suybsetting the data: end

png(filename = "plot4.png", width = 480, height = 480, units = "px");

#setting number of plots to be drawn
par(mfrow=c(2,2))

#First plot: Start
plot(selPowData$Date_Time, selPowData$Global_active_power, type="n", 
     ylab = "Global Active Power", xlab = "")
lines(selPowData$Date_Time, selPowData$Global_active_power)
#First plot: end

#Second plot: start
plot(selPowData$Date_Time, selPowData$Voltage, ylab = "Voltage", xlab = "datetime", type = "n")
lines(selPowData$Date_Time, selPowData$Voltage)
#Second plot: end

#Third plot: start
plot(selPowData$Date_Time, selPowData$Sub_metering_1, type="n", 
     ylab = "Energy sub metering", xlab = "")
lines(selPowData$Date_Time, selPowData$Sub_metering_1)
lines(selPowData$Date_Time, selPowData$Sub_metering_2, col = "red")
lines(selPowData$Date_Time, selPowData$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1,1,1), cex = .2, text.font = 1)
#Third plot: end

#Fourth plot: start
plot(selPowData$Date_Time, selPowData$Global_reactive_power, xlab = "datetime", 
     ylab = "Global_reactive_power", type = "n")
lines(selPowData$Date_Time, selPowData$Global_reactive_power)
#Fourth plot: end

dev.off()