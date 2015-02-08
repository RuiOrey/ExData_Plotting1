##Dataset read
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
## Subset
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Data convert
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
png(file="plot2.png",width=480,height=480)
Sys.setlocale("LC_TIME", "C")
plot(data$Datetime,data$Global_active_power,ylab = "Global Active Power(kilowatts)",main = "",type = "l",xlab = "")
dev.off()

