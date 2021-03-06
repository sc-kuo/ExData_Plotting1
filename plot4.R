library(ggplot2)
library(lubridate)

main<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
main$Date<-as.Date(main$Date,format="%d/%m/%Y")
main$Time<-format(main$Time,format="%H:$M:%S")
main[,3]<-as.numeric(main[,3])
needed<-main[which(main$Date == "2007-02-01" | main$Date=="2007-02-02"),]
needed$timeanddate<-strptime(paste(needed$Date,needed$Time,sep=" "),"%Y-%m-%d %H:%M:%S")
needed[,4]<-as.numeric(needed[,4])
needed[,5]<-as.numeric(needed[,5])
sub1<-as.numeric(needed[,7])
sub2<-as.numeric(needed[,8])
sub3<-as.numeric(needed[,9])

png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))

#plot1
plot(needed$timeanddate,needed$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#plot2
plot(needed$timeanddate,needed$Voltage,type="l",xlab="datetime",ylab="Voltage")

#plot3
plot(needed$timeanddate,sub1,type="l",xlab="",ylab="Energy sub metering")
lines(needed$timeanddate,sub2,col="red",type="l")
lines(needed$timeanddate,sub3,col="blue",type="l")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))

#plot4
plot(needed$timeanddate,needed$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")

dev.off()

