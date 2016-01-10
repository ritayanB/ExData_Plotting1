#Setting the necessary parameters and suybsetting the data: start
setwd("D:/Cloud Storage/Google Drive/Coursera/03. Data Scientists Toolbox/04. Exploratory Data Analysis")
pow <- read.csv("household_power_consumption.txt", sep = ";")
selPowData <- rbind(subset(pow, pow$Date == "1/2/2007"), subset(pow, pow$Date == "2/2/2007"))
selPowData$Global_active_power <- as.numeric(as.character(selPowData$Global_active_power))
selPowData <-  cbind(selPowData, strptime(paste(selPowData$Date, selPowData$Time), 
                                          format = "%d/%m/%Y %H:%M:%S"))
names(selPowData)[10] <- "Date_Time"
#Setting the necessary parameters and suybsetting the data: end

png(filename = "plot2.png", width = 480, height = 480, units = "px");

plot(selPowData$Date_Time, selPowData$Global_active_power, type="n", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
lines(selPowData$Date_Time, selPowData$Global_active_power)

dev.off()