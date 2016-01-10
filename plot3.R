#Data Loading
d<-read.table("d:\\Rdata\\household_power_consumption.txt",
              header=TRUE,sep=";",
              colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),
              na.strings="?")

d$Datetime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")

# Data of 2days
df <- d[(d$Date=="1/2/2007") | (d$Date=="2/2/2007"),]

#plot3
plot(df$Datetime, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(df$Datetime, df$Sub_metering_2, col="red")
lines(df$Datetime, df$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#save PNG
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
