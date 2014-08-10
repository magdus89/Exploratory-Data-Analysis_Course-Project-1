hhc<-read.table("C:/Users/M/Desktop/household_power_consumption.txt",sep=";",na.strings='?', header=T)
#2007-02-01 and 2007-02-02.

names(hhc)
head(hhc)

hhc$Date=as.Date(hhc$Date, format="%d/%m/%Y")

hhc_dates=hhc[hhc$Date>='2007-02-01'& hhc$Date<='2007-02-02',]
head(hhc_dates)

png(filename="plot1.png", width=480, height=480)

hist(as.numeric(hhc_dates$Global_active_power), xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", col="red")
 
dev.off() 



