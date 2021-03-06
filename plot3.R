#Setting the necessary parameters and suybsetting the data: start
setwd("D:/Cloud Storage/Google Drive/Coursera/03. Data Scientists Toolbox/04. Exploratory Data Analysis")
pow <- read.csv("household_power_consumption.txt", sep = ";")
selPowData <- rbind(subset(pow, pow$Date == "1/2/2007"), subset(pow, pow$Date == "2/2/2007"))
selPowData$Global_active_power <- as.numeric(as.character(selPowData$Global_active_power))
selPowData <-  cbind(selPowData, strptime(paste(selPowData$Date, selPowData$Time), 
                                          format = "%d/%m/%Y %H:%M:%S"))
names(selPowData)[10] <- "Date_Time"
selPowData$Sub_metering_1 <- as.numeric(as.character(selPowData$Sub_metering_1))
selPowData$Sub_metering_2 <- as.numeric(as.character(selPowData$Sub_metering_2))
selPowData$Sub_metering_3 <- as.numeric(as.character(selPowData$Sub_metering_3))
#Setting the necessary parameters and suybsetting the data: end

png(filename = "plot3.png", width = 480, height = 480, units = "px");

plot(selPowData$Date_Time, selPowData$Sub_metering_1, type="n", 
     ylab = "Energy sub metering", xlab = "")
lines(selPowData$Date_Time, selPowData$Sub_metering_1)
lines(selPowData$Date_Time, selPowData$Sub_metering_2, col = "red")
lines(selPowData$Date_Time, selPowData$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1,1,1), cex = .6, text.font = 1)

dev.off()