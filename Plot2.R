# Download Dataset Electric power consumption 

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "EPC.zip")
unzip("EPC.zip")

# Import data set in to data frame

HPC <- read.csv("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep=";", na.strings="?")
View(HPC)

# Filter data (subset data) & Convert the date format
library(dplyr)
HPC$Date <- as.Date(HPC$Date, format = "%d/%m/%Y")
data <- filter(HPC, Date == "2007-02-01" | Date == "2007-02-02")
data$Datetime <- as.POSIXct(paste(data$Date, data$Time))

# Generate plot2
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")


# Export PNG
dev.copy(png, file = "Plot2.png")
dev.off()