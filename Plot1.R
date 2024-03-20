# Download Dataset Electric power consumption 

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "EPC.zip")
unzip("EPC.zip")

# Import data set in to data frame

HPC <- read.csv("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep=";", na.strings="?")
View(HPC)

# Filter data (subset data) & Convert the date format
library(dplyr)
data <- filter(HPC, Date == "01/02/2007" | Date == "01/02/2007")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Datetime <- as.POSIXct(paste(data$Date, data$Time))

# Generate plot1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Pink")

# Export PNG
dev.copy(png, file = "Plot1.png")
dev.off()