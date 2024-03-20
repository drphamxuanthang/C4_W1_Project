# Download Dataset Electric power consumption 

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "EPC.zip")
unzip("EPC.zip")

# Import data set in to data frame

HPC <- read.csv("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep=";", na.strings="?")
View(HPC)
HPC$Date <- as.Date(HPC$Date, format = "%d/%m/%Y")

# Filter data (subset data) & Convert the date format
library(dplyr)
data <- filter(HPC, Date >= "2007-02-01" & Date <= "2007-02-02")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Generate plot1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Pink")