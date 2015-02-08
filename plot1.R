##Dataset read
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
## Subset
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Data convert
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1
png(file="plot1.png",width=480,height=480)
hist(data$Global_active_power,xlab = "Global Active Power (killowats)",main = "Global Active Power",col="red")
dev.off()

##Saving file
