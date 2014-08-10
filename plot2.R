hhc<-read.table("C:/Users/M/Desktop/household_power_consumption.txt",sep=";",na.strings='?', header=T)
#2007-02-01 and 2007-02-02.

names(hhc)
head(hhc)

hhc$Date=as.Date(hhc$Date, format="%d/%m/%Y")

hhc_dates=hhc[hhc$Date>='2007-02-01'& hhc$Date<='2007-02-02',]
head(hhc_dates)

png(filename="plot2.png", width=480, height=480)
plot(1:2880,hhc_dates$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)",xlab="", xaxt="n", yaxt="n")

which(hhc_dates$Time=="00:00:00") #1 1441
axis(side = 1, at = c(1,1441, 2880), labels =c("Thu", "Fri", "Sat") )
axis(side = 2)

dev.off() 

