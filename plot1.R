#Setting the necessary parameters and suybsetting the data: start
setwd("D:/Cloud Storage/Google Drive/Coursera/03. Data Scientists Toolbox/04. Exploratory Data Analysis")
pow <- read.csv("household_power_consumption.txt", sep = ";")
selPowData <- rbind(subset(pow, pow$Date == "1/2/2007"), subset(pow, pow$Date == "2/2/2007"))
selPowData$Global_active_power <- as.numeric(as.character(selPowData$Global_active_power))
#Setting the necessary parameters and suybsetting the data: end

png(filename = "plot1.png", width = 480, height = 480, units = "px");

hist(selPowData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()