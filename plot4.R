hhc<-read.table("C:/Users/M/Desktop/household_power_consumption.txt",sep=";",na.strings='?', header=T)
#2007-02-01 and 2007-02-02.

names(hhc)
head(hhc)

hhc$Date=as.Date(hhc$Date, format="%d/%m/%Y")

hhc_dates=hhc[hhc$Date>='2007-02-01'& hhc$Date<='2007-02-02',]
head(hhc_dates)


png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2))
plot(1:2880,hhc_dates$Global_active_power, type="l",
     ylab="Global Active Power",xlab="", xaxt="n", yaxt="n")

which(hhc_dates$Time=="00:00:00") #1 1441
axis(side = 1, at = c(1,1441, 2880), labels =c("Thu", "Fri", "Sat") )
axis(side = 2)

plot(1:2880,hhc_dates$Voltage, type="l",
     ylab="Voltage", xaxt="n", yaxt="n", xlab="datetime")

which(hhc_dates$Time=="00:00:00") #1 1441
axis(side = 1, a= c(1,1441, 2880), labels =c("Thu", "Fri", "Sat") )
axis(side = 2)


plot(1:2880,hhc_dates$Sub_metering_1 , 
     , type="l",
     ylab="Energy sub metering",xlab="", xaxt="n", yaxt="n")
points(1:2880, hhc_dates$Sub_metering_2, type="l", col="red")
points(1:2880, hhc_dates$Sub_metering_3, type="l", col="blue")
axis(side = 1, at = c(1,1441, 2880), labels =c("Thu", "Fri", "Sat") )

axis(side=2, at=c(0,10,20,30))

legend('topright', legend=c("Sub_metering_1", 
                            "Sub_metering_2",
                            "Sub_metering_3"), bty="n",lty=1, col=c("black", "red", "blue"))


plot(1:2880,hhc_dates$Global_reactive_power, type="l",
     ylab="Global_reactive_power", xaxt="n", yaxt="n", xlab="datetime")

which(hhc_dates$Time=="00:00:00") #1 1441
axis(side = 1, at = c(1,1441, 2880), labels =c("Thu", "Fri", "Sat") )
axis(side = 2)


dev.off() 

