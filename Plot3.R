rm(list = ls())
##1\download the resources from the website
if(!file.exists("./exploratory")) {dir.create("./exploratory")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./exploratory/dataset.zip")
unzip("./exploratory/dataset.zip", exdir = "./exploratory")}

##2\load the dataset into R
dataset <- read.table(text = grep("^[1,2]/2/2007",readLines("./exploratory/household_power_consumption.txt"),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

##making plot 3
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
dataset$Time <- as.POSIXct(paste(dataset$Date, dataset$Time))
Sys.setlocale(category = "LC_ALL", locale = "english")
with(dataset, plot(Time, Sub_metering_1, ylab = "Energy sub melting", xlab = "", main = "", type = "n"))
with(dataset,lines(Time, Sub_metering_1, col = "black"))
with(dataset,lines(Time, Sub_metering_2, col = "red"))
with(dataset,lines(Time, Sub_metering_3, col = "blue"))
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
dev.copy(png, file="./exploratory/plot3.png",height = 480 ,width = 480)
dev.off()