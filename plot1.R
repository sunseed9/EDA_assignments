#Data Loading
d<-read.table("d:\\Rdata\\household_power_consumption.txt",
              header=TRUE,sep=";",
              colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),
              na.strings="?")

d$Datetime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")

# Data of 2days
df <- d[(d$Date=="1/2/2007") | (d$Date=="2/2/2007"),]

#plot1
hist(df$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequncy", main="Global Active Power")

#save PNG
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
