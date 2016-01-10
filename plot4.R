#Data Loading
d<-read.table("d:\\Rdata\\household_power_consumption.txt",
              header=TRUE,sep=";",
              colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),
              na.strings="?")

d$Datetime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")

# Data of 2days
df <- d[(d$Date=="1/2/2007") | (d$Date=="2/2/2007"),]

#plot4 
par(mfrow=c(2,2))
plot(df$Datetime, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(df$Datetime, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(df$Datetime, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(df$Datetime, df$Sub_metering_2, col="red")
lines(df$Datetime, df$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(df$Datetime, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#save PNG
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()