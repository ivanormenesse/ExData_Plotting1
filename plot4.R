##Reading the data frame if you don't have it loaded
## Just leave the zip file on your working directory and run:

unzip(".\\exdata-data-household_power_consumption.zip", exdir=".\\dataset")
consum<- read.table(".\\dataset\\household_power_consumption.txt",
                    header = TRUE,
                    sep =";",
                    na.strings="?")

consum2<-consum[which(as.Date(consum$Date, "%d/%m/%Y")=="2007-02-01"|
                            as.Date(consum$Date, "%d/%m/%Y")=="2007-02-02"),]

rm(consum)

##Making plot 4

png(filename="plot4.png",width = 480, height = 480)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(consum2$Global_active_power, type="n", 
     ylab="Global Active Power (kilowatts)",
     xlab="",
     xaxt="n"
)
lines(consum2$Global_active_power)
axis(1,at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))

plot(consum2$Voltage, type="n", 
     ylab="Voltage",
     xlab="datetime",
     xaxt="n"
)
lines(consum2$Voltage)
axis(1,at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))

plot(consum2$Sub_metering_1, type="n", 
     ylab="Energy sub metering",
     xlab="",
     xaxt="n")
axis(1,at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
lines(consum2$Sub_metering_1)
lines(consum2$Sub_metering_2, col = "red")
lines(consum2$Sub_metering_3, col = "blue")
legend("topright", lty=1, bty="n",
       col = c("black", "red","Blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(consum2$Global_reactive_power, type="n", 
     ylab="Global_reactive_power",
     xlab="datetime",
     xaxt="n"
)
lines(consum2$Global_reactive_power)
axis(1,at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))

dev.off()