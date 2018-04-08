rm(list = ls())
##1\download the resources from the website
if(!file.exists("./exploratory")) {dir.create("./exploratory")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./exploratory/dataset.zip")
unzip("./exploratory/dataset.zip", exdir = "./exploratory")}

##2\load the dataset into R
dataset <- read.table(text = grep("^[1,2]/2/2007",readLines("./exploratory/household_power_consumption.txt"),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

##3\making plot 1
par(mfrow = c(1,1))
hist(dataset$Global_active_power, xlab = "Global Active Power (kilowatt)", main = "Global Active Power", col = "red")
dev.copy(png, file="./exploratory/plot1.png", height = 480 ,width = 480)
dev.off()

