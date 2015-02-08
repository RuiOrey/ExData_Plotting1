##Dataset read
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
## Subset
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Data convert
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 3
png(file="plot3.png",width=480,height=480)
plot(data$Datetime,data$Sub_metering_1,ylab = "Energy sub metering",main = "",type = "l",xlab = "")
lines(data$Datetime,data$Sub_metering_2,col="red")
lines(data$Datetime,data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1 ,col= c("black","red","blue"))
dev.off()
