# Read the data
data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data_main <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(data_main$Date, data_main$Time)
data_main$Datetime <- as.POSIXct(datetime)

png(filename="plot2.png",height=480, width=480)
plot(data_main$Global_active_power~data_main$Datetime,xlab="", ylab="Global Active Power (kilowatts)",type="l")
dev.off()

