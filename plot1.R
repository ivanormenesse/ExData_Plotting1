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

##Making plot 1

png(filename="plot1.png",width = 480, height = 480)
hist(consum2$Global_active_power, col="red",
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()