##Dataset read
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
## Subset
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Data convert
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 4 file
png(file="plot4.png",width=480,height=480)
par(mfrow = c(2, 2))

## plot 1
plot(data$Datetime,data$Global_active_power,ylab = "Global Active Power",main = "",type = "l",xlab = "")

## plot 2
plot(data$Datetime,data$Voltage,ylab = "Voltage",main = "",type = "l",xlab = "datetime")


## plot 3
plot(data$Datetime,data$Sub_metering_1,ylab = "Energy sub metering",main = "",type = "l",xlab = "")
lines(data$Datetime,data$Sub_metering_2,col="red")
lines(data$Datetime,data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1 ,col= c("black","red","blue"),bty="n")

##plot 4
plot(data$Datetime,data$Global_reactive_power,ylab = "Global_reactive_power",main = "",type = "l",xlab = "datetime")
dev.off()

