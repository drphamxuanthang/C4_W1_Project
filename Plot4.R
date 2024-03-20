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

# Generate plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))


with(data, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="")
  with(data, {plot(Sub_metering_1~Datetime, ylab="Global Active Power (kilowatts)", xlab="",type="n")
    lines(Sub_metering_1~Datetime,col='Black')
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
  })
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})


# Export PNG
dev.copy(png, file = "Plot4.png")
dev.off()